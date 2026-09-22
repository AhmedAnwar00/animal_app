import 'package:animal_app/features/search/model/search_filter.dart';
import 'package:flutter/foundation.dart';

class SearchController extends ChangeNotifier {
  String query = '';
  SearchFilter selectedFilter = SearchFilter.category;

  void updateQuery(String value) {
    query = value;
    notifyListeners();
  }

  void selectFilter(SearchFilter filter) {
    if (selectedFilter == filter) return;
    selectedFilter = filter;
    notifyListeners();
  }
}
