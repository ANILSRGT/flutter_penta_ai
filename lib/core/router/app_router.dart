import 'package:auto_route/auto_route.dart';
import 'package:penta_ai/presentation/pages/home/home_page.dart';
import 'package:penta_ai/presentation/pages/prompt_to_image_details/prompt_to_image_details_page.dart';
import 'package:penta_ai/presentation/pages/splash/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: PromptToImageDetailsRoute.page,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
