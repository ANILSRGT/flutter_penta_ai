import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_ai/core/configs/theme/themes/main/main_theme.dart';

enum AppThemesEnum {
  main();

  IAppTheme get theme {
    return switch (this) {
      AppThemesEnum.main => MainTheme(),
    };
  }
}
