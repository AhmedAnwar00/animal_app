import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/features/animal/model/animal.dart';
import 'package:animal_app/features/animal/model/create_animal_request.dart';
import 'package:animal_app/features/animal/model/update_animal_request.dart';
import 'package:animal_app/features/animal/service/animal_service.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AnimalController extends ChangeNotifier {
  AnimalController(this._animalService, this._categoryController);

  final AnimalService _animalService;
  final CategoryController _categoryController;
  final ImagePicker _imagePicker = ImagePicker();

  String animalName = '';
  String description = '';
  String price = '';
  String categoryName = '';
  String? imagePath;
  String? existingImageUrl;
  int? editingAnimalId;
  int formVersion = 0;
  List<Animal> animals = [];
  bool isLoading = false;
  bool isCreating = false;
  bool isUpdating = false;
  bool isDeleting = false;
  String? errorMessage;
  String? loadErrorMessage;
  String? successMessage;

  bool get isEditing => editingAnimalId != null;

  void beginEdit(Animal animal) {
    editingAnimalId = animal.id;
    animalName = animal.name;
    description = animal.description;
    price = animal.price.toString();
    categoryName = _categoryNameForId(animal.categoryId) ?? '';
    imagePath = null;
    existingImageUrl = ApiConstants.resolveMediaUrl(animal.image);
    errorMessage = null;
    successMessage = null;
    formVersion++;
    notifyListeners();
  }

  void clearEdit() {
    editingAnimalId = null;
    existingImageUrl = null;
    _clearForm();
    notifyListeners();
  }

  void updateAnimalName(String value) {
    animalName = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    description = value;
    notifyListeners();
  }

  void updatePrice(String value) {
    price = value;
    notifyListeners();
  }

  void updateCategoryName(String value) {
    categoryName = value;
    notifyListeners();
  }

  void clearError() {
    if (errorMessage == null) return;
    errorMessage = null;
  }

  void clearLoadError() {
    if (loadErrorMessage == null) return;
    loadErrorMessage = null;
  }

  void clearSuccessMessage() {
    if (successMessage == null) return;
    successMessage = null;
  }

  Future<void> pickFromGallery() async {
    await Permission.photos.request();

    try {
      final file = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (file == null) return;
      imagePath = file.path;
      existingImageUrl = null;
      notifyListeners();
    } catch (_) {
      errorMessage = 'Failed to pick image. Please try again';
      notifyListeners();
    }
  }

  Future<void> pickFromCamera() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      errorMessage = 'Camera permission is required to take a photo';
      notifyListeners();
      return;
    }

    try {
      final file = await _imagePicker.pickImage(source: ImageSource.camera);
      if (file == null) return;
      imagePath = file.path;
      existingImageUrl = null;
      notifyListeners();
    } catch (_) {
      errorMessage = 'Failed to pick image. Please try again';
      notifyListeners();
    }
  }

  Future<void> loadAnimals() async {
    if (isLoading) return;

    isLoading = true;
    loadErrorMessage = null;
    notifyListeners();

    try {
      final response = await _animalService.fetchAllAnimals();
      if (response.statusCode == 200) {
        animals = response.animals;
      } else {
        loadErrorMessage = 'Failed to load animals. Please try again.';
      }
    } catch (e) {
      loadErrorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> saveAnimal() async {
    if (isEditing) {
      return updateAnimal();
    }
    return createAnimal();
  }

  Future<bool> createAnimal() async {
    if (isCreating || isUpdating || isDeleting) return false;

    final validationError = _validateCreate();
    if (validationError != null) {
      errorMessage = validationError;
      notifyListeners();
      return false;
    }

    final categoryId = _categoryIdForName(categoryName);
    if (categoryId == null) {
      errorMessage = 'Category not found';
      notifyListeners();
      return false;
    }

    isCreating = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final response = await _animalService.createAnimal(
        CreateAnimalRequest(
          name: animalName.trim(),
          description: description.trim(),
          imagePath: imagePath!,
          price: double.parse(price.trim()),
          categoryId: categoryId,
        ),
      );

      if (response.statusCode == 200) {
        successMessage = response.message;
        _clearForm();
        await loadAnimals();
        return true;
      }
      errorMessage = response.message;
      return false;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      isCreating = false;
      notifyListeners();
    }
  }

  Future<bool> updateAnimal() async {
    if (isCreating || isUpdating || isDeleting) return false;

    final id = editingAnimalId;
    if (id == null) {
      errorMessage = 'No animal selected for update';
      notifyListeners();
      return false;
    }

    final validationError = _validateUpdate();
    if (validationError != null) {
      errorMessage = validationError;
      notifyListeners();
      return false;
    }

    final categoryId = _categoryIdForName(categoryName);
    if (categoryId == null) {
      errorMessage = 'Category not found';
      notifyListeners();
      return false;
    }

    isUpdating = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final response = await _animalService.updateAnimal(
        UpdateAnimalRequest(
          id: id,
          name: animalName.trim(),
          description: description.trim(),
          imagePath: imagePath,
          price: double.parse(price.trim()),
          categoryId: categoryId,
        ),
      );

      if (response.statusCode == 200) {
        successMessage = response.message;
        _replaceAnimal(response.animal);
        await loadAnimals();
        return true;
      }
      errorMessage = response.message;
      return false;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      isUpdating = false;
      notifyListeners();
    }
  }

  Future<bool> deleteAnimal() async {
    if (isCreating || isUpdating || isDeleting) return false;

    final id = editingAnimalId;
    if (id == null) {
      errorMessage = 'No animal selected for delete';
      notifyListeners();
      return false;
    }

    isDeleting = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final response = await _animalService.deleteAnimal(id);

      if (response.statusCode == 200) {
        animals = animals.where((animal) => animal.id != id).toList();
        successMessage = response.message;
        return true;
      }
      errorMessage = response.message;
      return false;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      isDeleting = false;
      notifyListeners();
    }
  }

  void _replaceAnimal(Animal updated) {
    animals = [
      for (final animal in animals)
        if (animal.id == updated.id) updated else animal,
    ];
  }

  int? _categoryIdForName(String name) {
    final normalized = name.trim().toLowerCase();
    for (final category in _categoryController.categories) {
      if (category.name.trim().toLowerCase() == normalized) {
        return category.id;
      }
    }
    return null;
  }

  String? _categoryNameForId(int id) {
    for (final category in _categoryController.categories) {
      if (category.id == id) return category.name;
    }
    return null;
  }

  String? _validateCreate() {
    if (animalName.trim().isEmpty) return 'Animal name is required';
    if (description.trim().isEmpty) return 'Description is required';
    if (imagePath == null || imagePath!.isEmpty) {
      return 'Animal image is required';
    }
    if (price.trim().isEmpty) return 'Animal price is required';
    if (double.tryParse(price.trim()) == null) {
      return 'Animal price must be a number';
    }
    if (categoryName.trim().isEmpty) return 'Category name is required';
    return null;
  }

  String? _validateUpdate() {
    if (animalName.trim().isEmpty) return 'Animal name is required';
    if (description.trim().isEmpty) return 'Description is required';
    final hasNewImage = imagePath != null && imagePath!.isNotEmpty;
    final hasExistingImage =
        existingImageUrl != null && existingImageUrl!.isNotEmpty;
    if (!hasNewImage && !hasExistingImage) {
      return 'Animal image is required';
    }
    if (price.trim().isEmpty) return 'Animal price is required';
    if (double.tryParse(price.trim()) == null) {
      return 'Animal price must be a number';
    }
    if (categoryName.trim().isEmpty) return 'Category name is required';
    return null;
  }

  void _clearForm() {
    animalName = '';
    description = '';
    price = '';
    categoryName = '';
    imagePath = null;
    formVersion++;
  }
}
