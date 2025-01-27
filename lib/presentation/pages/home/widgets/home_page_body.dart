part of '../home_page.dart';

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  Future<void> _onGenerateImage(BuildContext context, String prompt) async {
    await AppLoadingDialog.showLoadingDialog(
      context: context,
      future: () async {
        return TextToImageApiService.I.makeImage(prompt);
      },
      callback: (image) async {
        if (image.isFail || !context.mounted) {
          if (kDebugMode) {
            print(
              'Failed to generate image: ${image.asFail.error.throwMessage}',
            );
          }
          showToast(image.asFail.error.message);
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
                child: Image.memory(image.asSuccess.data),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppbar(),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Padding(
                  padding: context.ext.padding.horizontal.xl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      context.ext.sizedBox.height.lg,
                      const _HomePageBodyTitle(),
                      context.ext.sizedBox.height.xl,
                      _HomePageBodyPromptField(
                        onGenerateImage: (prompt) =>
                            _onGenerateImage(context, prompt),
                      ),
                      context.ext.sizedBox.height.xl,
                      const _HomePageBodyRecentMakesTitle(),
                      context.ext.sizedBox.height.md,
                      const _HomePageBodyRecentMakesList(),
                      context.ext.sizedBox.height.xl,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
