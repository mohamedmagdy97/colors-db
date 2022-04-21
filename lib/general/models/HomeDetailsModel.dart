import 'package:base_flutter/general/models/ItemModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'HomeDetailsModel.g.dart';

@JsonSerializable()
class HomeDetailsModel {
  @JsonKey(name: "pageNumber")
  int pageNumber;
  @JsonKey(name: "pageSize")
  int pageSize;
  @JsonKey(name: "firstPage")
  String firstPage;
  @JsonKey(name: "lastPage")
  String lastPage;

  @JsonKey(name: "totalPages")
  int totalPages;

  @JsonKey(name: "totalRecords")
  int totalRecords;

  @JsonKey(name: "nextPage",defaultValue: '')
  String nextPage;
  @JsonKey(name: "previousPage",defaultValue: '')
  String previousPage;
  @JsonKey(name: "errors",defaultValue: '')
  String errors;
  @JsonKey(name: "message",defaultValue: '')
  String message;
  @JsonKey(name: "succeeded")
  bool succeeded;

  @JsonKey(name: "data")
  List<ItemModel> data;

  @JsonKey(defaultValue: true)
  bool closed;

  HomeDetailsModel({
    required this.data,
    required this.message,
    required this.pageNumber,
    required this.pageSize,
    required this.errors,
    required this.lastPage,
    required this.firstPage,
    required this.nextPage,
    required this.previousPage,
    required this.succeeded,
    required this.totalRecords,
    required this.totalPages,
    required this.closed,
  });

  factory HomeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDetailsModelToJson(this);
}
