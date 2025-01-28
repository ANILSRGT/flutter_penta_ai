part of 'home_page.dart';

mixin _HomePageViewMixin on StatelessWidget {
  Future<void> _onGenerateImage(BuildContext context, String prompt) async {
    await AppLoadingDialog.showLoadingDialog(
      context: context,
      future: () async {
        final imageRes = await TextToImageApiService.I.makeImage(prompt);
        if (imageRes.isFail) return imageRes;

        final saveImageRes =
            await Injection.I.read<TextToImagesCreateUsecase>().execute(
                  TextToImagesCreateParams(
                    prompt: prompt,
                    image: imageRes.asSuccess.data.ext.convert.toBase64,
                    isPublic: true,
                  ),
                );
        if (saveImageRes.isFail) return saveImageRes.asFail.castTo<Uint8List>();
        return imageRes;
      },
      callback: (imageRes) async {
        if (imageRes.isFail || !context.mounted) {
          if (kDebugMode) {
            print(
              'Failed to generate image: ${imageRes.asFail.error.throwMessage}',
            );
          }
          showToast(imageRes.asFail.error.message);
          return;
        }

        await showDialog<Never>(
          context: context,
          builder: (context) {
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
                child: Image.memory(imageRes.asSuccess.data),
              ),
              actions: [
                AppElevatedButton.gray(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
