// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThreadsModel _$$_ThreadsModelFromJson(Map<String, dynamic> json) =>
    _$_ThreadsModel(
      number: json['number'] as String,
      stock: json['stock'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_ThreadsModelToJson(_$_ThreadsModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'stock': instance.stock,
      'createdAt': instance.createdAt.toIso8601String(),
    };
