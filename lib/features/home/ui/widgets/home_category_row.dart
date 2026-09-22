import 'package:animal_app/features/home/model/home_category.dart';
import 'package:animal_app/features/home/ui/widgets/home_category_item.dart';
import 'package:animal_app/features/home/ui/widgets/home_see_all_button.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({super.key, required this.categories});

  final List<HomeCategory> categories;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < categories.length; i++) ...[
          if (i > 0) const SizedBox(width: 23),
          HomeCategoryItem(
            category: categories[i],
            image: _imageFor(categories[i]),
          ),
        ],
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(top: 24),
          child: HomeSeeAllButton(),
        ),
      ],
    );
  }

  AssetGenImage _imageFor(HomeCategory category) {
    return switch (category.name) {
      'Cats' => Assets.home.categoryCat,
      'Rabbit' => Assets.home.categoryRabbit,
      _ => Assets.home.categoryDog,
    };
  }
}
