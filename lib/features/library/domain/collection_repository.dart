import 'package:voxcita/features/library/domain/collection_entity.dart';

abstract interface class CollectionRepository {
  Future<CollectionEntity> createCollection({
    required String name,
    String description,
  });

  Future<List<CollectionEntity>> getAllCollections();

  Future<void> addNoteToCollection({
    required String noteId,
    required String collectionId,
  });

  Future<void> removeNoteFromCollection({
    required String noteId,
    required String collectionId,
  });

  Future<void> deleteCollection(String id);
}
