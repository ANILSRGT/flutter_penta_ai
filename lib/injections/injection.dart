import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:penta_ai/data/repositories/text_to_images_repo_impl.dart';
import 'package:penta_ai/data/sources/text_to_images/text_to_images_remote_source.dart';
import 'package:penta_ai/domain/repositories/text_to_images_repo.dart';
import 'package:penta_ai/domain/usecases/text_to_images/text_to_images_create_usecase.dart';
import 'package:penta_ai/domain/usecases/text_to_images/text_to_images_get_all_by_id_usecase.dart';

part 'text_to_images_injection.dart';

final class Injection {
  Injection._init();
  static final Injection _instance = Injection._init();
  static Injection get I => _instance;

  final _sl = GetIt.instance;
  final globalKey = GlobalKey<NavigatorState>();

  Future<void> init() async {
    TextToImagesInjection(_sl).register();
  }

  T read<T extends Object>() => _sl.get<T>();
}
