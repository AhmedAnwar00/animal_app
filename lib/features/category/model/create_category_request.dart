class CreateCategoryRequest {
  const CreateCategoryRequest({
    required this.name,
    required this.description,
    required this.imagePath,
  });

  final String name;
  final String description;
  final String imagePath;
}
