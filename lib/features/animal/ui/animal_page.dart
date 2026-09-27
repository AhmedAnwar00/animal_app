import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/animal/controller/animal_controller.dart';
import 'package:animal_app/features/animal/ui/widgets/animal_delete_confirmation_dialog.dart';
import 'package:animal_app/features/animal/ui/widgets/animal_description_field.dart';
import 'package:animal_app/features/animal/ui/widgets/animal_image_upload.dart';
import 'package:animal_app/features/animal/ui/widgets/animal_title.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_image_source_sheet.dart';
import 'package:animal_app/features/category/ui/widgets/category_delete_button.dart';
import 'package:animal_app/features/category/ui/widgets/category_labeled_field.dart';
import 'package:animal_app/features/category/ui/widgets/category_save_button.dart';
import 'package:animal_app/features/category/ui/widgets/category_user_header.dart';
import 'package:flutter/material.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({
    super.key,
    required this.controller,
    this.onEditingFinished,
  });

  final AnimalController controller;
  final VoidCallback? onEditingFinished;

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  void _handleMessages() {
    if (widget.controller.errorMessage == null &&
        widget.controller.successMessage == null) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final error = widget.controller.errorMessage;
      final success = widget.controller.successMessage;
      if (error != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error)));
        widget.controller.clearError();
      }
      if (success != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(success)));
        widget.controller.clearSuccessMessage();
      }
    });
  }

  Future<void> _onSavePressed() async {
    final wasEditing = widget.controller.isEditing;
    final success = await widget.controller.saveAnimal();
    if (!mounted) return;
    if (wasEditing && success) {
      _leaveEdit();
    }
  }

  Future<void> _onDeletePressed() async {
    final confirmed = await AnimalDeleteConfirmationDialog.show(context);
    if (!confirmed || !mounted) return;

    final success = await widget.controller.deleteAnimal();
    if (!mounted) return;
    if (success) {
      _leaveEdit();
    }
  }

  void _leaveEdit() {
    widget.controller.clearEdit();
    final onEditingFinished = widget.onEditingFinished;
    if (onEditingFinished != null) {
      onEditingFinished();
      return;
    }
    Navigator.of(context).pop();
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
                final isEditing = widget.controller.isEditing;
                final formKey =
                    '${widget.controller.editingAnimalId}-${widget.controller.formVersion}';
                return ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  children: [
                    const AnimalTitle(),
                    const SizedBox(height: 16),
                    const CategoryUserHeader(),
                    const SizedBox(height: 24),
                    CategoryLabeledField(
                      key: ValueKey('name-$formKey'),
                      label: 'Animal Name',
                      hintText: 'Enter your Animal Name',
                      initialValue: isEditing
                          ? widget.controller.animalName
                          : null,
                      onChanged: widget.controller.updateAnimalName,
                    ),
                    const SizedBox(height: 22),
                    AnimalDescriptionField(
                      key: ValueKey('description-$formKey'),
                      initialValue: isEditing
                          ? widget.controller.description
                          : null,
                      onChanged: widget.controller.updateDescription,
                    ),
                    const SizedBox(height: 22),
                    AnimalImageUpload(
                      imagePath: widget.controller.imagePath,
                      networkImageUrl: widget.controller.existingImageUrl,
                      onSelectPressed: _onSelectImagePressed,
                    ),
                    const SizedBox(height: 22),
                    CategoryLabeledField(
                      key: ValueKey('price-$formKey'),
                      label: 'Animal Price',
                      hintText: 'Enter your Animal Price',
                      initialValue: isEditing ? widget.controller.price : null,
                      onChanged: widget.controller.updatePrice,
                    ),
                    const SizedBox(height: 22),
                    CategoryLabeledField(
                      key: ValueKey('category-$formKey'),
                      label: 'Category Name',
                      hintText: 'Enter your Category Name',
                      initialValue: isEditing
                          ? widget.controller.categoryName
                          : null,
                      onChanged: widget.controller.updateCategoryName,
                    ),
                    const SizedBox(height: 24),
                    CategorySaveButton(
                      label: isEditing ? 'Edit' : 'Save',
                      onPressed: _onSavePressed,
                    ),
                    if (isEditing) ...[
                      const SizedBox(height: 12),
                      CategoryDeleteButton(onPressed: _onDeletePressed),
                    ],
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
