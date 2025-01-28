import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:penta_ai/core/configs/constants/firestore_collections.dart';
import 'package:penta_ai/core/utils/device_id_getter.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_create_params.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_get_all_by_device_id_params.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_core/penta_core.dart';

abstract class TextToImagesRemoteSource {
  Future<ResponseModel<TextToImagesModel>> create(
    TextToImagesCreateParams params,
  );
  Future<ResponseModel<List<TextToImagesModel>>> getAllByDeviceId(
    TextToImagesGetAllByDeviceIdParams params,
  );
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
      final model = TextToImagesModel(
        deviceId: deviceId,
        prompt: params.prompt,
        image: params.image,
        isPublic: params.isPublic,
      );
      await _textToImagesCollection.add(model.toJson());

      return ResponseModelSuccess(data: model);
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
  Future<ResponseModel<List<TextToImagesModel>>> getAllByDeviceId(
    TextToImagesGetAllByDeviceIdParams params,
  ) async {
    try {
      final snapshot = await _textToImagesCollection
          .where(TextToImagesModel.deviceIdKey, isEqualTo: params.deviceId)
          .get();

      final textToImages = <TextToImagesModel>[];
      for (final doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>?;
        if (data == null) continue;
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
