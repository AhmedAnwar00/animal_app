import 'package:animal_app/features/animal/model/animal.dart';

class CreateAnimalResponse {
  const CreateAnimalResponse({
    required this.statusCode,
    required this.animal,
    required this.message,
  });

  final int statusCode;
  final Animal animal;
  final String message;

  factory CreateAnimalResponse.fromJson(Map<String, dynamic> json) {
    return CreateAnimalResponse(
      statusCode: json['statusCode'] as int,
      animal: Animal.fromJson(json['Category'] as Map<String, dynamic>),
      message: json['message'] as String,
    );
  }
}
