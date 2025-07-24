import 'dart:math';
import 'package:finatmo/app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final List<String> frases = [
    "Controlar tu dinero es libertad.",
    "Gasta menos de lo que ganás.",
    "Cada peso cuenta.",
    "El mejor interés es el que no pagás.",
    "Invertí en tu tranquilidad financiera.",
  ];

  String obtenerFraseAleatoria() {
    final random = Random();
    return frases[random.nextInt(frases.length)];
  }

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final frase = obtenerFraseAleatoria();
    final now = DateTime.now();
    final formatted = DateFormat('dd/MM/yyyy').format(now);

    return Scaffold(
      appBar: AppBar(title: const Text('Finatmo'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hola 👋', style: Theme.of(context).textTheme.headlineMedium),
            Text(
              'Lunes, 10 Mayo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '"$frase"',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildMenuCard(
                    context,
                    icon: Icons.monetization_on,
                    label: 'Gastos del día',
                    color: Colors.red[100]!,
                    route: AppRoutes.dailyExpenses,
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.attach_money,
                    label: 'Ingresos',
                    color: Colors.green[100]!,
                    route: AppRoutes.incomes,
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.people_alt,
                    label: 'Préstamos',
                    color: Colors.blue[100]!,
                    route: AppRoutes.loanList,
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.analytics,
                    label: 'Resumen',
                    color: Colors.amber[100]!,
                    route: AppRoutes.summary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required String route,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.black87),
              const SizedBox(height: 8),
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
