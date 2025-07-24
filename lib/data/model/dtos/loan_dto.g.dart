// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanDto _$LoanDtoFromJson(Map<String, dynamic> json) => LoanDto(
  loanId: (json['loanId'] as num).toInt(),
  name: json['name'] as String,
  notes: json['notes'] as String?,
  totalLoanAmount: (json['totalLoanAmount'] as num?)?.toDouble(),
  totalPayments: (json['totalPayments'] as num?)?.toDouble(),
);

Map<String, dynamic> _$LoanDtoToJson(LoanDto instance) => <String, dynamic>{
  'loanId': instance.loanId,
  'name': instance.name,
  'notes': instance.notes,
  'totalLoanAmount': instance.totalLoanAmount,
  'totalPayments': instance.totalPayments,
};

LoanMovementDto _$LoanMovementDtoFromJson(Map<String, dynamic> json) =>
    LoanMovementDto(
      movementId: (json['movementId'] as num).toInt(),
      typeId: (json['typeId'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String?,
      date: json['date'] as String,
      evidenceUrl: json['evidenceUrl'] as String?,
    );

Map<String, dynamic> _$LoanMovementDtoToJson(LoanMovementDto instance) =>
    <String, dynamic>{
      'movementId': instance.movementId,
      'typeId': instance.typeId,
      'amount': instance.amount,
      'description': instance.description,
      'date': instance.date,
      'evidenceUrl': instance.evidenceUrl,
    };
