import 'package:finatmo/app/app_routes.dart';
import 'package:finatmo/presentation/pages/loan_detail_page.dart';
import 'package:finatmo/presentation/providers/loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoanListPage extends StatefulWidget {
  const LoanListPage({super.key});

  @override
  State<LoanListPage> createState() => _LoanListPageState();
}

class _LoanListPageState extends State<LoanListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoanProvider>(context, listen: false).getLoans();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoanProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Préstamos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: provider.listLoans.length,
        itemBuilder: (context, index) {
          final loan = provider.listLoans[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(loan.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Deuda actual: S/${loan.totalLoanAmount}'),
                  Text('Total pagado: S/${loan.totalPayments}'),
                ],
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return LoanDetailPage(loanId: loan.loanId);
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
          Navigator.pushNamed(context, AppRoutes.addLoan).then((_) {
            provider.getLoans();
          });
        },
        tooltip: 'Nuevo préstamo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
