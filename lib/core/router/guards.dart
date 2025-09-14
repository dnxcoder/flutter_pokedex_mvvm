import 'package:flutter/material.dart';
import 'package:flutter_pokedex_mvvm/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_pokedex_mvvm/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_pokedex_mvvm/features/home/presentation/pages/home_page.dart';
import 'package:flutter_pokedex_mvvm/features/shell/presentation/pages/tabs_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref ref;
  bool get isLoggedIn => ref.read(authControllerProvider).isAuthenticated;

  RouterNotifier(this.ref) {
    ref.listen<AuthState>(authControllerProvider, (_, __) => notifyListeners());
  }
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: notifier, // restart redirect when we change auth
    redirect: (context, state) {
      final loggedIn = notifier.isLoggedIn;
      final atLogin = state.uri.path == '/login';

      if (!loggedIn && !atLogin) return '/login';
      if (loggedIn && atLogin) return '/home';

      return null;
    },

    routes: [
      //Public Route
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/home', builder: (_, __) => const HomePage()),

      // ShellRoute(
      //   builder: (context, state, child) {
      //     final loc = state.uri.path;
      //     final idx = loc.startsWith('/favorites')
      //         ? 1
      //         : loc.startsWith('/settings')
      //         ? 2
      //         : 0;
      //     return TabsScaffold(index: idx, child: child);
      //   },
      //   routes: [
      //     GoRoute(path: "/favorites"
      //     builder: (_, __) => const FavoritesPage(),
      //     routes: [
      //       GoRoute(path: 'pokemon/:name',
      //       builder: (context, state) => PokemonDetailPage(name: state.pathParameters['name']!),
      //       ),
      //     ],
      //     ),
      //   ]
      // ),
    ],
  );
});
