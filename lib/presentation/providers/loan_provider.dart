import 'package:finatmo/data/model/dtos/loan_dto.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:flutter/material.dart';

class LoanProvider extends ChangeNotifier {
  final LoanRepository repository;

  LoanProvider({required this.repository});

  List<LoanMovementDto> loanMovements = [];

  List<LoanMovementDto> getPayments() {
    return loanMovements.where((m) => m.typeId == 2).toList();
  }

  List<LoanMovementDto> getLoans() {
    return loanMovements.where((m) => m.typeId == 1).toList();
  }

  Future<void> getLoanMovements() async {
    try {
      loanMovements = await repository.getLoanMovements(1);
      notifyListeners();
    } catch (e) {
      print('Error fetching loan movements: $e');
    }
  }
}
