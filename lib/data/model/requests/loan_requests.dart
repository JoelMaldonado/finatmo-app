import 'package:json_annotation/json_annotation.dart';

part 'loan_requests.g.dart';

@JsonSerializable()
class AddLoanContactRequest {
  @JsonKey(name: 'fullName')
  final String fullName;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'notes')
  final String? notes;

  AddLoanContactRequest({
    required this.fullName,
    this.phone,
    this.email,
    this.notes,
  });

  factory AddLoanContactRequest.fromJson(Map<String, dynamic> json) =>
      _$AddLoanContactRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddLoanContactRequestToJson(this);
}
