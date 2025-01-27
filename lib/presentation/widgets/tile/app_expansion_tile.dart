import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class AppExpansionTile extends StatelessWidget {
  const AppExpansionTile({
    required this.title,
    required this.content,
    required this.backgroundColor,
    required this.foregroundColor,
    super.key,
  });

  final String title;
  final List<Widget> content;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 2,
      child: ExpansionTile(
        title: Text(title),
        controlAffinity: ListTileControlAffinity.platform,
        childrenPadding: context.ext.padding.all.md,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: context.ext.radius.border.all.sm,
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: context.ext.radius.border.all.md,
        ),
        textColor: foregroundColor,
        iconColor: foregroundColor,
        collapsedTextColor: foregroundColor,
        collapsedIconColor: foregroundColor,
        collapsedBackgroundColor: backgroundColor,
        children: content,
      ),
    );
  }
}
