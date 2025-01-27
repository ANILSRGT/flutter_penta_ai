import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:penta_ai/core/env/app_env.dart';
import 'package:penta_core/penta_core.dart';

final class TextToImageApiService {
  TextToImageApiService._init();
  static final TextToImageApiService _instance = TextToImageApiService._init();
  static TextToImageApiService get I => _instance;

  Future<ResponseModel<Uint8List>> makeImage(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(AppEnv.I.stabilityDiffusion35LargeApiUrl),
        headers: {
          'Authorization':
              'Bearer ${AppEnv.I.stabilityDiffusion35LargeApiToken}',
          'Content-Type': 'application/json',
        },
        body: '{"inputs": "$prompt"}',
      );

      if (response.statusCode != 200) {
        return ResponseModelFail(
          error: ErrorModel(
            message: 'Failed to generate image',
            throwMessage: 'Failed to generate image: ${response.body}',
          ),
        );
      }

      final image = response.bodyBytes;
      return ResponseModelSuccess(data: image);
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: 'Failed to generate image',
          throwMessage: 'Failed to generate image: $e',
        ),
      );
    }
  }
}
