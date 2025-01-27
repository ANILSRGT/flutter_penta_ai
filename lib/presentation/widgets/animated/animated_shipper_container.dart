import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedShipperContainer extends StatefulWidget {
  const AnimatedShipperContainer({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  State<AnimatedShipperContainer> createState() =>
      _AnimatedShipperContainerState();
}

class _AnimatedShipperContainerState extends State<AnimatedShipperContainer>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )
    ..forward()
    ..repeat(reverse: true);

  late final _curvedAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    _curvedAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curvedAnimation,
      builder: (_, child) {
        return ColoredBox(
          color: Colors.grey.shade700,
          child: ColoredBox(
            color: Colors.white
                .withValues(alpha: lerpDouble(0, 0.2, _controller.value)),
            child: child,
          ),
        );
      },
      child: widget.child ?? const SizedBox(),
    );
  }
}
