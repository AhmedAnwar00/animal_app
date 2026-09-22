import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;

  static const BorderRadius _borderRadius = BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextField(
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: AppColors.fieldFill,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: Assets.search.searchIcon.svg(
              width: 16.6849,
              height: 16.6639,
              fit: BoxFit.contain,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 16.6849,
            minHeight: 16.6639,
          ),
          border: const OutlineInputBorder(
            borderRadius: _borderRadius,
            borderSide: BorderSide(color: AppColors.fieldBorder),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: _borderRadius,
            borderSide: BorderSide(color: AppColors.fieldBorder),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: _borderRadius,
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
