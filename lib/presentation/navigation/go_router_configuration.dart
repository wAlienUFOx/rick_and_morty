import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_screen.dart';
import 'package:rick_and_morty/presentation/screens/settings/settings_screen.dart';
import '../screens/home/home_screen.dart';
import 'app_routes.dart';
import 'nav_handler.dart';

class GoRouterConfiguration {
  GoRouter get router => _goRouter;

  late final _goRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => NavHandler(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            initialLocation: AppRoutes.home,
            routes: [
              GoRoute(path: AppRoutes.home, name: AppRoutes.home, builder: (context, state) => const HomeScreen()),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRoutes.favorite,
            routes: [
              GoRoute(
                path: AppRoutes.favorite,
                name: AppRoutes.favorite,
                builder: (context, state) => const FavoriteScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRoutes.settings,
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                name: AppRoutes.settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
