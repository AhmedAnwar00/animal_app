import 'package:animal_app/features/category/model/category.dart';

class UpdateCategoryResponse {
  const UpdateCategoryResponse({
    required this.statusCode,
    required this.category,
    required this.message,
  });

  final int statusCode;
  final Category category;
  final String message;

  factory UpdateCategoryResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCategoryResponse(
      statusCode: json['statusCode'] as int,
      category: Category.fromJson(json['Category'] as Map<String, dynamic>),
      message: json['message'] as String,
    );
  }
}
