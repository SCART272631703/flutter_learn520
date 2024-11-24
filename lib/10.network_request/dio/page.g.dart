// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      pageNo: (json['pageNo'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'count': instance.count,
    };
