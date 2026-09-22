import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/home/controller/home_controller.dart';
import 'package:animal_app/features/home/ui/widgets/home_animal_card.dart';
import 'package:animal_app/features/home/ui/widgets/home_bottom_nav.dart';
import 'package:animal_app/features/home/ui/widgets/home_category_row.dart';
import 'package:animal_app/features/home/ui/widgets/home_header.dart';
import 'package:animal_app/features/home/ui/widgets/home_section_header.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const controller = HomeController();

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
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                    children: [
                      const HomeSectionHeader(
                        title: 'Categories ( 10 )',
                        action: 'Add New Category',
                      ),
                      const SizedBox(height: 22),
                      HomeCategoryRow(categories: controller.categories),
                      const SizedBox(height: 20),
                      const HomeSectionHeader(
                        title: 'All Animal ( 10 )',
                        action: 'Add New Animal',
                      ),
                      const SizedBox(height: 12),
                      for (var i = 0; i < controller.animals.length; i++) ...[
                        if (i > 0) const SizedBox(height: 17),
                        HomeAnimalCard(
                          animal: controller.animals[i],
                          image: Assets.home.animalCard,
                        ),
                      ],
                    ],
                  ),
                ),
                const HomeBottomNav(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
