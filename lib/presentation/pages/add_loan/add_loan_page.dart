import 'package:finatmo/presentation/components/custom_button.dart';
import 'package:finatmo/presentation/components/custom_text_field.dart';
import 'package:finatmo/presentation/pages/add_loan/add_loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLoanPage extends StatelessWidget {
  const AddLoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddLoanProvider>(context);
    provider.toBack = () => Navigator.of(context).pop();
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
                        controller: provider.nameController,
                        hintText: 'Nombre del amigo',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: provider.noteController,
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
                isLoading: provider.isLoadingSave,
                onPressed: provider.save,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
