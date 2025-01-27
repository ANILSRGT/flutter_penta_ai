import 'package:flutter/material.dart';

enum AppLocaliaztionsEnum {
  enUS(
    displayName: 'English (US)',
    countryCode: 'US',
    languageCode: 'en',
  ),
  trTR(
    displayName: 'Türkçe (TR)',
    countryCode: 'TR',
    languageCode: 'tr',
  );

  const AppLocaliaztionsEnum({
    required this.displayName,
    required this.countryCode,
    required this.languageCode,
  });

  final String displayName;
  final String countryCode;
  final String languageCode;

  String get localeString => '${languageCode}_$countryCode';
  Locale get locale => Locale(languageCode, countryCode);

  static const translationsJsonAssetsFolder = 'assets/translations';

  String get flagSvgAssetPath =>
      'assets/vectors/flags/${languageCode}_$countryCode.svg';

  String get flagRoundedSvgAssetPath =>
      'assets/vectors/flags/${languageCode}_${countryCode}_rounded.svg';

  static AppLocaliaztionsEnum fromLocaleString(String localeString) {
    return AppLocaliaztionsEnum.values.firstWhere(
      (e) => e.localeString == localeString,
      orElse: () => AppLocaliaztionsEnum.enUS,
    );
  }

  static AppLocaliaztionsEnum fromLocale(Locale locale) {
    return AppLocaliaztionsEnum.values.firstWhere(
      (e) => e.locale == locale,
      orElse: () => AppLocaliaztionsEnum.enUS,
    );
  }
}
