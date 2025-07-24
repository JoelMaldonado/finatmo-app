import 'package:finatmo/presentation/components/custom_button.dart';
import 'package:finatmo/presentation/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddLoanPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  AddLoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo préstamo')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Nombre del amigo',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Monto prestado',
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: noteController,
                        decoration: const InputDecoration(
                          labelText: 'Descripción (opcional)',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: "Guardar préstamo",
                leadingIcon: Icons.check,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
