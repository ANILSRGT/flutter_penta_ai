import 'package:penta_ai/data/models/text_to_images/text_to_images_get_all_by_device_id_params.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_ai/domain/repositories/text_to_images_repo.dart';
import 'package:penta_ai/injections/injection.dart';
import 'package:penta_core/penta_core.dart';

final class TextToImagesGetAllByIdUsecase
    implements
        IUseCaseWithParams<List<TextToImagesModel>,
            TextToImagesGetAllByDeviceIdParams> {
  @override
  Future<ResponseModel<List<TextToImagesModel>>> execute(
    TextToImagesGetAllByDeviceIdParams params,
  ) async {
    return Injection.I.read<TextToImagesRepo>().getAllByDeviceId(params);
  }
}
