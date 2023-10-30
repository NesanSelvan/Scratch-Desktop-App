// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitModelImpl _$$UnitModelImplFromJson(Map<String, dynamic> json) =>
    _$UnitModelImpl(
      json['id'] as String?,
      json['symbol'] as String?,
      json['formalName'] as String?,
      json['unitNo'] as int?,
      json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$UnitModelImplToJson(_$UnitModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'formalName': instance.formalName,
      'unitNo': instance.unitNo,
      'dateTime': instance.dateTime?.toIso8601String(),
    };
