// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [PromptToImageDetailsPage]
class PromptToImageDetailsRoute
    extends PageRouteInfo<PromptToImageDetailsRouteArgs> {
  PromptToImageDetailsRoute({
    required TextToImagesModel model,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PromptToImageDetailsRoute.name,
          args: PromptToImageDetailsRouteArgs(
            model: model,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PromptToImageDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PromptToImageDetailsRouteArgs>();
      return PromptToImageDetailsPage(
        model: args.model,
        key: args.key,
      );
    },
  );
}

class PromptToImageDetailsRouteArgs {
  const PromptToImageDetailsRouteArgs({
    required this.model,
    this.key,
  });

  final TextToImagesModel model;

  final Key? key;

  @override
  String toString() {
    return 'PromptToImageDetailsRouteArgs{model: $model, key: $key}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
