part of 'injection.dart';

class TextToImagesInjection {
  TextToImagesInjection(this._sl);

  final GetIt _sl;

  void register() {
    _sl
      ..registerFactory<TextToImagesRemoteSource>(
        TextToImagesRemoteSourceImpl.new,
      )
      ..registerFactory<TextToImagesRepo>(TextToImagesRepoImpl.new)
      ..registerFactory<TextToImagesCreateUsecase>(
        TextToImagesCreateUsecase.new,
      )
      ..registerFactory<TextToImagesGetAllByIdUsecase>(
        TextToImagesGetAllByIdUsecase.new,
      );
  }
}
