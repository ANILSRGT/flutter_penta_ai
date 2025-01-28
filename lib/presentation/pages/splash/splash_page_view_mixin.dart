part of 'splash_page.dart';

mixin _SplashPageViewMixin
    on State<_SplashPageView>, SafeStateMixin<_SplashPageView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initApp();
    });
  }

  Future<void> _initApp() async {
    await context.read<TextToImagesNotifider>().fetchTextToImages();

    await runAsyncMounted(
      () async => context.router.replaceAll([const HomeRoute()]),
    );
  }
}
