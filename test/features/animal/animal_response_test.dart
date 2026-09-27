import 'package:animal_app/features/animal/model/animals_response.dart';
import 'package:animal_app/features/animal/model/create_animal_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const animalJson = {
    'animal_id': 1,
    'animal_name': 'بيبول 34',
    'animal_description': 'elsaid',
    'animal_image': 'http://localhost:8000/api/uploads/1790509242017.png',
    'animal_price': 100.0,
    'category_id': 2,
    'user_id': 17,
    'animal_created_at': '2026-09-27 14:40:42.082022',
    'animal_update_at': '2026-09-27 14:40:42.082022',
  };

  test('parses GET /api/allAnimal Animals list', () {
    final response = AnimalsResponse.fromJson({
      'statusCode': 200,
      'Animals': [animalJson],
    });

    expect(response.statusCode, 200);
    expect(response.animals, hasLength(1));
    final animal = response.animals.single;
    expect(animal.id, 1);
    expect(animal.name, 'بيبول 34');
    expect(animal.description, 'elsaid');
    expect(animal.image, 'http://localhost:8000/api/uploads/1790509242017.png');
    expect(animal.price, 100);
    expect(animal.categoryId, 2);
    expect(animal.userId, 17);
    expect(animal.createdAt, '2026-09-27 14:40:42.082022');
    expect(animal.updatedAt, '2026-09-27 14:40:42.082022');
  });

  test('parses POST /api/addNewAnimal animal from Category', () {
    final response = CreateAnimalResponse.fromJson({
      'statusCode': 200,
      'Category': animalJson,
      'message': 'Animal created successfully',
    });

    expect(response.statusCode, 200);
    expect(response.message, 'Animal created successfully');
    expect(response.animal.id, 1);
    expect(response.animal.name, 'بيبول 34');
    expect(response.animal.price, 100);
    expect(response.animal.categoryId, 2);
  });
}
