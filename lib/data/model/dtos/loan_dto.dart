import 'package:finatmo/domain/enums/type_loan_movement.dart';
import 'package:finatmo/domain/model/loan.dart';
import 'package:finatmo/domain/model/loan_movement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'loan_dto.g.dart';

@JsonSerializable()
class LoanDto {
  @JsonKey(name: 'loanId')
  final int loanId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'notes')
  final String? notes;

  LoanDto({required this.loanId, required this.name, required this.notes});

  factory LoanDto.fromJson(Map<String, dynamic> json) =>
      _$LoanDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoanDtoToJson(this);

  Loan toDomain() {
    return Loan(loanId: loanId, name: name, notes: notes);
  }
}

@JsonSerializable()
class LoanMovementDto {
  @JsonKey(name: 'movementId')
  final int movementId;

  @JsonKey(name: 'typeId')
  final int typeId;

  @JsonKey(name: 'amount')
  final double amount;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'date')
  final String date;

  @JsonKey(name: 'evidenceUrl')
  final String? evidenceUrl;

  LoanMovementDto({
    required this.movementId,
    required this.typeId,
    required this.amount,
    required this.description,
    required this.date,
    required this.evidenceUrl,
  });

  factory LoanMovementDto.fromJson(Map<String, dynamic> json) =>
      _$LoanMovementDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoanMovementDtoToJson(this);

  LoanMovement toDomain() {
    return LoanMovement(
      movementId: movementId,
      type: TypeLoanMovementExtension.fromId(typeId),
      amount: amount,
      description: description,
      date: DateTime.parse(date),
      evidenceUrl: evidenceUrl,
    );
  }
}
