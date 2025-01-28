import 'package:penta_ai/data/models/text_to_images/text_to_images_create_params.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_ai/domain/repositories/text_to_images_repo.dart';
import 'package:penta_ai/injections/injection.dart';
import 'package:penta_core/penta_core.dart';

final class TextToImagesCreateUsecase
    implements IUseCaseWithParams<TextToImagesModel, TextToImagesCreateParams> {
  @override
  Future<ResponseModel<TextToImagesModel>> execute(
    TextToImagesCreateParams params,
  ) async {
    return Injection.I.read<TextToImagesRepo>().create(params);
  }
}
