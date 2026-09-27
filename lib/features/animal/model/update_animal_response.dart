import 'package:animal_app/features/animal/model/animal.dart';

class UpdateAnimalResponse {
  const UpdateAnimalResponse({
    required this.statusCode,
    required this.animal,
    required this.message,
  });

  final int statusCode;
  final Animal animal;
  final String message;

  factory UpdateAnimalResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAnimalResponse(
      statusCode: json['statusCode'] as int,
      animal: Animal.fromJson(json['Animals'] as Map<String, dynamic>),
      message: json['message'] as String,
    );
  }
}
