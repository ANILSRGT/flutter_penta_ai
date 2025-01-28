import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:oktoast/oktoast.dart';

class DownloadFile {
  const DownloadFile._();

  static Future<void> downloadImage(
    BuildContext context,
    Uint8List image,
  ) async {
    final isSupported = await FlutterFileDialog.isPickDirectorySupported();
    if (!isSupported) {
      showToast('This platform does not support directory picking');
      return;
    }

    final directory = await FlutterFileDialog.pickDirectory();

    if (directory == null) return;

    final filePath = await FlutterFileDialog.saveFileToDirectory(
      directory: directory,
      data: image,
      mimeType: 'image/png',
      fileName: '${DateTime.now().millisecondsSinceEpoch}.png',
      replace: true,
    );
  }
}
