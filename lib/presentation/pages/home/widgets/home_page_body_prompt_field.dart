part of '../home_page.dart';

class _HomePageBodyPromptField extends StatelessWidget {
  const _HomePageBodyPromptField({
    required this.onGenerateImage,
  });

  final void Function(String prompt) onGenerateImage;

  @override
  Widget build(BuildContext context) {
    return TextToImagePromptField(onGenerateImage: onGenerateImage);
  }
}
