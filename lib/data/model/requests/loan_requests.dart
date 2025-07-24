import 'package:json_annotation/json_annotation.dart';

part 'loan_requests.g.dart';

@JsonSerializable()
class AddLoanRequest {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'notes')
  final String notes;

  AddLoanRequest({required this.name, required this.notes});

  factory AddLoanRequest.fromJson(Map<String, dynamic> json) =>
      _$AddLoanRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddLoanRequestToJson(this);
}

@JsonSerializable()
class AddLoanMovementRequest {
  @JsonKey(name: 'loanId')
  final int loandId;

  @JsonKey(name: 'typeId')
  final int typeId;

  @JsonKey(name: 'amount')
  final double amount;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'evidenceUrl')
  final String? evidenceUrl;

  AddLoanMovementRequest({
    required this.loandId,
    required this.typeId,
    required this.amount,
    required this.description,
    required this.evidenceUrl,
  });

  factory AddLoanMovementRequest.fromJson(Map<String, dynamic> json) =>
      _$AddLoanMovementRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddLoanMovementRequestToJson(this);
}
