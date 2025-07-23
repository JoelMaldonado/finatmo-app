import 'package:finatmo/data/model/dtos/loan_dto.dart';
import 'package:finatmo/presentation/pages/add_loan_payment_page.dart';
import 'package:finatmo/presentation/providers/loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoanDetailPage extends StatefulWidget {
  const LoanDetailPage({super.key});

  @override
  State<LoanDetailPage> createState() => _LoanDetailPageState();
}

class _LoanDetailPageState extends State<LoanDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Simulados: normalmente vendrían de una base de datos
  final double totalLoaned = 8000;
  final double totalPaid = 2000;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoanProvider>(context, listen: false).getLoanMovements();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildPaymentsTab(List<LoanMovementDto> payments) {
    return ListView.builder(
      itemCount: payments.length,
      itemBuilder: (context, index) {
        final payment = payments[index];
        return ListTile(
          leading: const Icon(Icons.attach_money, color: Colors.green),
          title: Text('S/ ${payment.amount}'),
          subtitle: Text('${payment.date} - ${payment.description}'),
        );
      },
    );
  }

  Widget _buildLoansTab(List<LoanMovementDto> loans) {
    return ListView.builder(
      itemCount: loans.length,
      itemBuilder: (context, index) {
        final loan = loans[index];
        return ListTile(
          leading: const Icon(Icons.trending_up, color: Colors.redAccent),
          title: Text('S/ ${loan.amount}'),
          subtitle: Text('${loan.date} - ${loan.description}'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoanProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del deudor'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Historial de pagos'),
            Tab(text: 'Historial de préstamos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPaymentsTab(provider.getPayments()),
          _buildLoansTab(provider.getLoans()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return AddLoanPaymentPage();
              },
            ),
          );
        },
        tooltip: _tabController.index == 0
            ? 'Agregar pago'
            : 'Agregar préstamo',
        child: Icon(_tabController.index == 0 ? Icons.add : Icons.add_card),
      ),
    );
  }
}
