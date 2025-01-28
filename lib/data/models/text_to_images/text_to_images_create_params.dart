class TextToImagesCreateParams {
  TextToImagesCreateParams({
    required this.prompt,
    required this.image,
    required this.isPublic,
  });

  final String prompt;
  final String image;
  final bool isPublic;
}
