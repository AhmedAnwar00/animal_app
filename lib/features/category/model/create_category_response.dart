import 'package:animal_app/features/category/model/category.dart';

class CreateCategoryResponse {
  const CreateCategoryResponse({
    required this.statusCode,
    required this.category,
    required this.message,
  });

  final int statusCode;
  final Category category;
  final String message;

  factory CreateCategoryResponse.fromJson(Map<String, dynamic> json) {
    return CreateCategoryResponse(
      statusCode: json['statusCode'] as int,
      category: Category.fromJson(json['Category'] as Map<String, dynamic>),
      message: json['message'] as String,
    );
  }
}
