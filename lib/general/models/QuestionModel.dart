import 'package:json_annotation/json_annotation.dart';

part 'QuestionModel.g.dart';

@JsonSerializable()
class QuestionModel {

  @JsonKey(name: "question")
  String question;
  @JsonKey(name: "answer")
  String answer;
  @JsonKey(defaultValue: true)
  bool closed;

  QuestionModel({required this.question,required this.answer,required this.closed});




  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}