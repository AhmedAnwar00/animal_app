import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:animal_app/features/category/model/category.dart';
import 'package:animal_app/features/category/ui/category_page.dart';
import 'package:animal_app/features/home/controller/home_controller.dart';
import 'package:animal_app/features/home/ui/widgets/home_animal_card.dart';
import 'package:animal_app/features/home/ui/widgets/home_category_row.dart';
import 'package:animal_app/features/home/ui/widgets/home_header.dart';
import 'package:animal_app/features/home/ui/widgets/home_section_header.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.categoryController});

  final CategoryController categoryController;

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

  @override
  Widget build(BuildContext context) {
    const homeController = HomeController();

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
                    listenable: categoryController,
                    builder: (context, _) {
                      return ListView(
                        padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                        children: [
                          HomeSectionHeader(
                            title:
                                'Categories ( ${categoryController.categories.length} )',
                            action: 'Add New Category',
                          ),
                          const SizedBox(height: 22),
                          HomeCategoryRow(
                            categories: categoryController.categories,
                            onCategoryTap: (category) =>
                                _openCategoryEdit(context, category),
                          ),
                          const SizedBox(height: 20),
                          const HomeSectionHeader(
                            title: 'All Animal ( 10 )',
                            action: 'Add New Animal',
                          ),
                          const SizedBox(height: 12),
                          for (var i = 0;
                              i < homeController.animals.length;
                              i++) ...[
                            if (i > 0) const SizedBox(height: 17),
                            HomeAnimalCard(
                              animal: homeController.animals[i],
                              image: Assets.home.animalCard,
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
