import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/constants/app_rives.dart';
import 'package:penta_core/penta_core.dart';
import 'package:rive/rive.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
    this.size = 54,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          context.ext.theme.convertByBrightness(
            light: Colors.black,
            dark: Colors.white,
          ),
          BlendMode.srcATop,
        ),
        child: const RiveAnimation.asset(
          AppRives.loadingRive,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
