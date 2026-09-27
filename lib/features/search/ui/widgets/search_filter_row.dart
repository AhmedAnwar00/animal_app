import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/features/search/model/search_filter.dart';
import 'package:animal_app/features/search/ui/widgets/search_filter_chip.dart';
import 'package:flutter/material.dart';

class SearchFilterRow extends StatelessWidget {
  const SearchFilterRow({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  final SearchFilter selectedFilter;
  final ValueChanged<SearchFilter> onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchFilterChip(
          label: context.l10n.category,
          selected: selectedFilter == SearchFilter.category,
          onTap: () => onFilterSelected(SearchFilter.category),
        ),
        const SizedBox(width: 12),
        SearchFilterChip(
          label: context.l10n.animal,
          selected: selectedFilter == SearchFilter.animal,
          onTap: () => onFilterSelected(SearchFilter.animal),
        ),
      ],
    );
  }
}
