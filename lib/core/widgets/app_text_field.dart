import 'package:animal_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.maxLines = 1,
    this.textInputAction,
    this.errorText,
    this.style,
    this.hintStyle,
    this.contentPadding,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool? enabled;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final String? errorText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;

  static const BorderRadius _borderRadius = BorderRadius.all(Radius.circular(8));

  static final Color _fillColor = WidgetStateColor.resolveWith((states) {
    if (states.contains(WidgetState.focused) ||
        states.contains(WidgetState.error)) {
      return AppColors.white;
    }
    return AppColors.fieldFill;
  });

  static const OutlineInputBorder _enabledBorder = OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(color: Colors.transparent, width: 1),
  );

  static const OutlineInputBorder _focusedBorder = OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(color: AppColors.primary, width: 1),
  );

  static const OutlineInputBorder _errorBorder = OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: BorderSide(color: AppColors.passwordError, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      enabled: enabled,
      readOnly: readOnly,
      onTap: readOnly
          ? null
          : () {
              SystemChannels.textInput.invokeMethod('TextInput.show');
            },
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      textInputAction: textInputAction,
      style: style,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: _fillColor,
        contentPadding: contentPadding,
        border: _enabledBorder,
        enabledBorder: _enabledBorder,
        focusedBorder: _focusedBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
        disabledBorder: _enabledBorder,
      ),
    );
  }
}
