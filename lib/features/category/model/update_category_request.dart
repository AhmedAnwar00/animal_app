class UpdateCategoryRequest {
  const UpdateCategoryRequest({
    required this.id,
    required this.name,
    required this.description,
    this.imagePath,
  });

  final int id;
  final String name;
  final String description;
  final String? imagePath;
}
