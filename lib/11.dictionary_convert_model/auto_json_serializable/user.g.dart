// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['nickname'] as String,
      json['level'] as num,
      json['register_date'] as String,
      (json['courses'] as List<dynamic>).map((e) => e as String).toList(),
      Computer.fromJson(json['computer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'level': instance.level,
      'register_date': instance.registerDate,
      'courses': instance.courses,
      'computer': instance.computer,
    };
