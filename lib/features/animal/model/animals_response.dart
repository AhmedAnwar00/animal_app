import 'package:animal_app/features/animal/model/animal.dart';

class AnimalsResponse {
  const AnimalsResponse({required this.statusCode, required this.animals});

  final int statusCode;
  final List<Animal> animals;

  factory AnimalsResponse.fromJson(Map<String, dynamic> json) {
    final raw = json['Animals'] as List<dynamic>? ?? const [];
    return AnimalsResponse(
      statusCode: json['statusCode'] as int,
      animals: raw
          .map((item) => Animal.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
