import 'package:json_annotation/json_annotation.dart';

part 'ItemModel.g.dart';

@JsonSerializable()
class ItemModel {
  @JsonKey(name: "amount")
  double amount;
  @JsonKey(name: "trxRef")
  String trxRef;
  @JsonKey(name: "userId")
  String userId;
  @JsonKey(name: "trxDate")
  String trxDate;

  @JsonKey(name: "mobileNumber")
  String mobileNumber;

  @JsonKey(name: "fullNameAR", defaultValue: '')
  String fullNameAR;
  @JsonKey(name: "fullNameEN", defaultValue: '')
  String fullNameEN;
  @JsonKey(name: "thurayaNumber", defaultValue: '')
  String thurayaNumber;

  @JsonKey(defaultValue: true)
  bool closed;

  ItemModel({
    required this.userId,
    required this.amount,
    required this.fullNameAR,
    required this.fullNameEN,
    required this.mobileNumber,
    required this.thurayaNumber,
    required this.trxDate,
    required this.trxRef,
    required this.closed,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
