part of 'prompt_to_image_details_page.dart';

mixin _PromptToImageDetailsPageViewMixin on StatelessWidget {
  Future<void> _onDownloadImage(BuildContext context, Uint8List image) async {
    await context.showLoadingDialog(
      future: () async {
        await DownloadFile.downloadImage(context, image);
      },
      callback: (_) {},
    );
  }

  Future<void> _onShareImage(BuildContext context, Uint8List image) async {
    await ShareService.shareImage(image);
  }
}
