enum TypeLoanMovement { loan, payment }

extension TypeLoanMovementExtension on TypeLoanMovement {
  static TypeLoanMovement fromId(int id) {
    switch (id) {
      case 1:
        return TypeLoanMovement.loan;
      case 2:
        return TypeLoanMovement.payment;
      default:
        throw ArgumentError('Invalid typeId: $id');
    }
  }

  int get value {
    switch (this) {
      case TypeLoanMovement.loan:
        return 1;
      case TypeLoanMovement.payment:
        return 2;
    }
  }
}
