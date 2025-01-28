import 'package:penta_ai/data/models/text_to_images/text_to_images_create_params.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_core/penta_core.dart';

abstract class TextToImagesRepo {
  Future<ResponseModel<TextToImagesModel>> create(
    TextToImagesCreateParams params,
  );
  Future<ResponseModel<List<TextToImagesModel>>> getAllByDeviceId();
}
