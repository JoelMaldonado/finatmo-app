import 'package:json_annotation/json_annotation.dart';

part 'loan_dto.g.dart';

@JsonSerializable()
class LoanMovementDto {
  @JsonKey(name: 'movementId')
  final int movementId;

  @JsonKey(name: 'typeId')
  final int typeId;

  @JsonKey(name: 'amount')
  final double amount;

  @JsonKey(name: 'description')
  final String description;

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
}
