import 'package:json_annotation/json_annotation.dart'; 

part 'user_model.g.dart'; 

@JsonSerializable(nullable: true)
class UserModel {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "userName")
  String userName;
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "lang")
  String lang;

  UserModel({this.id, this.userName, this.token, this.lang});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

