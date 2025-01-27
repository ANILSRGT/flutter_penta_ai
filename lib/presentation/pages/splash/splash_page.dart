import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:penta_ai/core/router/app_router.dart';
import 'package:penta_ai/presentation/widgets/loading_indicator/app_loading_indicator.dart';
import 'package:penta_ai/presentation/widgets/logo/app_logo.dart';
import 'package:penta_core/penta_core.dart';

part 'splash_page_view.dart';
part 'splash_page_view_mixin.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SplashPageView();
  }
}
