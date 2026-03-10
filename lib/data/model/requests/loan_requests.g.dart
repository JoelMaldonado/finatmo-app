// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLoanContactRequest _$AddLoanContactRequestFromJson(
  Map<String, dynamic> json,
) => AddLoanContactRequest(
  fullName: json['fullName'] as String,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$AddLoanContactRequestToJson(
  AddLoanContactRequest instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'phone': instance.phone,
  'email': instance.email,
  'notes': instance.notes,
};
