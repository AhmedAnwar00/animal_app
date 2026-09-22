import 'package:flutter/foundation.dart';

class AnimalController extends ChangeNotifier {
  String animalName = '';
  String description = '';
  String price = '';
  String categoryName = '';

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
}
