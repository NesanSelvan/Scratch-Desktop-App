// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThreadCompanyModel _$$_ThreadCompanyModelFromJson(
        Map<String, dynamic> json) =>
    _$_ThreadCompanyModel(
      id: json['id'] as String,
      companyModel:
          CompanyModel.fromJson(json['companyModel'] as Map<String, dynamic>),
      threadProduct: ThreadProductModel.fromJson(
        json['threadProduct'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_ThreadCompanyModelToJson(
        _$_ThreadCompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyModel': instance.companyModel.toJson(),
      'threadProduct': instance.threadProduct.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
