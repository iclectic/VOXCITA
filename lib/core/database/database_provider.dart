import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:voxcita/core/database/voxcita_database.dart';
import 'package:voxcita/features/capture/data/audio_repository_impl.dart';
import 'package:voxcita/features/capture/domain/audio_repository.dart';
import 'package:voxcita/features/insights/data/insight_repository_impl.dart';
import 'package:voxcita/features/insights/domain/insight_repository.dart';
import 'package:voxcita/features/library/data/collection_repository_impl.dart';
import 'package:voxcita/features/library/data/note_repository_impl.dart';
import 'package:voxcita/features/library/data/tag_repository_impl.dart';
import 'package:voxcita/features/library/domain/collection_repository.dart';
import 'package:voxcita/features/library/domain/note_repository.dart';
import 'package:voxcita/features/library/domain/tag_repository.dart';
import 'package:voxcita/features/transcription/data/transcript_repository_impl.dart';
import 'package:voxcita/features/transcription/domain/transcript_repository.dart';
import 'package:voxcita/features/feedback/data/feedback_repository.dart';
import 'package:voxcita/features/trustworthy_ask/data/ask_history_repository.dart';

final voxCitaDatabaseProvider = Provider<VoxCitaDatabase>((ref) {
  final db = VoxCitaDatabase();
  ref.onDispose(db.close);
  return db;
});

final uuidProvider = Provider<Uuid>((ref) => const Uuid());

final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  return NoteRepositoryImpl(
    ref.watch(voxCitaDatabaseProvider),
    ref.watch(uuidProvider),
  );
});

final audioRepositoryProvider = Provider<AudioRepository>((ref) {
  return AudioRepositoryImpl(
    ref.watch(voxCitaDatabaseProvider),
    ref.watch(uuidProvider),
  );
});

final transcriptRepositoryProvider = Provider<TranscriptRepository>((ref) {
  return TranscriptRepositoryImpl(
    ref.watch(voxCitaDatabaseProvider),
    ref.watch(uuidProvider),
  );
});

final insightRepositoryProvider = Provider<InsightRepository>((ref) {
  return InsightRepositoryImpl(
    ref.watch(voxCitaDatabaseProvider),
    ref.watch(uuidProvider),
  );
});

final collectionRepositoryProvider = Provider<CollectionRepository>((ref) {
  return CollectionRepositoryImpl(
    ref.watch(voxCitaDatabaseProvider),
    ref.watch(uuidProvider),
  );
});

final tagRepositoryProvider = Provider<TagRepository>((ref) {
  return TagRepositoryImpl(
    ref.watch(voxCitaDatabaseProvider),
    ref.watch(uuidProvider),
  );
});

final askHistoryRepositoryProvider = Provider<AskHistoryRepository>((ref) {
  return AskHistoryRepository(
    ref.watch(voxCitaDatabaseProvider),
    ref.watch(uuidProvider),
  );
});

final feedbackRepositoryProvider = Provider<FeedbackRepository>((ref) {
  return FeedbackRepository(
    ref.watch(voxCitaDatabaseProvider),
    ref.watch(uuidProvider),
  );
});
