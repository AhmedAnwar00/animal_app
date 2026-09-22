import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/features/home/model/home_animal.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeAnimalCard extends StatelessWidget {
  const HomeAnimalCard({
    super.key,
    required this.animal,
    required this.image,
  });

  final HomeAnimal animal;
  final AssetGenImage image;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animal.name,
                          style: AppStyles.urbanistSemiBold12.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          animal.creator,
                          style: AppStyles.urbanistRegular12.copyWith(
                            color: AppColors.textCaption,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    animal.price,
                    style: AppStyles.urbanistSemiBold12.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Assets.home.moreVert.svg(),
                ],
              ),
            ),
            const SizedBox(height: 11),
            SizedBox(
              height: 173,
              width: double.infinity,
              child: image.image(
                height: 173,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  animal.description,
                  style: AppStyles.urbanistRegular12.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
