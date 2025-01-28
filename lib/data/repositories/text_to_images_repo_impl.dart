import 'package:penta_ai/data/models/text_to_images/text_to_images_create_params.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_ai/data/sources/text_to_images/text_to_images_remote_source.dart';
import 'package:penta_ai/domain/repositories/text_to_images_repo.dart';
import 'package:penta_ai/injections/injection.dart';
import 'package:penta_core/penta_core.dart';

final class TextToImagesRepoImpl implements TextToImagesRepo {
  @override
  Future<ResponseModel<TextToImagesModel>> create(
    TextToImagesCreateParams params,
  ) async {
    return Injection.I.read<TextToImagesRemoteSource>().create(params);
  }

  @override
  Future<ResponseModel<List<TextToImagesModel>>> getAllByDeviceId() async {
    return Injection.I.read<TextToImagesRemoteSource>().getAllByDeviceId();
  }
}
