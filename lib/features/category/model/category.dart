class Category {
  const Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  final int id;
  final String name;
  final String description;
  final String imagePath;
  final String createdAt;
  final String updatedAt;
  final int userId;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      userId: json['userId'] as int,
    );
  }
}
