import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/generated/l10n.dart';
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
  String? existingImageUrl;
  int? editingCategoryId;
  List<Category> categories = [];
  bool isLoading = false;
  bool isCreating = false;
  bool isUpdating = false;
  bool isDeleting = false;
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
    existingImageUrl = ApiConstants.resolveMediaUrl(category.imagePath);
    errorMessage = null;
    successMessage = null;
    notifyListeners();
  }

  void clearEdit() {
    editingCategoryId = null;
    categoryName = '';
    description = '';
    imagePath = null;
    existingImageUrl = null;
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
      existingImageUrl = null;
      notifyListeners();
    } catch (_) {
      errorMessage = S.current.failedToPickImage;
      notifyListeners();
    }
  }

  Future<void> pickFromCamera() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      errorMessage = S.current.cameraPermissionRequired;
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
      errorMessage = S.current.failedToPickImage;
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
        errorMessage = S.current.failedToLoadCategories;
      }
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> saveCategory() async {
    if (isEditing) {
      return updateCategory();
    }
    return createCategory();
  }

  Future<bool> createCategory() async {
    if (isCreating || isUpdating || isDeleting) return false;

    final validationError = _validateCreate();
    if (validationError != null) {
      errorMessage = validationError;
      notifyListeners();
      return false;
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

  Future<bool> updateCategory() async {
    if (isCreating || isUpdating || isDeleting) return false;

    final id = editingCategoryId;
    if (id == null) {
      errorMessage = S.current.noCategorySelectedForUpdate;
      notifyListeners();
      return false;
    }

    final validationError = _validateUpdate();
    if (validationError != null) {
      errorMessage = validationError;
      notifyListeners();
      return false;
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

  Future<bool> deleteCategory() async {
    if (isCreating || isUpdating || isDeleting) return false;

    final id = editingCategoryId;
    if (id == null) {
      errorMessage = S.current.noCategorySelectedForDelete;
      notifyListeners();
      return false;
    }

    isDeleting = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final response = await _categoryService.deleteCategory(id);

      if (response.statusCode == 200) {
        categories = categories.where((category) => category.id != id).toList();
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

  String? _validateCreate() {
    if (categoryName.trim().isEmpty) return S.current.categoryNameRequired;
    if (description.trim().isEmpty) return S.current.descriptionRequired;
    if (imagePath == null || imagePath!.isEmpty) {
      return S.current.categoryImageRequired;
    }
    return null;
  }

  String? _validateUpdate() {
    if (categoryName.trim().isEmpty) return S.current.categoryNameRequired;
    if (description.trim().isEmpty) return S.current.descriptionRequired;
    return null;
  }
}
