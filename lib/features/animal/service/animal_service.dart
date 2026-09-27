import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/animal/model/animals_response.dart';
import 'package:animal_app/features/animal/model/create_animal_request.dart';
import 'package:animal_app/features/animal/model/create_animal_response.dart';
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
