import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

final class AppEnv {
  AppEnv._init();
  static final AppEnv _instance = AppEnv._init();
  static AppEnv get I => _instance;

  Future<void> init() async {
    await dotenv.load();
  }

  String get stabilityDiffusion35LargeApiUrl =>
      dotenv.env['STABILITY_DIFFUSION_3_5_LARGE_API_URL'] ?? '';
  String get stabilityDiffusion35LargeApiToken =>
      dotenv.env['STABILITY_DIFFUSION_3_5_LARGE_API_TOKEN'] ?? '';
}
