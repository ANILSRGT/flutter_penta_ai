import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_ai/presentation/widgets/appbar/custom_appbar.dart';
import 'package:penta_ai/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_ai/presentation/widgets/tile/app_expansion_tile.dart';
import 'package:penta_core/penta_core.dart';

part 'prompt_to_image_details_page_view.dart';
part 'widgets/prompt_to_image_details_page_body.dart';

@RoutePage()
class PromptToImageDetailsPage extends StatelessWidget {
  const PromptToImageDetailsPage({
    required this.model,
    super.key,
  });

  final TextToImagesModel model;

  @override
  Widget build(BuildContext context) {
    return _PromptToImageDetailsPageView(model: model);
  }
}
