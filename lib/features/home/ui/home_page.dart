import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/animal/controller/animal_controller.dart';
import 'package:animal_app/features/animal/model/animal.dart';
import 'package:animal_app/features/animal/ui/animal_page.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:animal_app/features/category/model/category.dart';
import 'package:animal_app/features/category/ui/category_page.dart';
import 'package:animal_app/features/home/ui/widgets/home_animal_card.dart';
import 'package:animal_app/features/home/ui/widgets/home_category_row.dart';
import 'package:animal_app/features/home/ui/widgets/home_empty_state.dart';
import 'package:animal_app/features/home/ui/widgets/home_header.dart';
import 'package:animal_app/features/home/ui/widgets/home_section_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.categoryController,
    required this.animalController,
  });

  final CategoryController categoryController;
  final AnimalController animalController;

  void _openCategoryEdit(BuildContext context, Category category) {
    categoryController.beginEdit(category);
    Navigator.of(context)
        .push(
          MaterialPageRoute<void>(
            builder: (_) => CategoryPage(controller: categoryController),
          ),
        )
        .then((_) => categoryController.clearEdit());
  }

  void _openAnimalEdit(BuildContext context, Animal animal) {
    animalController.beginEdit(animal);
    Navigator.of(context)
        .push(
          MaterialPageRoute<void>(
            builder: (_) => AnimalPage(controller: animalController),
          ),
        )
        .then((_) => animalController.clearEdit());
  }

  void _handleLoadError(BuildContext context) {
    final error = animalController.loadErrorMessage;
    if (error == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      if (animalController.loadErrorMessage == null) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      animalController.clearLoadError();
    });
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
            child: Column(
              children: [
                const HomeHeader(),
                Expanded(
                  child: ListenableBuilder(
                    listenable: Listenable.merge([
                      categoryController,
                      animalController,
                    ]),
                    builder: (context, _) {
                      _handleLoadError(context);
                      final categories = categoryController.categories;
                      final animals = animalController.animals;

                      return ListView(
                        padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                        children: [
                          HomeSectionHeader(
                            title: 'Categories ( ${categories.length} )',
                            action: 'Add New Category',
                          ),
                          const SizedBox(height: 22),
                          if (categories.isEmpty)
                            const HomeEmptyState(
                              title: 'No Category Found!',
                              message: 'There is no Category to display.',
                            )
                          else
                            HomeCategoryRow(
                              categories: categories,
                              onCategoryTap: (category) =>
                                  _openCategoryEdit(context, category),
                            ),
                          const SizedBox(height: 20),
                          HomeSectionHeader(
                            title: 'All Animal ( ${animals.length} )',
                            action: 'Add New Animal',
                          ),
                          const SizedBox(height: 12),
                          if (animals.isEmpty)
                            const HomeEmptyState(
                              title: 'No Animal Found!',
                              message: 'There is no Animal to display.',
                            )
                          else
                            for (var i = 0; i < animals.length; i++) ...[
                              if (i > 0) const SizedBox(height: 17),
                              HomeAnimalCard(
                                animal: animals[i],
                                onEditPressed: () =>
                                    _openAnimalEdit(context, animals[i]),
                              ),
                            ],
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
