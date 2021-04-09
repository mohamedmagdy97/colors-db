import 'package:dart_json_mapper/dart_json_mapper.dart'
    show JsonMapper, jsonSerializable, JsonProperty, enumConverterNumeric;

@jsonSerializable
class QuestionModel {

  @JsonProperty(name: "question")
  String question;
  @JsonProperty(name: "answer")
  String answer;
  @JsonProperty(defaultValue: true)
  bool closed;

  QuestionModel({this.question, this.answer});

  factory QuestionModel.fromJson(Map<String, dynamic> json) => JsonMapper.fromMap<QuestionModel>(json);
  Map<String, dynamic> toJson() => JsonMapper.toMap(this);
}