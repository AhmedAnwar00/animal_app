import 'package:animal_app/core/network/api_constants.dart';
import 'package:animal_app/features/category/model/category.dart';
import 'package:animal_app/features/home/model/home_category.dart';
import 'package:animal_app/features/home/ui/widgets/home_category_item.dart';
import 'package:animal_app/features/home/ui/widgets/home_see_all_button.dart';
import 'package:flutter/material.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({
    super.key,
    required this.categories,
    required this.onCategoryTap,
  });

  final List<Category> categories;
  final ValueChanged<Category> onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < categories.length; i++) ...[
          if (i > 0) const SizedBox(width: 23),
          HomeCategoryItem(
            category: HomeCategory(name: categories[i].name, count: 0),
            imageUrl: ApiConstants.resolveMediaUrl(categories[i].imagePath) ??
                '',
            onTap: () => onCategoryTap(categories[i]),
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
}
