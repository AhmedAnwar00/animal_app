import 'package:animal_app/features/animal/controller/animal_controller.dart';
import 'package:animal_app/features/animal/model/animal.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:animal_app/features/search/model/search_filter.dart';
import 'package:flutter/foundation.dart';

class SearchController extends ChangeNotifier {
  SearchController(this._animalController, this._categoryController) {
    _animalController.addListener(_onSourceChanged);
    _categoryController.addListener(_onSourceChanged);
    _apply();
  }

  final AnimalController _animalController;
  final CategoryController _categoryController;

  String query = '';
  SearchFilter selectedFilter = SearchFilter.category;
  List<Animal> results = [];

  void updateQuery(String value) {
    query = value;
    _apply();
    notifyListeners();
  }

  void selectFilter(SearchFilter filter) {
    if (selectedFilter == filter) return;
    selectedFilter = filter;
    _apply();
    notifyListeners();
  }

  @override
  void dispose() {
    _animalController.removeListener(_onSourceChanged);
    _categoryController.removeListener(_onSourceChanged);
    super.dispose();
  }

  void _onSourceChanged() {
    _apply();
    notifyListeners();
  }

  void _apply() {
    final trimmed = query.trim().toLowerCase();
    final animals = _animalController.animals;

    if (trimmed.isEmpty) {
      results = List<Animal>.from(animals);
      return;
    }

    if (selectedFilter == SearchFilter.animal) {
      results = [
        for (final animal in animals)
          if (animal.name.toLowerCase().contains(trimmed)) animal,
      ];
      return;
    }

    final matchingCategoryIds = {
      for (final category in _categoryController.categories)
        if (category.name.toLowerCase().contains(trimmed)) category.id,
    };

    results = [
      for (final animal in animals)
        if (matchingCategoryIds.contains(animal.categoryId)) animal,
    ];
  }
}
