// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyModelImpl _$$CompanyModelImplFromJson(Map<String, dynamic> json) =>
    _$CompanyModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      companyNo: json['companyNo'] as int?,
      email: json['email'] as String? ?? "",
      website: json['website'] as String? ?? "",
      licNO: json['licNO'] as String? ?? "",
      placeOfDispatch: json['placeOfDispatch'] as String? ?? "",
      pan: json['pan'] as String? ?? "",
      mobileNoList: json['mobileNoList'] as String,
      gstin: json['gstin'] as String? ?? "",
      bankId: json['bankId'] as String? ?? "",
      isNormalPurchaseBill: json['isNormalPurchaseBill'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CompanyModelImplToJson(_$CompanyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'companyNo': instance.companyNo,
      'email': instance.email,
      'website': instance.website,
      'licNO': instance.licNO,
      'placeOfDispatch': instance.placeOfDispatch,
      'pan': instance.pan,
      'mobileNoList': instance.mobileNoList,
      'gstin': instance.gstin,
      'bankId': instance.bankId,
      'isNormalPurchaseBill': instance.isNormalPurchaseBill,
      'createdAt': instance.createdAt.toIso8601String(),
    };
