import 'package:finatmo/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  LoginProvider({required this.authRepository});

  final emailController = TextEditingController(text: 'joel@gmail.com');
  final passwordController = TextEditingController(text: '1234');
  bool obscurePassword = true;

  bool isLoading = false;
  Function? toMenu;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> login() async {
    isLoading = true;
    notifyListeners();

    final res = await authRepository.login(
      email: emailController.text,
      password: passwordController.text,
    );

    res.fold((l) {}, (r) {
      toMenu?.call();
    });

    isLoading = false;
    notifyListeners();
  }
}
