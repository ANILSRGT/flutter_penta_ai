import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/constants/app_icons.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_core/penta_core.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({
    required this.imageData,
    this.radius = 60,
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;
  final String? imageData;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: radius,
        height: radius,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.appThemeExt.appColors.primary,
          border: Border.all(
            color: context.appThemeExt.appColors.white.byBrightness(false),
            width: 1.5,
          ),
        ),
        child: imageData != null
            ? Image.memory(
                imageData.ext.convert.toUint8List,
                fit: BoxFit.cover,
              )
            : FittedBox(
                child: Padding(
                  padding: context.ext.padding.all.sm,
                  child: Icon(
                    AppIcons.person,
                    color: context.appThemeExt.appColors.lightGrey,
                  ),
                ),
              ),
      ),
    );
  }
}
