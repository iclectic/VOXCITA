class CollectionEntity {
  CollectionEntity({
    required this.id,
    required this.name,
    required this.createdAt,
    this.description = '',
  });

  final String id;
  final String name;
  final String description;
  final DateTime createdAt;
}
