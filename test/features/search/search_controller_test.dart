import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/animal/controller/animal_controller.dart';
import 'package:animal_app/features/animal/model/animal.dart';
import 'package:animal_app/features/animal/service/animal_service.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:animal_app/features/category/model/category.dart';
import 'package:animal_app/features/category/service/category_service.dart';
import 'package:animal_app/features/search/controller/search_controller.dart';
import 'package:animal_app/features/search/model/search_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const dog = Animal(
    id: 1,
    name: 'Buddy',
    description: 'dog',
    image: '/buddy.png',
    price: 100,
    categoryId: 2,
    userId: 17,
    createdAt: '2026-09-27 14:40:42.000Z',
    updatedAt: '2026-09-27 14:40:42.000Z',
  );

  const cat = Animal(
    id: 2,
    name: 'Milo',
    description: 'cat',
    image: '/milo.png',
    price: 80,
    categoryId: 3,
    userId: 17,
    createdAt: '2026-09-27 14:40:42.000Z',
    updatedAt: '2026-09-27 14:40:42.000Z',
  );

  late CategoryController categoryController;
  late AnimalController animalController;
  late SearchController controller;

  setUp(() {
    categoryController = CategoryController(CategoryService(DioClient()));
    categoryController.categories = [
      const Category(
        id: 2,
        name: 'Dogs',
        description: 'dogs',
        imagePath: '/dogs.png',
        createdAt: '2026-09-27 14:40:42.000Z',
        updatedAt: '2026-09-27 14:40:42.000Z',
        userId: 17,
      ),
      const Category(
        id: 3,
        name: 'Cats',
        description: 'cats',
        imagePath: '/cats.png',
        createdAt: '2026-09-27 14:40:42.000Z',
        updatedAt: '2026-09-27 14:40:42.000Z',
        userId: 17,
      ),
    ];
    animalController = AnimalController(
      AnimalService(DioClient()),
      categoryController,
    );
    animalController.animals = [dog, cat];
    controller = SearchController(animalController, categoryController);
  });

  tearDown(() {
    controller.dispose();
    animalController.dispose();
    categoryController.dispose();
  });

  test('empty query shows every loaded animal', () {
    expect(controller.results, [dog, cat]);
  });

  test('animal filter matches the animal name while typing', () {
    controller.selectFilter(SearchFilter.animal);
    controller.updateQuery('bud');

    expect(controller.results, [dog]);
  });

  test('category filter matches the category name while typing', () {
    controller.updateQuery('cat');

    expect(controller.selectedFilter, SearchFilter.category);
    expect(controller.results, [cat]);
  });

  test('no matches leaves the results empty', () {
    controller.selectFilter(SearchFilter.animal);
    controller.updateQuery('rabbit');

    expect(controller.results, isEmpty);
  });

  test('results follow loaded animal changes', () {
    animalController.animals = [dog];
    animalController.notifyListeners();

    expect(controller.results, [dog]);
  });
}
