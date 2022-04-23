// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paths.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PathsModel _$$_PathsModelFromJson(Map<String, dynamic> json) =>
    _$_PathsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_PathsModelToJson(_$_PathsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'createdAt': instance.createdAt.toIso8601String(),
    };
