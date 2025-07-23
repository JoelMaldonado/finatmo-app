import 'package:flutter/material.dart';

class AddLoanPaymentPage extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  AddLoanPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar pago')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Monto del pago'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: 'Nota (opcional)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Add image picker
              },
              icon: const Icon(Icons.photo),
              label: const Text('Agregar evidencia (opcional)'),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Save payment
              },
              icon: const Icon(Icons.check),
              label: const Text('Guardar pago'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
