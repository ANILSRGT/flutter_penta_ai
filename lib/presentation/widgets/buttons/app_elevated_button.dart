import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_ai/presentation/widgets/loading_indicator/app_loading_indicator.dart';
import 'package:penta_core/penta_core.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.child,
    required this.onPressed,
    super.key,
    this.focusNode,
    this.foregroundColor,
    this.backgroundColor,
    this.isLoading = false,
  });

  const factory AppElevatedButton.primary({
    required VoidCallback onPressed,
    required Widget child,
    Key? key,
    FocusNode? focusNode,
    bool isLoading,
  }) = _PrimaryAppElevatedButton;

  const factory AppElevatedButton.outlined({
    required VoidCallback onPressed,
    required Widget child,
    Key? key,
    FocusNode? focusNode,
    bool isLoading,
  }) = _OutlinedAppElevatedButton;

  const factory AppElevatedButton.gray({
    required VoidCallback onPressed,
    required Widget child,
    Key? key,
    FocusNode? focusNode,
    bool isLoading,
  }) = _GrayAppElevatedButton;

  final VoidCallback? onPressed;
  final Widget child;
  final FocusNode? focusNode;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        focusNode: focusNode,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? context.appThemeExt.appColors.secondary,
          foregroundColor: foregroundColor ??
              context.appThemeExt.appColors.secondary.onColor,
          padding: context.ext.padding.horizontal.lg +
              (context.ext.padding.vertical.lg * 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: context.ext.radius.border.all.lg,
          ),
          textStyle: context.ext.theme.textTheme.titleMedium,
        ),
        child: DefaultTextStyle(
          style: (context.ext.theme.textTheme.titleMedium ?? const TextStyle())
              .copyWith(
            color: foregroundColor ??
                context.appThemeExt.appColors.secondary.onColor,
          ),
          textAlign: TextAlign.center,
          child: isLoading ? const AppLoadingIndicator(size: 32) : child,
        ),
      ),
    );
  }
}

class _PrimaryAppElevatedButton extends AppElevatedButton {
  const _PrimaryAppElevatedButton({
    required VoidCallback super.onPressed,
    required super.child,
    super.key,
    super.focusNode,
    super.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        focusNode: focusNode,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? context.appThemeExt.appColors.primary,
          foregroundColor:
              foregroundColor ?? context.appThemeExt.appColors.primary.onColor,
          padding: context.ext.padding.horizontal.lg +
              (context.ext.padding.vertical.lg * 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: context.ext.radius.border.all.lg,
          ),
          textStyle: context.ext.theme.textTheme.titleMedium,
        ),
        child: DefaultTextStyle(
          style: (context.ext.theme.textTheme.titleMedium ?? const TextStyle())
              .copyWith(
            color: foregroundColor ??
                context.appThemeExt.appColors.primary.onColor,
          ),
          textAlign: TextAlign.center,
          child: isLoading ? const AppLoadingIndicator(size: 32) : child,
        ),
      ),
    );
  }
}

class _OutlinedAppElevatedButton extends AppElevatedButton {
  const _OutlinedAppElevatedButton({
    required VoidCallback super.onPressed,
    required super.child,
    super.key,
    super.focusNode,
    super.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: OutlinedButton(
        onPressed: isLoading ? () {} : onPressed,
        focusNode: focusNode,
        style: OutlinedButton.styleFrom(
          foregroundColor: context.appThemeExt.appColors.primary,
          padding: context.ext.padding.horizontal.lg +
              (context.ext.padding.vertical.lg * 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: context.ext.radius.border.all.lg,
          ),
          textStyle: context.ext.theme.textTheme.titleMedium,
        ),
        child: DefaultTextStyle(
          style: (context.ext.theme.textTheme.titleMedium ?? const TextStyle())
              .copyWith(
            color: foregroundColor ?? context.appThemeExt.appColors.primary,
          ),
          textAlign: TextAlign.center,
          child: isLoading ? const AppLoadingIndicator(size: 32) : child,
        ),
      ),
    );
  }
}

class _GrayAppElevatedButton extends AppElevatedButton {
  const _GrayAppElevatedButton({
    required VoidCallback super.onPressed,
    required super.child,
    super.key,
    super.focusNode,
    super.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        focusNode: focusNode,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.ext.theme.convertByBrightness(
            light: context.appThemeExt.appColors.grey,
            dark: context.appThemeExt.appColors.grey,
          ),
          foregroundColor: context.ext.theme.convertByBrightness(
            light: context.appThemeExt.appColors.grey.onColor,
            dark: context.appThemeExt.appColors.grey.onColor,
          ),
          padding: context.ext.padding.horizontal.lg +
              (context.ext.padding.vertical.lg * 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: context.ext.radius.border.all.lg,
          ),
          textStyle: context.ext.theme.textTheme.titleMedium,
        ),
        child: DefaultTextStyle(
          style: (context.ext.theme.textTheme.titleMedium ?? const TextStyle())
              .copyWith(
            color:
                foregroundColor ?? context.appThemeExt.appColors.grey.onColor,
          ),
          textAlign: TextAlign.center,
          child: isLoading ? const AppLoadingIndicator(size: 32) : child,
        ),
      ),
    );
  }
}
