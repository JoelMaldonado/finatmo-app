import 'package:finatmo/app/app_routes.dart';
import 'package:finatmo/presentation/components/card_loan_contact.dart';
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
      context.read<LoanProvider>().getContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoanProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Préstamos')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: provider.listContacts.length,
              itemBuilder: (context, index) {
                final contact = provider.listContacts[index];
                return CardLoanContact(
                  contact: contact,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return LoanDetailPage(loanId: 1);
                        },
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addLoan).then((_) {
            provider.getContacts();
          });
        },
        tooltip: 'Nuevo préstamo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
