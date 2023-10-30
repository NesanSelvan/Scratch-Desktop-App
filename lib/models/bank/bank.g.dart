// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankModelImpl _$$BankModelImplFromJson(Map<String, dynamic> json) =>
    _$BankModelImpl(
      id: json['id'] as String,
      accountNo: json['accountNo'] as String,
      bankHolderName: json['bankHolderName'] as String,
      ifscCode: json['ifscCode'] as String,
      bankName: json['bankName'] as String,
      branch: json['branch'] as String? ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BankModelImplToJson(_$BankModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountNo': instance.accountNo,
      'bankHolderName': instance.bankHolderName,
      'ifscCode': instance.ifscCode,
      'bankName': instance.bankName,
      'branch': instance.branch,
      'createdAt': instance.createdAt.toIso8601String(),
    };
