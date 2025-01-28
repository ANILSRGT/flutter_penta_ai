import 'dart:io';
import 'dart:typed_data';

import 'package:oktoast/oktoast.dart';
import 'package:share_plus/share_plus.dart';

final class ShareService {
  const ShareService._();

  static Future<void> shareImage(
    Uint8List image,
  ) async {
    try {
      final filePath = '${Directory.systemTemp.path}/image.png';
      final file = await File(filePath).writeAsBytes(image);
      final res = await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Share Image',
      );
    } on Exception catch (_) {
      showToast('Failed to share image');
    }
  }
}
