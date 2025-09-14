import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabsScaffold extends StatelessWidget {
  final Widget child;
  final int index;

  const TabsScaffold({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              context.go("/home");
              break;
            case 1:
              context.go("/favorites");
              break;
            case 2:
              context.go('/settings');
              break;
          }
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.catching_pokemon),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.star_border),
            label: 'Favorites',
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
