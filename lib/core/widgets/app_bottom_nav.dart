import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/widgets/app_bottom_nav_item.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      elevation: 8,
      shadowColor: AppColors.black.withValues(alpha: 0.08),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 9, 16, 12),
          child: Row(
            children: [
              Expanded(
                child: AppBottomNavItem(
                  icon: Assets.home.navHome,
                  label: context.l10n.home,
                  selected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppBottomNavItem(
                  icon: Assets.home.navSearch,
                  label: context.l10n.search,
                  selected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppBottomNavItem(
                  icon: Assets.home.navCategory,
                  label: context.l10n.navCategory,
                  selected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppBottomNavItem(
                  icon: Assets.home.navAnimal,
                  label: context.l10n.navAnimal,
                  selected: currentIndex == 3,
                  onTap: () => onTap(3),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppBottomNavItem(
                  icon: Assets.home.navMe,
                  label: context.l10n.me,
                  selected: currentIndex == 4,
                  onTap: () => onTap(4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
