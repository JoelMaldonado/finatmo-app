import 'package:finatmo/domain/enums/type_loan_movement.dart';

class LoanMovement {
  final int movementId;
  final TypeLoanMovement type;
  final double amount;
  final String? description;
  final DateTime date;
  final String? evidenceUrl;

  LoanMovement({
    required this.movementId,
    required this.type,
    required this.amount,
    required this.description,
    required this.date,
    required this.evidenceUrl,
  });
}
