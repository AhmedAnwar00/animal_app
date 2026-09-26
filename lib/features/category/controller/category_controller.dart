import 'package:animal_app/features/category/model/category.dart';
import 'package:animal_app/features/category/service/category_service.dart';
import 'package:flutter/foundation.dart' hide Category;

class CategoryController extends ChangeNotifier {
  CategoryController(this._categoryService);

  final CategoryService _categoryService;

  String categoryName = '';
  String description = '';
  List<Category> categories = [];
  bool isLoading = false;
  String? errorMessage;

  void updateCategoryName(String value) {
    categoryName = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    description = value;
    notifyListeners();
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
}
