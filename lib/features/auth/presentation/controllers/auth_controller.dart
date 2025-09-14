import 'package:flutter_pokedex_mvvm/features/auth/data/models/user.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthState {
  final bool isAuthenticated;
  final User? user;

  const AuthState({this.isAuthenticated = false, this.user});
}

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(const AuthState());

  void loginWithName(String name) {
    final cleaned = name.trim();
    if (cleaned.isEmpty) return;

    state = AuthState(isAuthenticated: true, user: User(cleaned));
  }

  void logout() => state = const AuthState();
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(),
);
