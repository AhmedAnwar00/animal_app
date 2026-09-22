import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/home/ui/widgets/home_bottom_nav_item.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.uploadFill,
        border: Border(
          top: BorderSide(color: AppColors.fieldBorder),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 9, 16, 12),
          child: Row(
            children: [
              Expanded(
                child: HomeBottomNavItem(
                  icon: Assets.home.navHome,
                  label: 'Home',
                  selected: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: HomeBottomNavItem(
                  icon: Assets.home.navSearch,
                  label: 'Search',
                  selected: false,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: HomeBottomNavItem(
                  icon: Assets.home.navCategory,
                  label: 'category',
                  selected: false,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: HomeBottomNavItem(
                  icon: Assets.home.navAnimal,
                  label: 'animal',
                  selected: false,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: HomeBottomNavItem(
                  icon: Assets.home.navMe,
                  label: 'Me',
                  selected: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
