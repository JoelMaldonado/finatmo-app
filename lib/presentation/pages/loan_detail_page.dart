import 'package:finatmo/app/app_routes.dart';
import 'package:flutter/material.dart';

class LoanDetailPage extends StatefulWidget {
  final int loanId;

  const LoanDetailPage({super.key, required this.loanId});

  @override
  State<LoanDetailPage> createState() => _LoanDetailPageState();
}

class _LoanDetailPageState extends State<LoanDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del deudor')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              _buildTotalTotals(),
              const SizedBox(height: 24),
              _buildSummary(),
              const SizedBox(height: 24),
              _buildBuys(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.addLoan,
            arguments: widget.loanId,
          ).then((_) {
            // provider.getLoanMovements(widget.loanId);
          });
        },
        tooltip: 'Agregar Prestamo',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTotalTotals() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildTotal(
                label: "Deuda base",
                amount: 500.00,
                backgroundColor: Colors.grey[300]!,
                textColor: Colors.black,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTotal(
                label: "Cancelado",
                amount: 50.00,
                backgroundColor: Colors.grey[300]!,
                textColor: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: _buildTotal(
            label: "Pendiente por cobrar",
            amount: 550.00,
            backgroundColor: Colors.blue[900]!,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Container _buildTotal({
    required String label,
    required double amount,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
          Text(
            "S/$amount",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[400]!, width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Text("Calendario de cobros"),
              const SizedBox(width: 12),
              Text("Historial mensual"),
            ],
          ),
          const SizedBox(height: 16),
          _buildMonthAmount(month: "Marzo 2026", amount: 50.00),
          const SizedBox(height: 12),
          _buildMonthAmount(month: "Abril 2026", amount: 50.00),
          const SizedBox(height: 12),
          _buildMonthAmount(month: "Mayo 2026", amount: 50.00),
          const SizedBox(height: 12),
          _buildMonthAmount(month: "Junio 2026", amount: 50.00),
        ],
      ),
    );
  }

  Widget _buildMonthAmount({required String month, required double amount}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(month)),
          Text("S/ $amount"),
        ],
      ),
    );
  }

  Widget _buildBuys() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Compras asociadas",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        _buildCardBuyItem(productName: "Macbook Air"),
        const SizedBox(height: 12),
        _buildCardBuyItem(productName: "Apple Watch"),
        const SizedBox(height: 12),
        _buildCardBuyItem(productName: "Bicicleta"),
      ],
    );
  }

  Widget _buildCardBuyItem({required String productName}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productName,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  "Activo",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.green[800],
                  ),
                ),
              ),
            ],
          ),
          Text(
            "10 cuotas - empieza en Marzo 2026",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
