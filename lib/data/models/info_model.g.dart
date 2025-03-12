// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
  (json['count'] as num).toInt(),
  (json['pages'] as num).toInt(),
  json['next'] as String?,
  json['prev'] as String?,
);

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};
