import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "fullName",defaultValue: '')
  String fullName;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "userName")
  String userName;

  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "dateCreated")
  String dateCreated;

  @JsonKey(name: "token")
  String token;

  @JsonKey(name: "roles")
  List<String> roles;

  UserModel({
    required this.userName,
    required this.id,
    required this.token,
    required this.email,
    required this.fullName,
    required this.roles,
    required this.dateCreated,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
