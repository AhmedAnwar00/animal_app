import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/search/controller/search_controller.dart';
import 'package:animal_app/features/search/ui/widgets/search_field.dart';
import 'package:animal_app/features/search/ui/widgets/search_filter_row.dart';
import 'package:flutter/material.dart' hide SearchController;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final SearchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SearchController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: ListenableBuilder(
              listenable: _controller,
              builder: (context, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
                      child: SearchField(
                        onChanged: _controller.updateQuery,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: SearchFilterRow(
                        selectedFilter: _controller.selectedFilter,
                        onFilterSelected: _controller.selectFilter,
                      ),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
