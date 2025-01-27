part of 'prompt_to_image_details_page.dart';

class _PromptToImageDetailsPageView extends StatelessWidget {
  const _PromptToImageDetailsPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Result',
      ),
      body: _PromptToImageDetailsPageBody(),
    );
  }
}
