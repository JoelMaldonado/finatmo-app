import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final double totalIncome = 3000;
  final double totalExpenses = 1800;
  final double totalLoaned = 8000;
  final double totalRecovered = 2000;

  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double balance = totalIncome - totalExpenses + totalRecovered;

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen financiero')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSummaryTile(
              context,
              title: 'Ingresos',
              amount: totalIncome,
              icon: Icons.arrow_downward,
              color: Colors.green,
            ),
            _buildSummaryTile(
              context,
              title: 'Gastos',
              amount: totalExpenses,
              icon: Icons.arrow_upward,
              color: Colors.red,
            ),
            _buildSummaryTile(
              context,
              title: 'Préstamos otorgados',
              amount: totalLoaned,
              icon: Icons.outbox,
              color: Colors.orange,
            ),
            _buildSummaryTile(
              context,
              title: 'Pagos recibidos de préstamos',
              amount: totalRecovered,
              icon: Icons.inbox,
              color: Colors.blue,
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.account_balance_wallet, size: 40),
                title: const Text('Balance general'),
                subtitle: Text(
                  'S/ ${balance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryTile(
    BuildContext context, {
    required String title,
    required double amount,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(title),
        trailing: Text(
          'S/ ${amount.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
