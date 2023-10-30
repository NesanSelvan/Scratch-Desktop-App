// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as String,
      catSymbol: json['catSymbol'] as String?,
      hsnCode: json['hsnCode'] as int,
      categoryNo: json['categoryNo'] as int?,
      category: json['category'] as String,
      tax: (json['tax'] as num).toDouble(),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'catSymbol': instance.catSymbol,
      'hsnCode': instance.hsnCode,
      'categoryNo': instance.categoryNo,
      'category': instance.category,
      'tax': instance.tax,
      'dateTime': instance.dateTime.toIso8601String(),
    };
