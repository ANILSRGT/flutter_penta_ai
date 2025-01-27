import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/enums/app_localiaztions_enum.dart';

final class LocalizationManager {
  LocalizationManager._init();
  static final LocalizationManager _instance = LocalizationManager._init();
  static LocalizationManager get I => _instance;

  AppLocaliaztionsEnum _appLang = AppLocaliaztionsEnum.enUS;

  AppLocaliaztionsEnum get appLang => _appLang;

  List<Locale> get supportedLocales =>
      AppLocaliaztionsEnum.values.map((e) => e.locale).toList(growable: false);
  Locale get fallbackLocale => AppLocaliaztionsEnum.enUS.locale;

  Future<void> init(BuildContext context) async {
    _appLang = AppLocaliaztionsEnum.fromLocale(context.locale);
  }

  Future<void> setAppLang(
    BuildContext context,
    AppLocaliaztionsEnum lang,
  ) async {
    _appLang = lang;
    await context.setLocale(lang.locale);
  }
}
