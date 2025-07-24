import 'package:finatmo/app/app_routes.dart';
import 'package:finatmo/presentation/components/custom_button.dart';
import 'package:finatmo/presentation/components/custom_text_field.dart';
import 'package:finatmo/presentation/pages/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    provider.toMenu = () {
      Navigator.pushNamed(context, AppRoutes.home);
    };
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 6, 110, 39), Color(0xFF2A5298)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(Icons.lock_outline, size: 80, color: Colors.white),
                const SizedBox(height: 16),
                const Text(
                  'Bienvenido a Finatmo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  controller: provider.emailController,
                  hintText: 'Correo electrónico',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: provider.passwordController,
                  hintText: 'Contraseña',
                  icon: Icons.lock,
                  obscureText: provider.obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      provider.obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white70,
                    ),
                    onPressed: provider.togglePasswordVisibility,
                  ),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  label: "Ingresar",
                  isLoading: provider.isLoading,
                  onPressed: provider.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
