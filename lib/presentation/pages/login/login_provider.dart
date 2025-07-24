import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  bool isLoading = false;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> login() async {
    isLoading = true;
    notifyListeners();

    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));

    // After the call, set loading to false
    isLoading = false;
    notifyListeners();
  }
}
