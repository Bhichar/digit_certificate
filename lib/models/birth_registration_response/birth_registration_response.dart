import 'package:freezed_annotation/freezed_annotation.dart';
import '../birth_registration_application/birth_registration_application.dart';
part 'birth_registration_response.freezed.dart';
part 'birth_registration_response.g.dart';

@freezed
class BirthRegistrationResponse with _$BirthRegistrationResponse {
  const factory BirthRegistrationResponse({
    required List<BirthRegistrationApplication> birthRegistrationApplications,
  }) = _BirthRegistrationResponse;

  factory BirthRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$BirthRegistrationResponseFromJson(json);
}
