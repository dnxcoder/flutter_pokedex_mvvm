import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pokedex_mvvm/core/router/guards.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: "Pokedex - MVVM + Riverpod + GoRouter",
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      routerConfig: router,
    );

    // TODO: implement build
  }
}
