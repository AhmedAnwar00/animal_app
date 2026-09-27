import 'dart:async';

import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/animal/controller/animal_controller.dart';
import 'package:animal_app/features/animal/model/animal.dart';
import 'package:animal_app/features/animal/model/animals_response.dart';
import 'package:animal_app/features/animal/model/delete_animal_response.dart';
import 'package:animal_app/features/animal/model/update_animal_request.dart';
import 'package:animal_app/features/animal/model/update_animal_response.dart';
import 'package:animal_app/features/animal/service/animal_service.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:animal_app/features/category/model/category.dart';
import 'package:animal_app/features/category/service/category_service.dart';
import 'package:animal_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    await S.load(const Locale('en'));
  });

  const original = Animal(
    id: 1,
    name: 'ليديبول',
    description: 'old',
    image: 'http://localhost:8000/api/uploads/old.png',
    price: 100,
    categoryId: 2,
    userId: 17,
    createdAt: '2026-09-27 14:40:42.000Z',
    updatedAt: '2026-09-27 14:40:42.000Z',
  );

  const updated = Animal(
    id: 1,
    name: 'ليديبول 3',
    description: 'sdds',
    image: 'http://localhost:8000/api/uploads/1790511979334.png',
    price: 200,
    categoryId: 2,
    userId: 17,
    createdAt: '2026-09-27 14:40:42.000Z',
    updatedAt: '2026-09-27 14:40:42.000Z',
  );

  late _FakeAnimalService service;
  late CategoryController categoryController;
  late AnimalController controller;

  setUp(() {
    service = _FakeAnimalService(updated);
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
    ];
    controller = AnimalController(service, categoryController);
    controller.animals = [original];
  });

  test('update requires a selected animal', () async {
    final success = await controller.updateAnimal();

    expect(success, isFalse);
    expect(controller.errorMessage, 'No animal selected for update');
    expect(service.request, isNull);
  });

  test('beginEdit fills the category name for the animal category id', () {
    controller.beginEdit(original);

    expect(controller.isEditing, isTrue);
    expect(controller.categoryName, 'Dogs');
    expect(controller.animalName, 'ليديبول');
    expect(controller.existingImageUrl, isNotNull);
  });

  test('update maps the typed category name to category_id', () async {
    controller.beginEdit(original);
    controller.updateAnimalName('ليديبول 3');
    controller.updateDescription('sdds');
    controller.updatePrice('200');
    controller.updateCategoryName('dogs');

    final success = await controller.updateAnimal();

    expect(success, isTrue);
    expect(service.request?.id, 1);
    expect(service.request?.name, 'ليديبول 3');
    expect(service.request?.description, 'sdds');
    expect(service.request?.price, 200);
    expect(service.request?.categoryId, 2);
    expect(service.request?.imagePath, isNull);
    expect(controller.successMessage, 'Animal updated successfully');
    expect(controller.animals.single.name, 'ليديبول 3');
    expect(controller.animals.single.price, 200);
    expect(controller.isUpdating, isFalse);
    expect(controller.errorMessage, isNull);
  });

  test('update sends a new image file when one is selected', () async {
    controller.beginEdit(original);
    controller.imagePath = r'C:\images\dog.png';

    final success = await controller.updateAnimal();

    expect(success, isTrue);
    expect(service.request?.imagePath, r'C:\images\dog.png');
  });

  test(
    'update reports a category that does not match a loaded category',
    () async {
      controller.beginEdit(original);
      controller.updateCategoryName('unknown');

      final success = await controller.updateAnimal();

      expect(success, isFalse);
      expect(controller.errorMessage, 'Category not found');
      expect(service.request, isNull);
      expect(controller.isUpdating, isFalse);
    },
  );

  test('update surfaces service errors and clears loading', () async {
    service.error = Exception('Failed to update animal. Please try again.');
    controller.beginEdit(original);

    final success = await controller.updateAnimal();

    expect(success, isFalse);
    expect(
      controller.errorMessage,
      'Failed to update animal. Please try again.',
    );
    expect(controller.successMessage, isNull);
    expect(controller.isUpdating, isFalse);
    expect(controller.animals.single.name, 'ليديبول');
  });

  test('delete requires a selected animal', () async {
    final success = await controller.deleteAnimal();

    expect(success, isFalse);
    expect(controller.errorMessage, 'No animal selected for delete');
    expect(service.deletedId, isNull);
  });

  test('delete removes the selected animal', () async {
    controller.beginEdit(original);

    final success = await controller.deleteAnimal();

    expect(success, isTrue);
    expect(service.deletedId, 1);
    expect(controller.animals, isEmpty);
    expect(controller.successMessage, 'Animal deleted successfully');
    expect(controller.isDeleting, isFalse);
    expect(controller.errorMessage, isNull);
  });

  test('update keeps loading set until the request finishes', () async {
    service.holdRequest = true;
    controller.beginEdit(original);

    final pending = controller.updateAnimal();
    await service.started.future;

    expect(controller.isUpdating, isTrue);

    service.release();
    final success = await pending;

    expect(success, isTrue);
    expect(controller.isUpdating, isFalse);
  });
}

class _FakeAnimalService extends AnimalService {
  _FakeAnimalService(this.updated) : super(DioClient());

  final Animal updated;
  UpdateAnimalRequest? request;
  int? deletedId;
  Exception? error;
  bool holdRequest = false;
  final started = Completer<void>();
  final _release = Completer<void>();

  void release() {
    if (!_release.isCompleted) _release.complete();
  }

  @override
  Future<AnimalsResponse> fetchAllAnimals() async {
    return AnimalsResponse(statusCode: 200, animals: [updated]);
  }

  @override
  Future<UpdateAnimalResponse> updateAnimal(UpdateAnimalRequest request) async {
    this.request = request;
    if (!started.isCompleted) started.complete();
    if (holdRequest) await _release.future;
    final failure = error;
    if (failure != null) throw failure;
    return UpdateAnimalResponse(
      statusCode: 200,
      animal: updated,
      message: 'Animal updated successfully',
    );
  }

  @override
  Future<DeleteAnimalResponse> deleteAnimal(int animalId) async {
    deletedId = animalId;
    final failure = error;
    if (failure != null) throw failure;
    return const DeleteAnimalResponse(
      statusCode: 200,
      message: 'Animal deleted successfully',
    );
  }
}
