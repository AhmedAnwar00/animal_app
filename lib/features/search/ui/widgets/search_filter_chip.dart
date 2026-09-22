import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SearchFilterChip extends StatelessWidget {
  const SearchFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = selected ? AppColors.white : AppColors.public;
    final background = selected
        ? AppColors.primary
        : AppColors.public.withValues(alpha: 0.1);

    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.category.globeAsia.svg(
                width: 10,
                height: 10,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(foreground, BlendMode.srcIn),
              ),
              const SizedBox(width: 3),
              Text(
                label,
                style: AppStyles.urbanistRegular10.copyWith(color: foreground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
