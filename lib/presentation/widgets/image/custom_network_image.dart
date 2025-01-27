import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/constants/app_icons.dart';
import 'package:penta_ai/presentation/widgets/animated/animated_shipper_container.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    this.fit,
    super.key,
  });

  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      errorBuilder: (context, error, stackTrace) => ColoredBox(
        color: Colors.grey.shade700,
        child: const Center(
          child: FittedBox(
            child: Icon(
              AppIcons.gallery,
              color: Colors.grey,
              size: 48,
            ),
          ),
        ),
      ),
      frameBuilder: (
        context,
        child,
        frame,
        wasSynchronouslyLoaded,
      ) =>
          frame != null
              ? child
              : const AnimatedShipperContainer(child: SizedBox.expand()),
      fit: fit,
    );
  }
}
