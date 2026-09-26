import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_image_source_sheet.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:animal_app/features/category/ui/widgets/category_description_field.dart';
import 'package:animal_app/features/category/ui/widgets/category_image_upload.dart';
import 'package:animal_app/features/category/ui/widgets/category_labeled_field.dart';
import 'package:animal_app/features/category/ui/widgets/category_save_button.dart';
import 'package:animal_app/features/category/ui/widgets/category_title.dart';
import 'package:animal_app/features/category/ui/widgets/category_user_header.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.controller});

  final CategoryController controller;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  void _handleMessages() {
    final error = widget.controller.errorMessage;
    final success = widget.controller.successMessage;
    if ((error == null && success == null) || !mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
        widget.controller.clearError();
      }
      if (success != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(success)),
        );
        widget.controller.clearSuccessMessage();
      }
    });
  }

  Future<void> _onSelectImagePressed() async {
    final source = await SignUpImageSourceSheet.show(context);
    if (!mounted) return;
    switch (source) {
      case SignUpImageSource.gallery:
        await widget.controller.pickFromGallery();
      case SignUpImageSource.camera:
        await widget.controller.pickFromCamera();
      case SignUpImageSource.cancel:
      case null:
        break;
    }
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
              listenable: widget.controller,
              builder: (context, _) {
                _handleMessages();
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
                      onChanged: widget.controller.updateCategoryName,
                    ),
                    const SizedBox(height: 22),
                    CategoryDescriptionField(
                      onChanged: widget.controller.updateDescription,
                    ),
                    const SizedBox(height: 22),
                    CategoryImageUpload(
                      imagePath: widget.controller.imagePath,
                      onSelectPressed: _onSelectImagePressed,
                    ),
                    const SizedBox(height: 24),
                    CategorySaveButton(
                      onPressed: widget.controller.createCategory,
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
