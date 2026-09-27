class UpdateAnimalRequest {
  const UpdateAnimalRequest({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    this.imagePath,
  });

  final int id;
  final String name;
  final String description;
  final double price;
  final int categoryId;
  final String? imagePath;
}
