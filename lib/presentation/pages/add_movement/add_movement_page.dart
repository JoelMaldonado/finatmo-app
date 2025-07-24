import 'package:finatmo/domain/enums/type_loan_movement.dart';
import 'package:finatmo/presentation/components/custom_button.dart';
import 'package:finatmo/presentation/pages/add_movement/add_movement_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMovementPage extends StatelessWidget {
  const AddMovementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loanId = ModalRoute.of(context)!.settings.arguments as int;
    final provider = Provider.of<AddMovementProvider>(context);
    provider.toBack = () => Navigator.of(context).pop();
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar pago')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SegmentedButton<TypeLoanMovement>(
              segments: const <ButtonSegment<TypeLoanMovement>>[
                ButtonSegment(
                  value: TypeLoanMovement.payment,
                  label: Text('Pago'),
                ),
                ButtonSegment(
                  value: TypeLoanMovement.loan,
                  label: Text('Préstamo'),
                ),
              ],
              selected: <TypeLoanMovement>{provider.selectedValue},
              onSelectionChanged: (newSelection) {
                provider.setType(newSelection.first);
              },
            ),
            TextField(
              controller: provider.amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Monto del pago'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: provider.noteController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            const Spacer(),
            CustomButton(
              label: "Guardar",
              onPressed: () {
                provider.save(loanId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
