import 'package:dartz/dartz.dart';
import 'package:finatmo/core/error/failure.dart';
import 'package:finatmo/data/model/requests/loan_requests.dart';
import 'package:finatmo/domain/model/loan.dart';
import 'package:finatmo/domain/model/loan_contact.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:flutter/material.dart';

class LoanProvider extends ChangeNotifier {
  final LoanRepository repository;

  LoanProvider({required this.repository});

  List<Loan> listLoans = [];

  List<LoanContact> listContacts = [];

  String? errorMessage;

  Future<void> getContacts() async {
    final res = await repository.getContacts();
    res.fold(
      (l) {
        debugPrint('Error fetching contacts: ${l.message}');
        errorMessage = l.message;
        notifyListeners();
      },
      (r) {
        listContacts = r;
        debugPrint('Contacts: $listContacts');
        notifyListeners();
      },
    );
  }

  Future<Either<Failure, Unit>> addContact({
    required String fullName,
    required String phone,
    required String email,
    required String notes,
  }) async {
    final request = AddLoanContactRequest(
      fullName: fullName,
      phone: phone.isEmpty ? null : phone,
      email: email.isEmpty ? null : email,
      notes: notes.isEmpty ? null : notes,
    );
    return await repository.addContact(request);
  }
}
