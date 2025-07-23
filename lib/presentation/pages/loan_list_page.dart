import 'package:finatmo/presentation/pages/add_loan_page.dart';
import 'package:finatmo/presentation/pages/loan_detail_page.dart';
import 'package:flutter/material.dart';

class LoanListPage extends StatelessWidget {
  final List<Map<String, dynamic>> loans = [
    {
      'name': 'Pedro',
      'totalAmount': 5000.0,
      'totalPaid': 2000.0,
      'lastPayment': 1000.0,
    },
    {
      'name': 'Ana',
      'totalAmount': 3000.0,
      'totalPaid': 1500.0,
      'lastPayment': 500.0,
    },
  ];

  LoanListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Préstamos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: loans.length,
        itemBuilder: (context, index) {
          final loan = loans[index];
          final remaining = loan['totalAmount'] - loan['totalPaid'];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(loan['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Deuda actual: S/ ${remaining.toStringAsFixed(2)}'),
                  Text('Último pago: S/ ${loan['lastPayment']}'),
                  Text('Total pagado: S/ ${loan['totalPaid']}'),
                ],
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return LoanDetailPage();
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return AddLoanPage();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Nuevo préstamo',
      ),
    );
  }
}
