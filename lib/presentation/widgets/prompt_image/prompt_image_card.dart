import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_ai/core/router/app_router.dart';
import 'package:penta_ai/presentation/widgets/image/custom_network_image.dart';
import 'package:penta_core/penta_core.dart';

class PromptImageCard extends StatelessWidget {
  const PromptImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const PromptToImageDetailsRoute());
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.appThemeExt.appColors.background
              .byBrightness(context.ext.theme.isDark),
          borderRadius: BorderRadius.circular(context.ext.values.sm),
          border: Border.all(
            color: context.appThemeExt.appColors.background
                .byBrightness(context.ext.theme.isDark)
                .onColor
                .withValues(alpha: 0.5),
          ),
        ),
        child: Padding(
          padding: context.ext.padding.all.md,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: context.ext.values.md,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(context.ext.values.sm),
                  child: CustomNetworkImage(
                    imageUrl:
                        'https://picsum.photos/1080/1920?random=${DateTime.now().millisecond}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Recent Image',
                style: context.ext.theme.textTheme.bodyMedium?.copyWith(
                  color: context.appThemeExt.appColors.background
                      .byBrightness(context.ext.theme.isDark)
                      .onColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
