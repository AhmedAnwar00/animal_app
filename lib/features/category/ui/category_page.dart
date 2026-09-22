import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:animal_app/features/category/ui/widgets/category_description_field.dart';
import 'package:animal_app/features/category/ui/widgets/category_image_upload.dart';
import 'package:animal_app/features/category/ui/widgets/category_labeled_field.dart';
import 'package:animal_app/features/category/ui/widgets/category_save_button.dart';
import 'package:animal_app/features/category/ui/widgets/category_title.dart';
import 'package:animal_app/features/category/ui/widgets/category_user_header.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final CategoryController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CategoryController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: ListenableBuilder(
              listenable: _controller,
              builder: (context, _) {
                return ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  children: [
                    const CategoryTitle(),
                    const SizedBox(height: 16),
                    const CategoryUserHeader(),
                    const SizedBox(height: 24),
                    CategoryLabeledField(
                      label: 'Category Name',
                      hintText: 'Enter your Category Name',
                      onChanged: _controller.updateCategoryName,
                    ),
                    const SizedBox(height: 22),
                    CategoryDescriptionField(
                      onChanged: _controller.updateDescription,
                    ),
                    const SizedBox(height: 22),
                    CategoryImageUpload(
                      onSelectPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    CategorySaveButton(
                      onPressed: () {},
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
