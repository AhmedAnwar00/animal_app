import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/category/model/categories_response.dart';
import 'package:animal_app/features/category/model/create_category_request.dart';
import 'package:animal_app/features/category/model/create_category_response.dart';
import 'package:dio/dio.dart';

class CategoryService {
  CategoryService(this._client);

  final DioClient _client;

  Future<CategoriesResponse> fetchAllCategories() async {
    try {
      final response = await _client.dio.get<Map<String, dynamic>>(
        ApiConstants.allCategories,
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return CategoriesResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(
          e,
          'Failed to load categories. Please try again.',
        ),
      );
    }
  }

  Future<CreateCategoryResponse> createCategory(
    CreateCategoryRequest request,
  ) async {
    try {
      final fileName = request.imagePath.split(RegExp(r'[\\/]')).last;
      final formData = FormData.fromMap({
        'name': request.name,
        'description': request.description,
        'image': await MultipartFile.fromFile(
          request.imagePath,
          filename: fileName,
        ),
      });

      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.createNewCategory,
        data: formData,
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return CreateCategoryResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(
          e,
          'Failed to create category. Please try again.',
        ),
      );
    }
  }

  String _messageFromDioException(DioException e, String fallback) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }

      final error = data['error'];
      if (error is List) {
        final parts = error
            .whereType<String>()
            .where((item) => item.isNotEmpty)
            .toList();
        if (parts.isNotEmpty) {
          return parts.join(', ');
        }
      }
    }
    return e.message ?? fallback;
  }
}
