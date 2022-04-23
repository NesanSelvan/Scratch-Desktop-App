// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as String,
      catSymbol: json['catSymbol'] as String?,
      hsnCode: json['hsnCode'] as int,
      categoryNo: json['categoryNo'] as int?,
      category: json['category'] as String,
      tax: (json['tax'] as num).toDouble(),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'catSymbol': instance.catSymbol,
      'hsnCode': instance.hsnCode,
      'categoryNo': instance.categoryNo,
      'category': instance.category,
      'tax': instance.tax,
      'dateTime': instance.dateTime.toIso8601String(),
    };
