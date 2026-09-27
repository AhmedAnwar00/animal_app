class Animal {
  const Animal({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.categoryId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final int categoryId;
  final int userId;
  final String createdAt;
  final String updatedAt;

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['animal_id'] as int,
      name: json['animal_name'] as String,
      description: json['animal_description'] as String,
      image: json['animal_image'] as String,
      price: (json['animal_price'] as num).toDouble(),
      categoryId: json['category_id'] as int,
      userId: json['user_id'] as int,
      createdAt: json['animal_created_at'] as String,
      updatedAt: json['animal_update_at'] as String,
    );
  }
}
