import 'dart:async';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:voxcita/core/audio/audio_recorder_service.dart';

class AudioRecorderServiceImpl implements AudioRecorderService {
  AudioRecorderServiceImpl();

  final AudioRecorder _recorder = AudioRecorder();
  StreamSubscription<Amplitude>? _amplitudeSub;
  StreamController<AmplitudeSample>? _amplitudeController;

  bool _isRecording = false;
  bool _isPaused = false;
  DateTime? _startedAt;
  int _pausedDurationMs = 0;
  DateTime? _pausedAt;

  @override
  bool get isRecording => _isRecording;

  @override
  bool get isPaused => _isPaused;

  @override
  Future<bool> hasPermission() async {
    final status = await Permission.microphone.status;
    return status.isGranted;
  }

  @override
  Future<bool> requestPermission() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  @override
  Future<void> start(String filePath) async {
    if (_isRecording) {
      throw const RecordingException(RecordingExceptionType.alreadyRecording);
    }

    if (!await hasPermission()) {
      final granted = await requestPermission();
      if (!granted) {
        throw const RecordingException(RecordingExceptionType.permissionDenied);
      }
    }

    _amplitudeController = StreamController<AmplitudeSample>.broadcast();

    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        sampleRate: 44100,
        autoGain: true,
        echoCancel: true,
        noiseSuppress: true,
      ),
      path: filePath,
    );

    _isRecording = true;
    _isPaused = false;
    _startedAt = DateTime.now();
    _pausedDurationMs = 0;

    _amplitudeSub = _recorder
        .onAmplitudeChanged(const Duration(milliseconds: 100))
        .listen((amp) {
          _amplitudeController?.add(
            AmplitudeSample(current: amp.current, max: amp.max),
          );
        });
  }

  @override
  Future<void> pause() async {
    if (!_isRecording) {
      throw const RecordingException(RecordingExceptionType.notRecording);
    }
    if (_isPaused) return;

    await _recorder.pause();
    _isPaused = true;
    _pausedAt = DateTime.now();
  }

  @override
  Future<void> resume() async {
    if (!_isRecording || !_isPaused) return;

    await _recorder.resume();
    if (_pausedAt != null) {
      _pausedDurationMs += DateTime.now().difference(_pausedAt!).inMilliseconds;
      _pausedAt = null;
    }
    _isPaused = false;
  }

  @override
  Future<RecordingResult> stop() async {
    if (!_isRecording) {
      throw const RecordingException(RecordingExceptionType.notRecording);
    }

    await _amplitudeSub?.cancel();
    _amplitudeSub = null;

    final path = await _recorder.stop();
    if (path == null) {
      throw const RecordingException(RecordingExceptionType.encoderError);
    }

    final endTime = DateTime.now();
    final totalDurationMs =
        endTime.difference(_startedAt!).inMilliseconds - _pausedDurationMs;

    _isRecording = false;
    _isPaused = false;
    _startedAt = null;
    _pausedDurationMs = 0;
    _pausedAt = null;

    await _amplitudeController?.close();
    _amplitudeController = null;

    final file = File(path);
    final fileSize = await file.length();

    return RecordingResult(
      path: path,
      durationMs: totalDurationMs,
      fileSizeBytes: fileSize,
    );
  }

  @override
  Future<void> cancel() async {
    if (!_isRecording) return;

    await _amplitudeSub?.cancel();
    _amplitudeSub = null;

    await _recorder.cancel();

    _isRecording = false;
    _isPaused = false;
    _startedAt = null;
    _pausedDurationMs = 0;
    _pausedAt = null;

    await _amplitudeController?.close();
    _amplitudeController = null;
  }

  @override
  Stream<AmplitudeSample> amplitudeStream() {
    if (_amplitudeController == null) {
      throw const RecordingException(RecordingExceptionType.notRecording);
    }
    return _amplitudeController!.stream;
  }

  Future<void> dispose() async {
    await _amplitudeSub?.cancel();
    await _amplitudeController?.close();
    await _recorder.dispose();
  }
}
