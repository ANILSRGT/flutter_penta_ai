import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penta_ai/core/configs/constants/app_icons.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_core/penta_core.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    required this.controller,
    required this.hintText,
    required this.focusNode,
    required this.keyboardType,
    required this.textInputAction,
    super.key,
    this.onChanged,
    this.prefixIcon,
    this.inputFormatters,
    this.validator,
    this.nextFocusNode,
    this.maxLength,
    this.maxLines = 1,
    this.showCounter = true,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final bool showCounter;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isObscure = true;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appThemeExt.appColors;
    final isPassword = widget.keyboardType == TextInputType.visiblePassword;
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      obscureText: isPassword && _isObscure,
      obscuringCharacter: '⁕',
      maxLength: widget.maxLength,
      minLines: 1,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      onTapOutside: (_) => widget.focusNode.unfocus(),
      onFieldSubmitted: (_) => widget.nextFocusNode?.requestFocus(),
      validator: widget.validator,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) {
        if (maxLength != null && maxLength > 0 && !widget.showCounter) {
          return null;
        }
        return (widget.maxLength != null && widget.maxLength! > 0)
            ? Text(
                '$currentLength/$maxLength',
                style: context.ext.theme.textTheme.bodySmall?.copyWith(
                  color: appColors.grey,
                ),
              )
            : null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: _toggleObscure,
                child: Icon(AppIcons.visibility(!_isObscure)),
              )
            : null,
        fillColor: appColors.primary,
        border: OutlineInputBorder(
          borderRadius: context.ext.radius.border.all.sm,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: context.ext.radius.border.all.sm,
          borderSide: BorderSide(
            color: appColors.error.byBrightness(context.ext.theme.isDark),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: context.ext.radius.border.all.sm,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: context.ext.radius.border.all.sm,
          borderSide: BorderSide(color: appColors.primary),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: context.ext.radius.border.all.sm,
          borderSide: BorderSide(color: appColors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: context.ext.radius.border.all.sm,
          borderSide: BorderSide(
            color: appColors.error.byBrightness(context.ext.theme.isDark),
          ),
        ),
      ),
    );
  }
}
