// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankModel _$$_BankModelFromJson(Map<String, dynamic> json) => _$_BankModel(
      id: json['id'] as String,
      accountNo: json['accountNo'] as String,
      bankHolderName: json['bankHolderName'] as String,
      ifscCode: json['ifscCode'] as String,
      bankName: json['bankName'] as String,
      branch: json['branch'] as String? ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_BankModelToJson(_$_BankModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountNo': instance.accountNo,
      'bankHolderName': instance.bankHolderName,
      'ifscCode': instance.ifscCode,
      'bankName': instance.bankName,
      'branch': instance.branch,
      'createdAt': instance.createdAt.toIso8601String(),
    };
