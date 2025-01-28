import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_ai/domain/repositories/text_to_images_repo.dart';
import 'package:penta_ai/injections/injection.dart';
import 'package:penta_core/penta_core.dart';

final class TextToImagesGetAllByIdUsecase
    implements IUseCase<List<TextToImagesModel>> {
  @override
  Future<ResponseModel<List<TextToImagesModel>>> execute() async {
    return Injection.I.read<TextToImagesRepo>().getAllByDeviceId();
  }
}
