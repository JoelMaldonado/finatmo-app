import 'package:finatmo/presentation/components/custom_button.dart';
import 'package:finatmo/presentation/components/custom_text_field.dart';
import 'package:finatmo/presentation/providers/loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLoanPage extends StatefulWidget {
  const AddLoanPage({super.key});

  @override
  State<AddLoanPage> createState() => _AddLoanPageState();
}

class _AddLoanPageState extends State<AddLoanPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final notesController = TextEditingController();

  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Contacto')),
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
                        hintText: 'Nombre',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: phoneController,
                        hintText: 'Teléfono',
                        icon: Icons.phone,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Correo electrónico',
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: notesController,
                        hintText: 'Notas',
                        icon: Icons.note,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: "Guardar préstamo",
                isLoading: _isSaving,
                onPressed: _saveContact,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveContact() async {
    setState(() => _isSaving = true);
    final provider = context.read<LoanProvider>();
    final res = await provider.addContact(
      fullName: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      notes: notesController.text,
    );
    res.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar contacto: ${l.message}')),
        );
        setState(() => _isSaving = false);
      },
      (r) {
        Navigator.pop(context, true);
      },
    );
  }
}
