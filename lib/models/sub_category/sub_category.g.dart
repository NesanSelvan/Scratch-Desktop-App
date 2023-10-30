// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubCategoryModelImpl _$$SubCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubCategoryModelImpl(
      json['id'] as String?,
      json['hsnCode'] as int?,
      json['subCategoryName'] as String?,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$SubCategoryModelImplToJson(
        _$SubCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hsnCode': instance.hsnCode,
      'subCategoryName': instance.subCategoryName,
      'createdAt': instance.createdAt.toIso8601String(),
    };
