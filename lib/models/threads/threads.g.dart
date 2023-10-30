// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThreadsModelImpl _$$ThreadsModelImplFromJson(Map<String, dynamic> json) =>
    _$ThreadsModelImpl(
      number: json['number'] as String,
      stock: json['stock'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ThreadsModelImplToJson(_$ThreadsModelImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'stock': instance.stock,
      'createdAt': instance.createdAt.toIso8601String(),
    };
