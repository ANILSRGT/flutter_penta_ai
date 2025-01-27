import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/constants/app_icons.dart';
import 'package:penta_core/penta_core.dart';

class AppPopupMenuButton<T> extends StatelessWidget {
  const AppPopupMenuButton({
    required this.items,
    this.onSelected,
    super.key,
  });

  final void Function(T)? onSelected;
  final List<PopupMenuEntry<T>> items;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (_) {},
      icon: const Icon(AppIcons.threeDotsVert),
      menuPadding: context.ext.padding.all.xs,
      shape: RoundedRectangleBorder(
        borderRadius: context.ext.radius.border.all.sm,
      ),
      itemBuilder: (_) => items,
    );
  }
}
