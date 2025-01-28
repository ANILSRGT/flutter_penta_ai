import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:penta_ai/core/configs/enums/app_localiaztions_enum.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_ai/core/env/app_env.dart';
import 'package:penta_ai/core/extensions/localization_ext.dart';
import 'package:penta_ai/core/localization/locale_keys.g.dart';
import 'package:penta_ai/core/localization/localization_manager.dart';
import 'package:penta_ai/core/providers/theme_notifier.dart';
import 'package:penta_ai/core/router/app_router.dart';
import 'package:penta_ai/firebase_options.dart';
import 'package:penta_ai/injections/injection.dart';
import 'package:penta_core/penta_core.dart';
import 'package:provider/provider.dart';

part 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AppEnv.I.init();
  await Injection.I.init();

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager.I.supportedLocales,
      path: AppLocaliaztionsEnum.translationsJsonAssetsFolder,
      fallbackLocale: LocalizationManager.I.fallbackLocale,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ],
        child: const _MyApp(),
      ),
    ),
  );
}
