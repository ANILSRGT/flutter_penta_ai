import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:penta_ai/core/configs/enums/app_localiaztions_enum.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_ai/core/localization/localization_manager.dart';
import 'package:penta_core/penta_core.dart';

class AppLangDropdown extends StatelessWidget {
  const AppLangDropdown({
    super.key,
    this.onChanged,
    this.focusNode,
  });

  final void Function(AppLocaliaztionsEnum)? onChanged;
  final FocusNode? focusNode;

  static AppLangDropdown circle({
    void Function(AppLocaliaztionsEnum)? onChanged,
    FocusNode? focusNode,
    double size = 60,
  }) =>
      _AppLangDropdownCircle(
        onChanged: onChanged,
        focusNode: focusNode,
        size: size,
      );

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<AppLocaliaztionsEnum>(
      value: AppLocaliaztionsEnum.fromLocale(context.locale),
      onChanged: (value) async {
        if (value == null) return;
        await LocalizationManager.I.setAppLang(context, value);
        onChanged?.call(value);
      },
      focusNode: focusNode,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      items: AppLocaliaztionsEnum.values
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Row(
                spacing: context.ext.values.sm,
                children: [
                  SizedBox(
                    width: 30,
                    height: 20,
                    child: SvgPicture.asset(
                      e.flagSvgAssetPath,
                    ),
                  ),
                  Text(e.displayName),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _AppLangDropdownCircle extends AppLangDropdown {
  const _AppLangDropdownCircle({
    super.onChanged,
    super.focusNode,
    this.size = 60,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    final svgKey = GlobalKey();
    var currentLocale = AppLocaliaztionsEnum.fromLocale(context.locale);
    return Hero(
      tag: 'app_lang_dropdown',
      child: SizedBox.square(
        dimension: size,
        child: Material(
          clipBehavior: Clip.antiAlias,
          elevation: 1,
          shape: CircleBorder(
            side: BorderSide(
              color: context.appThemeExt.appColors.white.byBrightness(false),
              width: (size / 12.0).clamp(1, 6),
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () async {
              final renderBox =
                  svgKey.currentContext?.findRenderObject() as RenderBox?;
              final position = renderBox?.localToGlobal(Offset.zero);
              final size = renderBox?.size;
              await showMenu(
                context: context,
                position: RelativeRect.fromLTRB(
                  position?.dx ?? 0,
                  position?.dy ?? 0,
                  position?.dx ?? 0 + (size?.width ?? 0),
                  position?.dy ?? 0 + (size?.height ?? 0),
                ),
                items: AppLocaliaztionsEnum.values
                    .map(
                      (e) => PopupMenuItem(
                        value: e,
                        onTap: () {
                          if (e == currentLocale) return;
                          currentLocale = e;
                          LocalizationManager.I.setAppLang(context, e);
                          onChanged?.call(e);
                        },
                        child: Row(
                          spacing: context.ext.values.sm,
                          children: [
                            SizedBox(
                              width: 30,
                              height: 20,
                              child: SvgPicture.asset(
                                e.flagSvgAssetPath,
                              ),
                            ),
                            Text(e.displayName),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              );
            },
            child: SvgPicture.asset(
              AppLocaliaztionsEnum.fromLocale(context.locale)
                  .flagRoundedSvgAssetPath,
              key: svgKey,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
