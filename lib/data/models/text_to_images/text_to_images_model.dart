import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_to_images_model.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class TextToImagesModel with _$TextToImagesModel {
  const factory TextToImagesModel({
    required String deviceId,
    required String prompt,
    required String image,
    required bool isPublic,
  }) = _TextToImagesModel;

  const TextToImagesModel._();

  factory TextToImagesModel.fromJson(Map<String, dynamic> json) {
    return TextToImagesModel(
      deviceId: json[deviceIdKey] as String,
      prompt: json[promptKey] as String,
      image: json[imageKey] as String,
      isPublic: json[isPublicKey] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      deviceIdKey: deviceId,
      promptKey: prompt,
      imageKey: image,
      isPublicKey: isPublic,
    };
  }

  static const deviceIdKey = "deviceId";
  static const promptKey = "prompt";
  static const imageKey = "image";
  static const isPublicKey = "isPublic";
}
