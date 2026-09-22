import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/animal/controller/animal_controller.dart';
import 'package:animal_app/features/animal/ui/widgets/animal_description_field.dart';
import 'package:animal_app/features/animal/ui/widgets/animal_image_upload.dart';
import 'package:animal_app/features/animal/ui/widgets/animal_title.dart';
import 'package:animal_app/features/category/ui/widgets/category_labeled_field.dart';
import 'package:animal_app/features/category/ui/widgets/category_user_header.dart';
import 'package:flutter/material.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  late final AnimalController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimalController();
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
                    const AnimalTitle(),
                    const SizedBox(height: 16),
                    const CategoryUserHeader(),
                    const SizedBox(height: 24),
                    CategoryLabeledField(
                      label: 'Animal Name',
                      hintText: 'Enter your Animal Name',
                      onChanged: _controller.updateAnimalName,
                    ),
                    const SizedBox(height: 22),
                    AnimalDescriptionField(
                      onChanged: _controller.updateDescription,
                    ),
                    const SizedBox(height: 22),
                    AnimalImageUpload(
                      onSelectPressed: () {},
                    ),
                    const SizedBox(height: 22),
                    CategoryLabeledField(
                      label: 'Animal Price',
                      hintText: 'Enter your Animal Price',
                      onChanged: _controller.updatePrice,
                    ),
                    const SizedBox(height: 22),
                    CategoryLabeledField(
                      label: 'Category Name',
                      hintText: 'Enter your Category Name',
                      onChanged: _controller.updateCategoryName,
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
