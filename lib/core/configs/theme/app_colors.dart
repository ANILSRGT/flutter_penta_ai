import 'package:penta_core/penta_core.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.white,
    required this.black,
    required this.grey,
    required this.lightGrey,
    required this.darkGrey,
    required this.error,
    required this.success,
    required this.warning,
    required this.info,
  });

  final OnColor primary;
  final OnColor secondary;
  final BrightnessOnColor background;
  final BrightnessOnColor white;
  final BrightnessOnColor black;
  final OnColor grey;
  final OnColor lightGrey;
  final OnColor darkGrey;
  final BrightnessOnColor error;
  final BrightnessOnColor success;
  final BrightnessOnColor warning;
  final BrightnessOnColor info;
}
