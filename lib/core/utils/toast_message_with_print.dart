import 'package:flutter/foundation.dart';
import 'package:oktoast/oktoast.dart';
import 'package:penta_core/penta_core.dart';

final class ToastMessageWithPrint {
  const ToastMessageWithPrint._();

  static void show({
    required String message,
    required String? throwMessage,
  }) {
    if (throwMessage != null) {
      if (kDebugMode) print(throwMessage);
    }

    showToast(message);
  }

  static void showFromResponse<T>({
    required ResponseModel<T> res,
  }) {
    if (res.isFail) {
      show(
        message: res.asFail.error.message,
        throwMessage: res.asFail.error.throwMessage,
      );
    }
  }
}
