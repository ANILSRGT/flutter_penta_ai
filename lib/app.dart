part of 'main.dart';

class _MyApp extends StatefulWidget {
  const _MyApp();

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> with WidgetsBindingObserver {
  final AppRouter _appRouter = AppRouter();

  void _connectivityChanged(bool hasConnection) {
    if (!hasConnection) {
      showToast(
        LocaleKeys.globalErrorsNoInternetConnection.translate,
        backgroundColor: const Color(0xFFA80B00),
        textStyle: const TextStyle(color: Color(0xFFFBFBFB)),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ConnectivityService.connectionStream.listen(_connectivityChanged);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    context.read<ThemeNotifier>().updateSystemThemeMode();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme.theme.getThemeData(false),
      darkTheme: themeNotifier.currentTheme.theme.getThemeData(true),
      themeMode: themeNotifier.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      key: Injection.I.globalKey,
      builder: (ctx, child) {
        return OKToast(
          position: ToastPosition.bottom,
          textPadding: const EdgeInsets.all(8),
          radius: 8,
          backgroundColor: ctx.appThemeExt.appColors.black
              .byBrightness(ctx.ext.theme.isDark),
          textStyle: ctx.ext.theme.textTheme.bodyLarge!.copyWith(
            color: ctx.appThemeExt.appColors.black
                .byBrightness(ctx.ext.theme.isDark)
                .onColor,
          ),
          child: child!,
        );
      },
      routerConfig: _appRouter.config(),
    );
  }
}
