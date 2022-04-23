// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeModel _$$_EmployeeModelFromJson(Map<String, dynamic> json) =>
    _$_EmployeeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      pincode: json['pincode'] as int,
      state: json['state'] as String,
      type: json['type'] as String,
      mobileNo: json['mobileNo'] as int,
      password: json['password'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_EmployeeModelToJson(_$_EmployeeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'pincode': instance.pincode,
      'state': instance.state,
      'type': instance.type,
      'mobileNo': instance.mobileNo,
      'password': instance.password,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
