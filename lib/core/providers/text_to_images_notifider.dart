import 'package:flutter/material.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_ai/domain/usecases/text_to_images/text_to_images_get_all_by_id_usecase.dart';
import 'package:penta_ai/injections/injection.dart';
import 'package:penta_core/penta_core.dart';

final class TextToImagesNotifider extends ChangeNotifier {
  List<TextToImagesModel>? _textToImages;

  List<TextToImagesModel>? get textToImages => _textToImages;

  Future<ResponseModel<List<TextToImagesModel>>> fetchTextToImages() async {
    final textToImagesRes =
        await Injection.I.read<TextToImagesGetAllByIdUsecase>().execute();

    if (textToImagesRes.isSuccess) {
      _textToImages = textToImagesRes.asSuccess.data;
      notifyListeners();
    }

    return textToImagesRes;
  }

  void addImage(TextToImagesModel image) {
    _textToImages?.insert(0, image);
    notifyListeners();
  }
}
