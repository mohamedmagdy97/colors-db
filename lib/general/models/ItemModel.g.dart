// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      fullNameAR: json['fullNameAR'] as String? ?? '',
      fullNameEN: json['fullNameEN'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String,
      thurayaNumber: json['thurayaNumber'] as String? ?? '',
      trxDate: json['trxDate'] as String,
      trxRef: json['trxRef'] as String,
      closed: json['closed'] as bool? ?? true,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'amount': instance.amount,
      'trxRef': instance.trxRef,
      'userId': instance.userId,
      'trxDate': instance.trxDate,
      'mobileNumber': instance.mobileNumber,
      'fullNameAR': instance.fullNameAR,
      'fullNameEN': instance.fullNameEN,
      'thurayaNumber': instance.thurayaNumber,
      'closed': instance.closed,
    };
