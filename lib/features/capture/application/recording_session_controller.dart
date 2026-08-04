import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voxcita/core/audio/audio_recorder_service.dart';
import 'package:voxcita/core/audio/file_storage_service.dart';
import 'package:voxcita/features/capture/application/recording_session_state.dart';
import 'package:voxcita/features/capture/domain/audio_repository.dart';
import 'package:voxcita/features/capture/domain/recording_session_status.dart';
import 'package:voxcita/features/library/domain/note_repository.dart';
import 'package:voxcita/features/library/domain/note_type.dart';

class RecordingSessionController extends StateNotifier<RecordingSessionState> {
  RecordingSessionController({
    required AudioRecorderService recorderService,
    required FileStorageService fileStorageService,
    required AudioRepository audioRepository,
    required NoteRepository noteRepository,
  }) : _recorderService = recorderService,
       _fileStorageService = fileStorageService,
       _audioRepository = audioRepository,
       _noteRepository = noteRepository,
       super(const RecordingSessionState());

  final AudioRecorderService _recorderService;
  final FileStorageService _fileStorageService;
  final AudioRepository _audioRepository;
  final NoteRepository _noteRepository;

  StreamSubscription<AmplitudeSample>? _amplitudeSub;
  Timer? _elapsedTimer;
  int _elapsedMs = 0;
  DateTime? _lastTickAt;

  Future<bool> ensurePermission() async {
    if (await _recorderService.hasPermission()) return true;
    return _recorderService.requestPermission();
  }

  Future<void> startRecording() async {
    if (state.isRecording) return;

    state = state.copyWith(status: RecordingSessionStatus.created, error: null);

    final hasPermission = await ensurePermission();
    if (!hasPermission) {
      state = state.copyWith(
        status: RecordingSessionStatus.failed,
        error: 'Microphone permission denied',
      );
      return;
    }

    final session = await _audioRepository.createRecordingSession();
    _elapsedMs = 0;

    final tempFileName = '${session.id}.m4a';
    final tempPath = await _fileStorageService.generateAudioFilePath(
      tempFileName,
    );

    try {
      await _recorderService.start(tempPath);
    } on RecordingException catch (e) {
      state = state.copyWith(
        status: RecordingSessionStatus.failed,
        error: e.message ?? e.type.name,
      );
      return;
    }

    _startTimer();
    _subscribeAmplitude();

    state = state.copyWith(
      status: RecordingSessionStatus.recording,
      sessionId: session.id,
      elapsedMs: 0,
    );

    await _audioRepository.updateSessionStatus(
      session.id,
      RecordingSessionStatus.recording.name,
    );
  }

  Future<void> pauseRecording() async {
    if (!state.isRecording) return;

    try {
      await _recorderService.pause();
      _stopTimer();
      _amplitudeSub?.cancel();
      _amplitudeSub = null;

      state = state.copyWith(status: RecordingSessionStatus.paused);

      await _audioRepository.updateSessionStatus(
        state.sessionId!,
        RecordingSessionStatus.paused.name,
        checkpointMs: _elapsedMs,
      );
    } on RecordingException catch (e) {
      state = state.copyWith(
        status: RecordingSessionStatus.failed,
        error: e.message ?? e.type.name,
      );
    }
  }

  Future<void> resumeRecording() async {
    if (!state.isPaused) return;

    try {
      await _recorderService.resume();
      _startTimer();
      _subscribeAmplitude();

      state = state.copyWith(status: RecordingSessionStatus.recording);

      await _audioRepository.updateSessionStatus(
        state.sessionId!,
        RecordingSessionStatus.recording.name,
      );
    } on RecordingException catch (e) {
      state = state.copyWith(
        status: RecordingSessionStatus.failed,
        error: e.message ?? e.type.name,
      );
    }
  }

  Future<String?> stopRecording() async {
    if (!state.isRecording && !state.isPaused) return null;

    RecordingResult? result;
    try {
      result = await _recorderService.stop();
    } on RecordingException catch (e) {
      state = state.copyWith(
        status: RecordingSessionStatus.failed,
        error: e.message ?? e.type.name,
      );
      return null;
    }

    _stopTimer();
    _amplitudeSub?.cancel();
    _amplitudeSub = null;

    final sha256Hash = await _fileStorageService.computeSha256Hash(result.path);

    final relativePath = await _fileStorageService.getRelativePath(result.path);

    final audioAsset = await _audioRepository.createAudioAsset(
      relativePath: relativePath,
      durationMs: result.durationMs,
      fileSizeBytes: result.fileSizeBytes,
      sha256Hash: sha256Hash,
    );

    final note = await _noteRepository.createNote(
      title: 'Recording ${_formatTimestamp(result.durationMs)}',
      body: '',
      noteType: NoteType.voice.name,
      audioAssetId: audioAsset.id,
    );

    await _audioRepository.updateSessionStatus(
      state.sessionId!,
      RecordingSessionStatus.completed.name,
      audioAssetId: audioAsset.id,
      noteId: note.id,
      endedAt: DateTime.now().toUtc(),
    );

    state = state.copyWith(
      status: RecordingSessionStatus.completed,
      elapsedMs: result.durationMs,
    );

    return note.id;
  }

  Future<void> cancelRecording() async {
    if (!state.isRecording && !state.isPaused) return;

    await _recorderService.cancel();
    _stopTimer();
    _amplitudeSub?.cancel();
    _amplitudeSub = null;

    if (state.sessionId != null) {
      await _audioRepository.updateSessionStatus(
        state.sessionId!,
        RecordingSessionStatus.cancelled.name,
        endedAt: DateTime.now().toUtc(),
      );
    }

    state = state.copyWith(
      status: RecordingSessionStatus.cancelled,
      elapsedMs: 0,
      amplitude: 0,
      maxAmplitude: 0,
    );
  }

  void reset() {
    _stopTimer();
    _amplitudeSub?.cancel();
    _amplitudeSub = null;
    _elapsedMs = 0;
    state = const RecordingSessionState();
  }

  void _startTimer() {
    _lastTickAt = DateTime.now();
    _elapsedTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      if (_lastTickAt != null) {
        _elapsedMs += now.difference(_lastTickAt!).inMilliseconds;
        _lastTickAt = now;
      }
      state = state.copyWith(elapsedMs: _elapsedMs);
    });
  }

  void _stopTimer() {
    _elapsedTimer?.cancel();
    _elapsedTimer = null;
    _lastTickAt = null;
  }

  void _subscribeAmplitude() {
    _amplitudeSub = _recorderService.amplitudeStream().listen((sample) {
      state = state.copyWith(
        amplitude: sample.current,
        maxAmplitude: sample.max,
      );
    });
  }

  String _formatTimestamp(int durationMs) {
    final totalSeconds = durationMs ~/ 1000;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _stopTimer();
    _amplitudeSub?.cancel();
    super.dispose();
  }
}
