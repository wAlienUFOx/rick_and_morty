import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import 'app_routes.dart';
import 'nav_handler.dart';

class GoRouterConfiguration {
  GoRouter get router => _goRouter;
  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  late final _goRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.home,
    navigatorKey: _rootNavigatorKey,
    routes: [
      // GoRoute(
      //   path: AppRoutes.favorite,
      //   name: AppRoutes.favorite,
      //   builder: (context, state) {
      //     if (state.extra is int) {
      //       final routeId = state.extra as int;
      //       return FavoriteRouteScreen(routeId: routeId);
      //     } else {
      //       throw Exception('AppRoutes.favorite - state.extra is not int');
      //     }
      //   },
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => NavHandler(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            initialLocation: AppRoutes.home,
            routes: [
              GoRoute(path: AppRoutes.home, name: AppRoutes.home, builder: (context, state) => const HomeScreen()),
            ],
          ),
          // StatefulShellBranch(
          //   initialLocation: AppRoutes.routes,
          //   routes: [
          //     GoRoute(
          //       path: AppRoutes.routes,
          //       name: AppRoutes.routes,
          //       builder: (context, state) => const RoutesScreen(),
          //     ),
          //   ],
          // ),
          // StatefulShellBranch(
          //   initialLocation: AppRoutes.info,
          //   routes: [
          //     GoRoute(
          //       path: AppRoutes.info,
          //       name: AppRoutes.info,
          //       builder: (context, state) => const InfoScreen(),
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
  );
}
