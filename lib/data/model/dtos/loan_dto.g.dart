// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanMovementDto _$LoanMovementDtoFromJson(Map<String, dynamic> json) =>
    LoanMovementDto(
      movementId: (json['movementId'] as num).toInt(),
      typeId: (json['typeId'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
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
