import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penta_core/penta_core.dart';

part 'text_to_images_model.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class TextToImagesModel with _$TextToImagesModel {
  const factory TextToImagesModel({
    required String deviceId,
    required String prompt,
    required Uint8List image,
    required bool isPublic,
    required DateTime createdAt,
  }) = _TextToImagesModel;

  const TextToImagesModel._();

  factory TextToImagesModel.fromJson(Map<String, dynamic> json) {
    return TextToImagesModel(
      deviceId: json[deviceIdKey] as String,
      prompt: json[promptKey] as String,
      image: (json[imageKey] as String).ext.convert.toUint8List,
      isPublic: json[isPublicKey] as bool,
      createdAt: (json[createdAtKey] as DateTime).toLocal(),
    );
  }

  static Map<String, dynamic> toJson({
    required String deviceId,
    required String prompt,
    required String image,
    required bool isPublic,
    required DateTime createdAt,
  }) {
    return {
      deviceIdKey: deviceId,
      promptKey: prompt,
      imageKey: image,
      isPublicKey: isPublic,
      createdAtKey: createdAt,
    };
  }

  static const deviceIdKey = 'deviceId';
  static const promptKey = 'prompt';
  static const imageKey = 'image';
  static const isPublicKey = 'isPublic';
  static const createdAtKey = 'createdAt';
}
