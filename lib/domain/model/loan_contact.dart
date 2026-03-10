class LoanContact {
  final String id;
  final String fullName;
  final String? phone;
  final String? email;
  final bool? isActive;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LoanContact({
    required this.id,
    required this.fullName,
    this.phone,
    this.email,
    this.isActive,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });
}
