import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:penta_ai/core/configs/constants/app_vectors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 75,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: SvgPicture.asset(
        AppVectors.logo,
      ),
    );
  }
}
