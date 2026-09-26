import 'package:animal_app/features/category/model/category.dart';

class CategoriesResponse {
  const CategoriesResponse({
    required this.statusCode,
    required this.categories,
  });

  final int statusCode;
  final List<Category> categories;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    final raw = json['Categories'] as List<dynamic>? ?? const [];
    return CategoriesResponse(
      statusCode: json['statusCode'] as int,
      categories: raw
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
