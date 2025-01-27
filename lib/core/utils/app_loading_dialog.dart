import 'dart:async';

import 'package:flutter/material.dart';
import 'package:penta_ai/presentation/widgets/loading_indicator/app_loading_indicator.dart';
import 'package:penta_core/penta_core.dart';

final class AppLoadingDialog {
  const AppLoadingDialog._();

  static Future<void> showLoadingDialog<T>({
    required BuildContext context,
    required Future<T> Function() future,
    required FutureOr<void> Function(T value) callback,
    LoadingCallbackDialogCloseTypes closeType =
        LoadingCallbackDialogCloseTypes.beforeCallback,
    bool cancelable = false,
    FutureOr<void> Function()? cancelableCallback,
  }) async {
    return LoadingCallbackDialog.showLoadingDialog(
      context: context,
      future: future,
      callback: callback,
      closeType: closeType,
      cancelable: cancelable,
      customLoading: const Center(
        child: AppLoadingIndicator(),
      ),
      cancelableCallback: cancelableCallback,
    );
  }
}

extension AppLoadingDialogContextX on BuildContext {
  Future<void> showLoadingDialog<T>({
    required Future<T> Function() future,
    required FutureOr<void> Function(T value) callback,
    LoadingCallbackDialogCloseTypes closeType =
        LoadingCallbackDialogCloseTypes.beforeCallback,
    bool cancelable = false,
    FutureOr<void> Function()? cancelableCallback,
  }) async {
    return AppLoadingDialog.showLoadingDialog(
      context: this,
      future: future,
      callback: callback,
      closeType: closeType,
      cancelable: cancelable,
      cancelableCallback: cancelableCallback,
    );
  }
}
