// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubCategoryModel _$$_SubCategoryModelFromJson(Map<String, dynamic> json) =>
    _$_SubCategoryModel(
      json['id'] as String?,
      json['hsnCode'] as int?,
      json['subCategoryName'] as String?,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_SubCategoryModelToJson(_$_SubCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hsnCode': instance.hsnCode,
      'subCategoryName': instance.subCategoryName,
      'createdAt': instance.createdAt.toIso8601String(),
    };
