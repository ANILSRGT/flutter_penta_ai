part of 'home_page.dart';

mixin _HomePageViewMixin on StatelessWidget {
  Future<void> _refresh(BuildContext context) async {
    final res = await context.read<TextToImagesNotifider>().fetchTextToImages();
    if (res.isFail) {
      ToastMessageWithPrint.showFromResponse(res: res);
      return;
    }
  }

  Future<void> _onGenerateImage(BuildContext context, String prompt) async {
    await context.showLoadingDialog(
      future: () async {
        final saveImageRes =
            await Injection.I.read<TextToImagesCreateUsecase>().execute(
                  TextToImagesCreateParams(prompt: prompt),
                );

        if (saveImageRes.isFail) {
          ToastMessageWithPrint.showFromResponse(res: saveImageRes);
          return null;
        }

        if (!context.mounted) return null;

        context
            .read<TextToImagesNotifider>()
            .addImage(saveImageRes.asSuccess.data);

        await showDialog<Never>(
          context: context,
          barrierDismissible: false,
          builder: (_) => _HomePageOnGeneratedImageDialog(
            model: saveImageRes.asSuccess.data,
          ),
        );
      },
      callback: (_) {},
    );
  }
}
