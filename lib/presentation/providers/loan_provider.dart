import 'package:finatmo/domain/enums/type_loan_movement.dart';
import 'package:finatmo/domain/model/loan.dart';
import 'package:finatmo/domain/model/loan_movement.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:flutter/material.dart';

class LoanProvider extends ChangeNotifier {
  final LoanRepository repository;

  LoanProvider({required this.repository});

  List<Loan> listLoans = [];

  List<LoanMovement> loanMovements = [];
  List<LoanMovement> get getMovementsLoans =>
      loanMovements.where((m) => m.type == TypeLoanMovement.loan).toList();
  List<LoanMovement> get getMovementsPayments =>
      loanMovements.where((m) => m.type == TypeLoanMovement.payment).toList();

  Future<void> getLoans() async {
    final res = await repository.getLoans();
    res.fold((l) {}, (r) => listLoans = List.of(r));
    notifyListeners();
  }

  Future<void> getLoanMovements(int loanId) async {
    final res = await repository.getLoanMovements(loanId);
    res.fold((l) {}, (r) => loanMovements = List.of(r));
    notifyListeners();
  }
}
