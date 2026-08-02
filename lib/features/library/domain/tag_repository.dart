import 'package:voxcita/features/library/domain/tag_entity.dart';

abstract interface class TagRepository {
  Future<TagEntity> createTag({required String name});

  Future<List<TagEntity>> getAllTags();

  Future<void> addTagToNote({required String noteId, required String tagId});

  Future<void> removeTagFromNote({
    required String noteId,
    required String tagId,
  });

  Future<List<TagEntity>> getTagsForNote(String noteId);

  Future<void> deleteTag(String id);
}
