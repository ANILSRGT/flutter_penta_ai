import 'package:easy_localization/easy_localization.dart';

extension LocalizationStringExt on String {
  String get translate => tr(this);
  String translateWith(List<String> args) => tr(this, args: args);
}
