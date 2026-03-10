import 'package:finatmo/domain/model/loan_contact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'loan_dto.g.dart';

@JsonSerializable()
class LoanContactDto {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'fullName')
  final String fullName;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'isActive')
  final bool? isActive;

  @JsonKey(name: 'notes')
  final String? notes;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  LoanContactDto({
    required this.id,
    required this.fullName,
    this.phone,
    this.email,
    this.isActive,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory LoanContactDto.fromJson(Map<String, dynamic> json) =>
      _$LoanContactDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoanContactDtoToJson(this);

  LoanContact toDomain() {
    return LoanContact(
      id: id,
      fullName: fullName,
      phone: phone,
      email: email,
      isActive: isActive,
      notes: notes,
      createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
    );
  }
}
