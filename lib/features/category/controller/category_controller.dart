import 'package:animal_app/features/category/model/category.dart';
import 'package:animal_app/features/category/model/create_category_request.dart';
import 'package:animal_app/features/category/model/update_category_request.dart';
import 'package:animal_app/features/category/service/category_service.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CategoryController extends ChangeNotifier {
  CategoryController(this._categoryService);

  final CategoryService _categoryService;
  final ImagePicker _imagePicker = ImagePicker();

  String categoryName = '';
  String description = '';
  String? imagePath;
  int? editingCategoryId;
  List<Category> categories = [];
  bool isLoading = false;
  bool isCreating = false;
  bool isUpdating = false;
  String? errorMessage;
  String? successMessage;

  bool get isEditing => editingCategoryId != null;

  void updateCategoryName(String value) {
    categoryName = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    description = value;
    notifyListeners();
  }

  void beginEdit(Category category) {
    editingCategoryId = category.id;
    categoryName = category.name;
    description = category.description;
    imagePath = null;
    errorMessage = null;
    successMessage = null;
    notifyListeners();
  }

  void clearEdit() {
    editingCategoryId = null;
    categoryName = '';
    description = '';
    imagePath = null;
    notifyListeners();
  }

  void clearError() {
    if (errorMessage == null) return;
    errorMessage = null;
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
      notifyListeners();
    } catch (_) {
      errorMessage = 'Failed to pick image. Please try again';
      notifyListeners();
    }
  }

  Future<void> loadCategories() async {
    if (isLoading) return;

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _categoryService.fetchAllCategories();
      if (response.statusCode == 200) {
        categories = response.categories;
      } else {
        errorMessage = 'Failed to load categories. Please try again.';
      }
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveCategory() async {
    if (isEditing) {
      await updateCategory();
    } else {
      await createCategory();
    }
  }

  Future<void> createCategory() async {
    if (isCreating || isUpdating) return;

    final validationError = _validateCreate();
    if (validationError != null) {
      errorMessage = validationError;
      notifyListeners();
      return;
    }

    isCreating = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final response = await _categoryService.createCategory(
        CreateCategoryRequest(
          name: categoryName.trim(),
          description: description.trim(),
          imagePath: imagePath!,
        ),
      );

      if (response.statusCode == 200) {
        successMessage = response.message;
        await loadCategories();
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isCreating = false;
      notifyListeners();
    }
  }

  Future<void> updateCategory() async {
    if (isCreating || isUpdating) return;

    final id = editingCategoryId;
    if (id == null) {
      errorMessage = 'No category selected for update';
      notifyListeners();
      return;
    }

    final validationError = _validateUpdate();
    if (validationError != null) {
      errorMessage = validationError;
      notifyListeners();
      return;
    }

    isUpdating = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final response = await _categoryService.updateCategory(
        UpdateCategoryRequest(
          id: id,
          name: categoryName.trim(),
          description: description.trim(),
          imagePath: imagePath,
        ),
      );

      if (response.statusCode == 200) {
        successMessage = response.message;
        await loadCategories();
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isUpdating = false;
      notifyListeners();
    }
  }

  String? _validateCreate() {
    if (categoryName.trim().isEmpty) return 'Category name is required';
    if (description.trim().isEmpty) return 'Description is required';
    if (imagePath == null || imagePath!.isEmpty) {
      return 'Category image is required';
    }
    return null;
  }

  String? _validateUpdate() {
    if (categoryName.trim().isEmpty) return 'Category name is required';
    if (description.trim().isEmpty) return 'Description is required';
    return null;
  }
}
