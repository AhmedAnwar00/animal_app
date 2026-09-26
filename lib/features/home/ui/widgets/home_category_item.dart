import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/features/home/model/home_category.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    super.key,
    required this.category,
    required this.image,
    this.onTap,
  });

  final HomeCategory category;
  final AssetGenImage image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          SizedBox(
            width: 63,
            height: 63,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipOval(
                  child: image.image(
                    width: 63,
                    height: 63,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: -3,
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.seeAll,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${category.count}',
                      style: AppStyles.urbanistMedium12.copyWith(
                        color: AppColors.white,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            category.name,
            style: AppStyles.urbanistMedium16.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
