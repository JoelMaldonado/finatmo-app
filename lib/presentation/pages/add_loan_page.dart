import 'package:finatmo/presentation/components/custom_button.dart';
import 'package:finatmo/presentation/components/custom_input.dart';
import 'package:flutter/material.dart';

class AddLoanPage extends StatefulWidget {
  const AddLoanPage({super.key});

  @override
  State<AddLoanPage> createState() => _AddLoanPageState();
}

class _AddLoanPageState extends State<AddLoanPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar pago')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomInput(
              label: "Title",
              controller: _titleController,
              hintText: "Enter title",
              prefixIcon: Icons.title,
            ),
            const SizedBox(height: 16),
            CustomInput(
              label: 'Descripción',
              controller: _descriptionController,
              hintText: 'Ingrese una descripción',
              prefixIcon: Icons.description,
            ),
            const Spacer(),
            CustomButton(label: "Guardar", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
