class TextToImagesCreateParams {
  TextToImagesCreateParams({
    required this.prompt,
    this.isPublic = false,
  });

  final String prompt;
  final bool isPublic;
}
