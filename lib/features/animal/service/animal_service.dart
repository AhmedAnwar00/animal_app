import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/animal/model/animals_response.dart';
import 'package:animal_app/features/animal/model/create_animal_request.dart';
import 'package:animal_app/features/animal/model/create_animal_response.dart';
import 'package:animal_app/features/animal/model/delete_animal_response.dart';
import 'package:animal_app/features/animal/model/update_animal_request.dart';
import 'package:animal_app/features/animal/model/update_animal_response.dart';
import 'package:dio/dio.dart';

class AnimalService {
  AnimalService(this._client);

  final DioClient _client;

  Future<AnimalsResponse> fetchAllAnimals() async {
    try {
      final response = await _client.dio.get<Map<String, dynamic>>(
        ApiConstants.allAnimals,
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return AnimalsResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(
          e,
          'Failed to load animals. Please try again.',
        ),
      );
    }
  }

  Future<CreateAnimalResponse> createAnimal(CreateAnimalRequest request) async {
    try {
      final fileName = request.imagePath.split(RegExp(r'[\\/]')).last;
      final formData = FormData.fromMap({
        'name': request.name,
        'description': request.description,
        'image': await MultipartFile.fromFile(
          request.imagePath,
          filename: fileName,
        ),
        'price': request.price,
        'category_id': request.categoryId,
      });

      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.addNewAnimal,
        data: formData,
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return CreateAnimalResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(
          e,
          'Failed to create animal. Please try again.',
        ),
      );
    }
  }

  Future<UpdateAnimalResponse> updateAnimal(UpdateAnimalRequest request) async {
    try {
      final map = <String, dynamic>{
        'id': request.id,
        'name': request.name,
        'description': request.description,
        'animal_price': request.price,
        'category_id': request.categoryId,
      };

      final imagePath = request.imagePath;
      if (imagePath != null && imagePath.isNotEmpty) {
        final fileName = imagePath.split(RegExp(r'[\\/]')).last;
        map['animal_image'] = await MultipartFile.fromFile(
          imagePath,
          filename: fileName,
        );
      }

      final formData = FormData.fromMap(map);

      final response = await _client.dio.post<Map<String, dynamic>>(
        ApiConstants.updateAnimal,
        data: formData,
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Empty response from server');
      }

      return UpdateAnimalResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(
          e,
          'Failed to update animal. Please try again.',
        ),
      );
    }
  }

  Future<DeleteAnimalResponse> deleteAnimal(int animalId) async {
    try {
      final response = await _client.dio.delete<dynamic>(
        ApiConstants.deleteAnimal,
        queryParameters: {'id': animalId},
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        return DeleteAnimalResponse.fromJson(data);
      }
      if (data is Map) {
        return DeleteAnimalResponse.fromJson(
          data.map((key, value) => MapEntry(key.toString(), value)),
        );
      }
      if (response.statusCode == 200) {
        return const DeleteAnimalResponse(
          statusCode: 200,
          message: 'Animal deleted successfully',
        );
      }
      throw Exception('Empty response from server');
    } on DioException catch (e) {
      throw Exception(
        _messageFromDioException(
          e,
          'Failed to delete animal. Please try again.',
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
