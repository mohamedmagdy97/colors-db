import 'package:dart_json_mapper/dart_json_mapper.dart'
    show JsonMapper, jsonSerializable, JsonProperty, enumConverterNumeric;

@jsonSerializable
class UserModel {

  @JsonProperty(name: "userName")
  String userName;
  @JsonProperty(name: "id")
  String id;
  @JsonProperty(name: "token")
  String token;
  @JsonProperty(name: "lang")
  String lang;
  @JsonProperty(name: "type")
  String type;


  UserModel({this.userName, this.id, this.token, this.lang});

  factory UserModel.fromJson(Map<String, dynamic> json) => JsonMapper.fromMap<UserModel>(json);
  Map<String, dynamic> toJson() => JsonMapper.toMap(this);
}