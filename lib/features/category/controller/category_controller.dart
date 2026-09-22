import 'package:flutter/foundation.dart';

class CategoryController extends ChangeNotifier {
  String categoryName = '';
  String description = '';

  void updateCategoryName(String value) {
    categoryName = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    description = value;
    notifyListeners();
  }
}
