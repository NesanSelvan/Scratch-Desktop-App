// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paths.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PathsModelImpl _$$PathsModelImplFromJson(Map<String, dynamic> json) =>
    _$PathsModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PathsModelImplToJson(_$PathsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'createdAt': instance.createdAt.toIso8601String(),
    };
