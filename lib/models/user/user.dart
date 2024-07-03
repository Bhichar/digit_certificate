import 'package:freezed_annotation/freezed_annotation.dart';
import '../role/role.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required dynamic tenantId,
    required dynamic userName,
    required List<Role> roles,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
