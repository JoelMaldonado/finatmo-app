import 'package:finatmo/data/model/requests/loan_requests.dart';
import 'package:finatmo/domain/enums/type_loan_movement.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:flutter/material.dart';

class AddMovementProvider extends ChangeNotifier {
  final LoanRepository repository;

  AddMovementProvider({required this.repository});

  final amountController = TextEditingController();
  final noteController = TextEditingController();
  TypeLoanMovement selectedValue = TypeLoanMovement.payment;

  Function? toBack;

  setType(TypeLoanMovement type) {
    selectedValue = type;
    notifyListeners();
  }

  Future<void> save(int loanId) async {
    final amount = double.parse(amountController.text);
    final request = AddLoanMovementRequest(
      loandId: loanId,
      typeId: selectedValue.value,
      amount: amount,
      description: noteController.text,
      evidenceUrl: null,
    );
    final res = await repository.addLoanMovement(request);

    res.fold((l) {}, (r) {
      amountController.clear();
      noteController.clear();
      selectedValue = TypeLoanMovement.loan;
      toBack?.call();
    });
  }
}
