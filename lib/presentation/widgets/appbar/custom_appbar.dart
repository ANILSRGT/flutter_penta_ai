import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/constants/app_configs.dart';
import 'package:penta_ai/core/configs/constants/app_icons.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_ai/presentation/widgets/logo/app_logo.dart';
import 'package:penta_core/penta_core.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    this.title,
    this.actions,
    this.isBackButtonVisible = true,
    this.titleCenter = true,
    this.hasLogo = true,
    super.key,
  });

  final bool isBackButtonVisible;
  final String? title;
  final bool titleCenter;
  final bool hasLogo;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      backgroundColor: context.appThemeExt.appColors.background
          .byBrightness(context.ext.theme.isDark),
      foregroundColor: context.appThemeExt.appColors.background
          .byBrightness(context.ext.theme.isDark)
          .onColor,
      iconTheme: IconThemeData(
        color: context.appThemeExt.appColors.background
            .byBrightness(context.ext.theme.isDark)
            .onColor,
      ),
      actionsIconTheme: IconThemeData(
        color: context.appThemeExt.appColors.background
            .byBrightness(context.ext.theme.isDark)
            .onColor,
      ),
      leading: isBackButtonVisible && context.router.canPop()
          ? IconButton(
              icon: const Icon(AppIcons.back),
              onPressed: () => context.router.back(),
            )
          : hasLogo
              ? const AppLogo()
              : null,
      title: title != null
          ? Text(
              title!,
              style: context.ext.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      actions: actions,
      centerTitle: titleCenter,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppConfigs.appBarHeight);
}
