import 'package:flutter/material.dart';

class IncomesPage extends StatelessWidget {
  final List<Map<String, dynamic>> incomes = [
    {'amount': 1500.0, 'source': 'Salario', 'date': '2025-07-01'},
    {'amount': 300.0, 'source': 'Freelance', 'date': '2025-07-10'},
  ];

  IncomesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double total = incomes.fold<double>(
      0,
      (sum, item) => sum + item['amount'],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Ingresos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.green[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.savings,
                  size: 40,
                  color: Colors.green,
                ),
                title: const Text('Total del mes'),
                subtitle: Text(
                  'S/ ${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: incomes.length,
                itemBuilder: (context, index) {
                  final income = incomes[index];
                  return ListTile(
                    leading: const Icon(Icons.trending_up, color: Colors.green),
                    title: Text('S/ ${income['amount']}'),
                    subtitle: Text('${income['source']} - ${income['date']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to AddIncomeScreen
        },
        child: const Icon(Icons.add),
        tooltip: 'Agregar ingreso',
      ),
    );
  }
}
