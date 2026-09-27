import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/generated/l10n.dart';
import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/category/model/categories_response.dart';
import 'package:animal_app/features/category/model/create_category_request.dart';
import 'package:animal_app/features/category/model/create_category_response.dart';
import 'package:animal_app/features/category/model/delete_category_response.dart';
import 'package:animal_app/features/category/model/update_category_request.dart';
import 'package:animal_app/features/category/model/update_category_response.dart';
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
        throw Exception(S.current.emptyResponse);
      }

      return CategoriesResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(e, S.current.failedToLoadCategories),
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
        throw Exception(S.current.emptyResponse);
      }

      return CreateCategoryResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(e, S.current.createCategoryFailed),
      );
    }
  }

  Future<UpdateCategoryResponse> updateCategory(
    UpdateCategoryRequest request,
  ) async {
    try {
      final map = <String, dynamic>{
        'id': request.id,
        'name': request.name,
        'description': request.description,
      };

      final imagePath = request.imagePath;
      if (imagePath != null && imagePath.isNotEmpty) {
        final fileName = imagePath.split(RegExp(r'[\\/]')).last;
        map['image'] = await MultipartFile.fromFile(
          imagePath,
          filename: fileName,
        );
      }

      final formData = FormData.fromMap(map);

      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.updateCategory,
        data: formData,
      );

      final data = response.data;
      if (data == null) {
        throw Exception(S.current.emptyResponse);
      }

      return UpdateCategoryResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(e, S.current.updateCategoryFailed),
      );
    }
  }

  Future<DeleteCategoryResponse> deleteCategory(int categoryId) async {
    try {
      final response = await _client.dio.delete<dynamic>(
        ApiConstants.deleteCategory,
        queryParameters: {'id': categoryId},
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        return _deleteResponse(data);
      }
      if (data is Map) {
        return _deleteResponse(
          data.map((key, value) => MapEntry(key.toString(), value)),
        );
      }
      if (response.statusCode == 200) {
        return DeleteCategoryResponse(
          statusCode: 200,
          message: S.current.categoryDeleted,
        );
      }
      throw Exception(S.current.emptyResponse);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(e, S.current.deleteCategoryFailed),
      );
    }
  }

  DeleteCategoryResponse _deleteResponse(Map<String, dynamic> data) {
    final response = DeleteCategoryResponse.fromJson(data);
    if (response.message.isNotEmpty) return response;
    return DeleteCategoryResponse(
      statusCode: response.statusCode,
      message: S.current.categoryDeleted,
    );
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
