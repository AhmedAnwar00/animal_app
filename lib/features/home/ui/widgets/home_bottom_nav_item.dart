import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeBottomNavItem extends StatelessWidget {
  const HomeBottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
  });

  final SvgGenImage icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 24,
          height: 32,
          child: Center(child: icon.svg()),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.plusJakartaSansMedium12.copyWith(
            color: selected ? AppColors.primary : AppColors.navInactive,
          ),
        ),
      ],
    );
  }
}
