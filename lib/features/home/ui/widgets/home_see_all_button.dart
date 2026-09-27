import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class HomeSeeAllButton extends StatelessWidget {
  const HomeSeeAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 15,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.seeAll,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        context.l10n.seeAll,
        style: AppStyles.poppinsRegular8.copyWith(color: AppColors.white),
      ),
    );
  }
}
