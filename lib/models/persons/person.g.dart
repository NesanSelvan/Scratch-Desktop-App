// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonModelImpl _$$PersonModelImplFromJson(Map<String, dynamic> json) =>
    _$PersonModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      pincode: json['pincode'] as int,
      state: json['state'] as String,
      type: $enumDecodeNullable(_$PersonEnumEnumMap, json['type']) ??
          PersonEnum.Customer,
      mobileNo: json['mobileNo'] as int,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PersonModelImplToJson(_$PersonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'pincode': instance.pincode,
      'state': instance.state,
      'type': _$PersonEnumEnumMap[instance.type]!,
      'mobileNo': instance.mobileNo,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$PersonEnumEnumMap = {
  PersonEnum.Employee: 'Employee',
  PersonEnum.Customer: 'Customer',
  PersonEnum.Manager: 'Manager',
  PersonEnum.Admin: 'Admin',
  PersonEnum.SuperAdmin: 'SuperAdmin',
  PersonEnum.SoftwareOwner: 'SoftwareOwner',
};
