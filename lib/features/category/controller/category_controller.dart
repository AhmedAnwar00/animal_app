import 'package:animal_app/features/category/model/category.dart';
import 'package:animal_app/features/category/model/create_category_request.dart';
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
  List<Category> categories = [];
  bool isLoading = false;
  bool isCreating = false;
  String? errorMessage;
  String? successMessage;

  void updateCategoryName(String value) {
    categoryName = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    description = value;
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
    await _pickImage(
      source: ImageSource.gallery,
      permission: Permission.photos,
      deniedMessage: 'Photo library permission is required to select an image',
    );
  }

  Future<void> pickFromCamera() async {
    await _pickImage(
      source: ImageSource.camera,
      permission: Permission.camera,
      deniedMessage: 'Camera permission is required to take a photo',
    );
  }

  Future<void> _pickImage({
    required ImageSource source,
    required Permission permission,
    required String deniedMessage,
  }) async {
    final status = await permission.request();
    if (!status.isGranted && !status.isLimited) {
      errorMessage = deniedMessage;
      notifyListeners();
      return;
    }

    try {
      final file = await _imagePicker.pickImage(source: source);
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

  Future<void> createCategory() async {
    if (isCreating) return;

    final validationError = _validate();
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

  String? _validate() {
    if (categoryName.trim().isEmpty) return 'Category name is required';
    if (description.trim().isEmpty) return 'Description is required';
    if (imagePath == null || imagePath!.isEmpty) {
      return 'Category image is required';
    }
    return null;
  }
}
