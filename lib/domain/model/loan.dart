class Loan {
  final int loanId;
  final String name;
  final String? notes;
  final double totalLoanAmount;
  final double totalPayments;

  Loan({
    required this.loanId,
    required this.name,
    this.notes,
    required this.totalLoanAmount,
    required this.totalPayments,
  });
}
