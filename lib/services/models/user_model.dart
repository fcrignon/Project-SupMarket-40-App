import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String idcodeQR;

  User(
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.idcodeQR,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson((this));
}
