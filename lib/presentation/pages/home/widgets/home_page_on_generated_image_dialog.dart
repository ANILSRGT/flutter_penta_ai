part of '../home_page.dart';

class _HomePageOnGeneratedImageDialog extends StatelessWidget {
  const _HomePageOnGeneratedImageDialog({
    required this.model,
  });

  final TextToImagesModel model;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.appThemeExt.appColorsRead.background
          .byBrightness(context.ext.theme.isDark),
      iconColor: context.appThemeExt.appColorsRead.background
          .byBrightness(context.ext.theme.isDark)
          .onColor,
      title: Text(
        'Generated Image',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: context.appThemeExt.appColorsRead.background
              .byBrightness(context.ext.theme.isDark)
              .onColor,
        ),
      ),
      content: ClipRRect(
        borderRadius: context.ext.radius.border.all.lg,
        child: Image.memory(model.image),
      ),
      actions: [
        AppElevatedButton.gray(
          onPressed: () => context.router.popForced(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
