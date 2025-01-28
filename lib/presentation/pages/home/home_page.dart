import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_ai/core/providers/text_to_images_notifider.dart';
import 'package:penta_ai/core/utils/app_loading_dialog.dart';
import 'package:penta_ai/core/utils/toast_message_with_print.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_create_params.dart';
import 'package:penta_ai/data/models/text_to_images/text_to_images_model.dart';
import 'package:penta_ai/domain/usecases/text_to_images/text_to_images_create_usecase.dart';
import 'package:penta_ai/injections/injection.dart';
import 'package:penta_ai/presentation/widgets/appbar/custom_appbar.dart';
import 'package:penta_ai/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_ai/presentation/widgets/fields/text_to_image_prompt_field.dart';
import 'package:penta_ai/presentation/widgets/prompt_image/prompt_image_card.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

part 'home_page_view.dart';
part 'home_page_view_mixin.dart';
part 'widgets/home_page_body.dart';
part 'widgets/home_page_body_title.dart';
part 'widgets/home_page_body_prompt_field.dart';
part 'widgets/home_page_body_recent_makes_title.dart';
part 'widgets/home_page_body_recent_makes_list.dart';
part 'widgets/home_page_on_generated_image_dialog.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomePageView();
  }
}
