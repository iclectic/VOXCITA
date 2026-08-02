import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/capture/domain/audio_asset_entity.dart';
import 'package:voxcita/features/capture/domain/audio_repository.dart';
import 'package:voxcita/features/capture/domain/recording_session_entity.dart';
import 'package:voxcita/features/capture/domain/recording_session_status.dart';

class AudioRepositoryImpl implements AudioRepository {
  AudioRepositoryImpl(this._db, this._uuid);

  final VoxCitaDatabase _db;
  final Uuid _uuid;

  @override
  Future<AudioAssetEntity> createAudioAsset({
    required String relativePath,
    required int durationMs,
    required int fileSizeBytes,
    required String sha256Hash,
    String mimeType = 'audio/m4a',
    String? waveformJson,
    bool isOriginal = true,
    String? derivedFromId,
  }) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc();

    await _db
        .into(_db.audioAssets)
        .insert(
          AudioAssetsCompanion.insert(
            id: id,
            relativePath: relativePath,
            mimeType: Value(mimeType),
            durationMs: durationMs,
            fileSizeBytes: fileSizeBytes,
            sha256Hash: sha256Hash,
            waveformJson: Value(waveformJson),
            isOriginal: Value(isOriginal),
            derivedFromId: Value(derivedFromId),
            createdAt: now,
          ),
        );

    return AudioAssetEntity(
      id: id,
      relativePath: relativePath,
      mimeType: mimeType,
      durationMs: durationMs,
      fileSizeBytes: fileSizeBytes,
      sha256Hash: sha256Hash,
      waveformJson: waveformJson,
      isOriginal: isOriginal,
      derivedFromId: derivedFromId,
      createdAt: now,
    );
  }

  @override
  Future<AudioAssetEntity?> getAudioAssetById(String id) async {
    final row = await (_db.select(
      _db.audioAssets,
    )..where((a) => a.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return _mapAssetToEntity(row);
  }

  @override
  Future<void> deleteAudioAsset(String id) async {
    await (_db.delete(_db.audioAssets)..where((a) => a.id.equals(id))).go();
  }

  @override
  Future<RecordingSessionEntity> createRecordingSession() async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc();

    await _db
        .into(_db.recordingSessions)
        .insert(
          RecordingSessionsCompanion.insert(
            id: id,
            status: RecordingSessionStatus.created.name,
            startedAt: now,
          ),
        );

    return RecordingSessionEntity(
      id: id,
      status: RecordingSessionStatus.created,
      startedAt: now,
    );
  }

  @override
  Future<RecordingSessionEntity?> getRecordingSessionById(String id) async {
    final row = await (_db.select(
      _db.recordingSessions,
    )..where((s) => s.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return _mapSessionToEntity(row);
  }

  @override
  Future<List<RecordingSessionEntity>> getAbandonedSessions() async {
    final rows =
        await (_db.select(_db.recordingSessions)..where(
              (s) =>
                  s.status.equals(RecordingSessionStatus.created.name) |
                  s.status.equals(RecordingSessionStatus.recording.name) |
                  s.status.equals(RecordingSessionStatus.paused.name),
            ))
            .get();
    return rows.map(_mapSessionToEntity).toList();
  }

  @override
  Future<void> updateSessionStatus(
    String id,
    String status, {
    String? audioAssetId,
    String? noteId,
    DateTime? endedAt,
    int? checkpointMs,
    String? errorMessage,
  }) async {
    await (_db.update(
      _db.recordingSessions,
    )..where((s) => s.id.equals(id))).write(
      RecordingSessionsCompanion(
        status: Value(status),
        audioAssetId: Value(audioAssetId),
        noteId: Value(noteId),
        endedAt: Value(endedAt),
        checkpointMs: checkpointMs != null
            ? Value(checkpointMs)
            : const Value.absent(),
        errorMessage: Value(errorMessage),
      ),
    );
  }

  AudioAssetEntity _mapAssetToEntity(AudioAsset row) {
    return AudioAssetEntity(
      id: row.id,
      relativePath: row.relativePath,
      mimeType: row.mimeType,
      durationMs: row.durationMs,
      fileSizeBytes: row.fileSizeBytes,
      sha256Hash: row.sha256Hash,
      waveformJson: row.waveformJson,
      isOriginal: row.isOriginal,
      derivedFromId: row.derivedFromId,
      createdAt: row.createdAt,
    );
  }

  RecordingSessionEntity _mapSessionToEntity(RecordingSession row) {
    return RecordingSessionEntity(
      id: row.id,
      noteId: row.noteId,
      audioAssetId: row.audioAssetId,
      status: RecordingSessionStatus.fromString(row.status),
      startedAt: row.startedAt,
      endedAt: row.endedAt,
      checkpointMs: row.checkpointMs,
      errorMessage: row.errorMessage,
    );
  }
}
