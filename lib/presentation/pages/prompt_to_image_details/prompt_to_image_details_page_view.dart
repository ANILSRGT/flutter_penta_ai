part of 'prompt_to_image_details_page.dart';

class _PromptToImageDetailsPageView extends StatelessWidget
    with _PromptToImageDetailsPageViewMixin {
  const _PromptToImageDetailsPageView({
    required this.model,
  });

  final TextToImagesModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Result',
      ),
      body: _PromptToImageDetailsPageBody(
        model: model,
        onImageDownload: (image) => _onDownloadImage(context, image),
        onImageShare: (image) => _onShareImage(context, image),
      ),
    );
  }
}
