// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLoanRequest _$AddLoanRequestFromJson(Map<String, dynamic> json) =>
    AddLoanRequest(
      name: json['name'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$AddLoanRequestToJson(AddLoanRequest instance) =>
    <String, dynamic>{'name': instance.name, 'notes': instance.notes};

AddLoanMovementRequest _$AddLoanMovementRequestFromJson(
  Map<String, dynamic> json,
) => AddLoanMovementRequest(
  loandId: (json['loanId'] as num).toInt(),
  typeId: (json['typeId'] as num).toInt(),
  amount: (json['amount'] as num).toDouble(),
  description: json['description'] as String,
  evidenceUrl: json['evidenceUrl'] as String?,
);

Map<String, dynamic> _$AddLoanMovementRequestToJson(
  AddLoanMovementRequest instance,
) => <String, dynamic>{
  'loanId': instance.loandId,
  'typeId': instance.typeId,
  'amount': instance.amount,
  'description': instance.description,
  'evidenceUrl': instance.evidenceUrl,
};
