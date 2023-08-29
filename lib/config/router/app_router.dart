import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          initial: true,
          path: "/",
        ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 200,
        ),
        CustomRoute(
          page: DetailRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 200,
        ),
        CustomRoute(
          page: TestHomeRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 200,
        ),
        CustomRoute(
          page: Test1Route.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 200,
        ),
        CustomRoute(
          page: Test2Route.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 200,
        ),
        CustomRoute(
          page: Test3Route.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 200,
        )
      ];
}
