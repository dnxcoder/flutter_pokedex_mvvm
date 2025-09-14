import 'package:flutter/material.dart';
import 'package:flutter_pokedex_mvvm/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void login() {
      ref.read(authControllerProvider.notifier).loginWithName("Denis");
    }

    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pagina de Login parceiro"),
          ElevatedButton(
            onPressed: login,
            child: Text("Clique aqui para logar"),
          ),
        ],
      ),
    );
  }
}
