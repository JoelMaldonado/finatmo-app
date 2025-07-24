import 'package:finatmo/data/model/requests/loan_requests.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:flutter/material.dart';

class AddLoanProvider extends ChangeNotifier {
  final LoanRepository repository;

  AddLoanProvider({required this.repository});

  final nameController = TextEditingController();
  final noteController = TextEditingController();

  bool isLoadingSave = false;
  Function? toBack;

  Future<void> save() async {
    isLoadingSave = true;
    notifyListeners();

    final request = AddLoanRequest(
      name: nameController.text,
      notes: noteController.text,
    );
    final res = await repository.addLoan(request);

    res.fold((l) {}, (r) {
      nameController.clear();
      noteController.clear();
      toBack?.call();
    });

    isLoadingSave = false;
    notifyListeners();
  }
}
