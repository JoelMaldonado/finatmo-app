import 'package:flutter/material.dart';

class DailyExpensesPage extends StatelessWidget {
  final List<Map<String, dynamic>> expenses = [
    {
      'amount': 120.50,
      'category': 'Comida',
      'time': '12:45',
      'note': 'Almuerzo',
    },
    {
      'amount': 40.00,
      'category': 'Transporte',
      'time': '08:20',
      'note': 'Subte',
    },
    {
      'amount': 15.75,
      'category': 'Café',
      'time': '17:10',
      'note': 'Café con amigos',
    },
  ];

  DailyExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double totalAmount = expenses.fold<double>(
      0,
      (prev, item) => prev + item['amount'],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Gastos del Día')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.red[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.money_off,
                      size: 40,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total gastado hoy',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          '\$${totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];
                  return ListTile(
                    leading: const Icon(
                      Icons.arrow_circle_down_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      '\$${expense['amount']} - ${expense['category']}',
                    ),
                    subtitle: Text('${expense['note']} • ${expense['time']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add navigation to AddExpenseScreen
        },
        child: const Icon(Icons.add),
        tooltip: 'Agregar gasto',
      ),
    );
  }
}
