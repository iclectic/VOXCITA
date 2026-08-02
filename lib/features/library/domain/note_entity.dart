import 'package:voxcita/features/library/domain/note_type.dart';

class NoteEntity {
  NoteEntity({
    required this.id,
    required this.noteType,
    required this.createdAt,
    required this.updatedAt,
    this.title = '',
    this.body = '',
    this.audioAssetId,
    this.isFavourite = false,
    this.isPinned = false,
  });

  final String id;
  final String title;
  final String body;
  final NoteType noteType;
  final String? audioAssetId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavourite;
  final bool isPinned;

  NoteEntity copyWith({
    String? title,
    String? body,
    String? audioAssetId,
    DateTime? updatedAt,
    bool? isFavourite,
    bool? isPinned,
  }) {
    return NoteEntity(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      noteType: noteType,
      audioAssetId: audioAssetId ?? this.audioAssetId,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFavourite: isFavourite ?? this.isFavourite,
      isPinned: isPinned ?? this.isPinned,
    );
  }
}
