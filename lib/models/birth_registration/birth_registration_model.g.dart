// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birth_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BirthRegistrationModelImpl _$$BirthRegistrationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BirthRegistrationModelImpl(
      id: (json['id'] as num?)?.toInt(),
      babyFirstName: json['babyFirstName'] as String,
      babygender: (json['babygender'] as num).toInt(),
      babyWeight: json['babyWeight'] as String,
      doctorName: json['doctorName'] as String,
      hospitalName: json['hospitalName'] as String,
      mother: json['mother'] as String,
      placeOfBirth: json['placeOfBirth'] as String,
      tenantId: json['tenantId'] as String,
    );

Map<String, dynamic> _$$BirthRegistrationModelImplToJson(
        _$BirthRegistrationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'babyFirstName': instance.babyFirstName,
      'babygender': instance.babygender,
      'babyWeight': instance.babyWeight,
      'doctorName': instance.doctorName,
      'hospitalName': instance.hospitalName,
      'mother': instance.mother,
      'placeOfBirth': instance.placeOfBirth,
      'tenantId': instance.tenantId,
    };
