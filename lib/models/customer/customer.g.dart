// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      address: json['address'] as String,
      pincode: json['pincode'] as int,
      state: json['state'] as String,
      type: json['type'] as String,
      isPending: json['isPending'] as bool,
      mobileNo: json['mobileNo'] as int,
      gstin: json['gstin'] as String?,
      pendingAmount: (json['pendingAmount'] as num?)?.toDouble() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      openingBalance: (json['openingBalance'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'pincode': instance.pincode,
      'state': instance.state,
      'type': instance.type,
      'isPending': instance.isPending,
      'mobileNo': instance.mobileNo,
      'gstin': instance.gstin,
      'pendingAmount': instance.pendingAmount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'openingBalance': instance.openingBalance,
    };
