import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:voxcita/core/audio/audio_recorder_service.dart';
import 'package:voxcita/core/audio/file_storage_service.dart';
import 'package:voxcita/features/capture/application/recording_session_state.dart';
import 'package:voxcita/features/capture/domain/recording_session_status.dart';

void main() {
  group('RecordingSessionState', () {
    test('default state is created/idle', () {
      const state = RecordingSessionState();
      expect(state.status, RecordingSessionStatus.created);
      expect(state.isIdle, isTrue);
      expect(state.isRecording, isFalse);
      expect(state.isPaused, isFalse);
      expect(state.hasError, isFalse);
      expect(state.elapsedMs, 0);
      expect(state.amplitude, 0);
    });

    test('isRecording is true when status is recording', () {
      const state = RecordingSessionState(
        status: RecordingSessionStatus.recording,
      );
      expect(state.isRecording, isTrue);
      expect(state.isIdle, isFalse);
    });

    test('isPaused is true when status is paused', () {
      const state = RecordingSessionState(
        status: RecordingSessionStatus.paused,
      );
      expect(state.isPaused, isTrue);
      expect(state.isIdle, isFalse);
    });

    test('hasError is true when error is set', () {
      const state = RecordingSessionState(error: 'Something went wrong');
      expect(state.hasError, isTrue);
    });

    test('copyWith creates a modified copy', () {
      const state = RecordingSessionState();
      final modified = state.copyWith(
        status: RecordingSessionStatus.recording,
        sessionId: 'test-session',
        elapsedMs: 5000,
      );
      expect(modified.status, RecordingSessionStatus.recording);
      expect(modified.sessionId, 'test-session');
      expect(modified.elapsedMs, 5000);
      expect(modified.error, isNull);
    });

    test('copyWith clears error when not provided', () {
      const state = RecordingSessionState(error: 'Old error');
      final modified = state.copyWith(status: RecordingSessionStatus.recording);
      expect(modified.error, isNull);
      expect(modified.hasError, isFalse);
    });
  });

  group('AmplitudeSample', () {
    test('stores current and max values', () {
      const sample = AmplitudeSample(current: -20.0, max: -10.0);
      expect(sample.current, -20.0);
      expect(sample.max, -10.0);
    });
  });

  group('RecordingResult', () {
    test('stores path, duration and file size', () {
      const result = RecordingResult(
        path: '/tmp/test.m4a',
        durationMs: 30000,
        fileSizeBytes: 48000,
      );
      expect(result.path, '/tmp/test.m4a');
      expect(result.durationMs, 30000);
      expect(result.fileSizeBytes, 48000);
    });
  });

  group('RecordingException', () {
    test('stores type and message', () {
      const exception = RecordingException(
        RecordingExceptionType.permissionDenied,
        'Microphone access denied',
      );
      expect(exception.type, RecordingExceptionType.permissionDenied);
      expect(exception.message, 'Microphone access denied');
    });

    test('toString includes type and message', () {
      const exception = RecordingException(RecordingExceptionType.notRecording);
      expect(
        exception.toString(),
        'RecordingException(RecordingExceptionType.notRecording)',
      );
    });
  });

  group('FileStorageService', () {
    late Directory tempDir;
    late FileStorageService service;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('voxcita_test_');
      service = FileStorageService(testDirectory: tempDir);
    });

    tearDown(() async {
      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }
    });

    test('generateAudioFilePath returns path in audio directory', () async {
      final path = await service.generateAudioFilePath('test.m4a');
      expect(path, contains('audio'));
      expect(path, endsWith('test.m4a'));
    });

    test('computeSha256Hash returns correct hash', () async {
      final testFile = File('${tempDir.path}/test_hash.txt');
      await testFile.writeAsString('Hello VoxCita');
      final hash = await service.computeSha256Hash(testFile.path);
      expect(hash, hasLength(64));
      expect(hash, matches(RegExp(r'^[a-f0-9]+$')));
    });

    test('storeFile moves file to audio directory', () async {
      final sourceFile = File('${tempDir.path}/source.m4a');
      await sourceFile.writeAsString('audio data');

      final storedPath = await service.storeFile(
        sourcePath: sourceFile.path,
        fileName: 'stored.m4a',
      );

      expect(File(storedPath).existsSync(), isTrue);
      expect(sourceFile.existsSync(), isFalse);
    });

    test('getRelativePath and getAbsolutePath are inverses', () async {
      final absolute = await service.getAbsolutePath('subdir/file.m4a');
      final relative = await service.getRelativePath(absolute);
      expect(relative, 'subdir/file.m4a');
    });

    test('fileExists returns false for non-existent file', () async {
      expect(await service.fileExists('nonexistent.m4a'), isFalse);
    });

    test('fileExists returns true for existing file', () async {
      final path = await service.generateAudioFilePath('exists.m4a');
      await File(path).writeAsString('data');
      expect(await service.fileExists('exists.m4a'), isTrue);
    });

    test('deleteFile removes file', () async {
      final path = await service.generateAudioFilePath('delete.m4a');
      await File(path).writeAsString('data');
      await service.deleteFile('delete.m4a');
      expect(File(path).existsSync(), isFalse);
    });

    test('fileSizeBytes returns 0 for non-existent file', () async {
      expect(await service.fileSizeBytes('nonexistent.m4a'), 0);
    });

    test('fileSizeBytes returns size for existing file', () async {
      final path = await service.generateAudioFilePath('sized.m4a');
      await File(path).writeAsString('12345');
      expect(await service.fileSizeBytes('sized.m4a'), 5);
    });
  });
}
