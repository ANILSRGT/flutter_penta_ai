import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:penta_ai/core/configs/constants/firestore_collections.dart';
import 'package:penta_ai/core/services/text_to_image_api_service.dart';
import 'package:penta_ai/core/utils/device_id_getter.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_create_params.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_core/penta_core.dart';

abstract class TextToImagesRemoteSource {
  Future<ResponseModel<TextToImagesModel>> create(
    TextToImagesCreateParams params,
  );
  Future<ResponseModel<List<TextToImagesModel>>> getAllByDeviceId();
}

final class TextToImagesRemoteSourceImpl implements TextToImagesRemoteSource {
  final _firestore = FirebaseFirestore.instance;

  CollectionReference get _textToImagesCollection =>
      _firestore.collection(FirestoreCollections.textToImages);

  @override
  Future<ResponseModel<TextToImagesModel>> create(
    TextToImagesCreateParams params,
  ) async {
    try {
      final deviceId = await DeviceIdGetter.getDeviceId();
      if (deviceId == null) {
        return const ResponseModelFail(
          error: ErrorModel(
            message: 'Error creating image',
            throwMessage:
                'text_to_images_remote_source/create : deviceId is null',
          ),
        );
      }

      final imageRes = await TextToImageApiService.I.makeImage(params.prompt);

      if (imageRes.isFail) {
        return ResponseModelFail(
          error: ErrorModel(
            message: 'Error creating image',
            throwMessage:
                'text_to_images_remote_source/create : ${imageRes.asFail.error.throwMessage}',
          ),
        );
      }

      final modelJson = TextToImagesModel.toJson(
        deviceId: deviceId,
        prompt: params.prompt,
        image: imageRes.asSuccess.data.ext.convert.toBase64,
        isPublic: params.isPublic,
        createdAt: Timestamp.now().toDate().toUtc(),
      );
      await _textToImagesCollection.add(modelJson);

      final model = TextToImagesModel.fromJson(modelJson);

      return ResponseModelSuccess(
        data: model.copyWith(
          createdAt: model.createdAt.toLocal(),
        ),
      );
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: 'Error creating image',
          throwMessage: 'text_to_images_remote_source/create : $e',
        ),
      );
    }
  }

  @override
  Future<ResponseModel<List<TextToImagesModel>>> getAllByDeviceId() async {
    try {
      final deviceId = await DeviceIdGetter.getDeviceId();
      if (deviceId == null) {
        return const ResponseModelFail(
          error: ErrorModel(
            message: 'Error getting images',
            throwMessage:
                'text_to_images_remote_source/getAllByDeviceId : deviceId is null',
          ),
        );
      }
      final snapshot = await _textToImagesCollection
          .where(TextToImagesModel.deviceIdKey, isEqualTo: deviceId)
          .orderBy(TextToImagesModel.createdAtKey, descending: true)
          .get();

      final textToImages = <TextToImagesModel>[];
      for (final doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>?;
        if (data == null) continue;
        data[TextToImagesModel.createdAtKey] =
            (data[TextToImagesModel.createdAtKey] as Timestamp)
                .toDate()
                .toLocal();
        textToImages.add(TextToImagesModel.fromJson(data));
      }

      return ResponseModelSuccess(data: textToImages);
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: 'Error getting images',
          throwMessage: 'text_to_images_remote_source/getAllByDeviceId : $e',
        ),
      );
    }
  }
}
