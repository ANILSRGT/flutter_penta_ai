import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:penta_ai/presentation/widgets/appbar/custom_appbar.dart';
import 'package:penta_ai/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_ai/presentation/widgets/image/custom_network_image.dart';
import 'package:penta_core/penta_core.dart';

part 'prompt_to_image_details_page_view.dart';
part 'widgets/prompt_to_image_details_page_body.dart';

@RoutePage()
class PromptToImageDetailsPage extends StatelessWidget {
  const PromptToImageDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PromptToImageDetailsPageView();
  }
}
