// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDetailsModel _$HomeDetailsModelFromJson(Map<String, dynamic> json) =>
    HomeDetailsModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String? ?? '',
      pageNumber: json['pageNumber'] as int,
      pageSize: json['pageSize'] as int,
      errors: json['errors'] as String? ?? '',
      lastPage: json['lastPage'] as String,
      firstPage: json['firstPage'] as String,
      nextPage: json['nextPage'] as String? ?? '',
      previousPage: json['previousPage'] as String? ?? '',
      succeeded: json['succeeded'] as bool,
      totalRecords: json['totalRecords'] as int,
      totalPages: json['totalPages'] as int,
      closed: json['closed'] as bool? ?? true,
    );

Map<String, dynamic> _$HomeDetailsModelToJson(HomeDetailsModel instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'firstPage': instance.firstPage,
      'lastPage': instance.lastPage,
      'totalPages': instance.totalPages,
      'totalRecords': instance.totalRecords,
      'nextPage': instance.nextPage,
      'previousPage': instance.previousPage,
      'errors': instance.errors,
      'message': instance.message,
      'succeeded': instance.succeeded,
      'data': instance.data,
      'closed': instance.closed,
    };
