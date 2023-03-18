// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseModel _$$_PurchaseModelFromJson(Map<String, dynamic> json) =>
    _$_PurchaseModel(
      id: json['id'] as String,
      billNo: json['billNo'] as String,
      companyModel:
          CompanyModel.fromJson(json['companyModel'] as Map<String, dynamic>),
      isNormalPurchaseBill: json['isNormalPurchaseBill'] as bool?,
      lorryFright: (json['lorryFright'] as num?)?.toDouble(),
      lorryFrightTax: (json['lorryFrightTax'] as num?)?.toDouble(),
      lorryFrightTotal: (json['lorryFrightTotal'] as num?)?.toDouble(),
      overallDiscount: (json['overallDiscount'] as num?)?.toDouble(),
      productList: (json['productList'] as List<dynamic>)
          .map((e) => PurchaseProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentsIdList: (json['paymentsIdList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isTax: json['isTax'] as bool? ?? true,
      grandTotal: (json['grandTotal'] as num).toDouble(),
      forwardingSales: (json['forwardingSales'] as num?)?.toDouble(),
      dateTime: DateTime.parse(json['dateTime'] as String),
      note: json['note'] as String?,
      imagesPathList: (json['imagesPathList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tcsSales: (json['tcsSales'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_PurchaseModelToJson(_$_PurchaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billNo': instance.billNo,
      'companyModel': instance.companyModel.toJson(),
      'isNormalPurchaseBill': instance.isNormalPurchaseBill,
      'lorryFright': instance.lorryFright,
      'lorryFrightTax': instance.lorryFrightTax,
      'lorryFrightTotal': instance.lorryFrightTotal,
      'overallDiscount': instance.overallDiscount,
      'productList': instance.productList.map((e) => e.toJson()).toList(),
      'paymentsIdList': instance.paymentsIdList,
      'isTax': instance.isTax,
      'grandTotal': instance.grandTotal,
      'forwardingSales': instance.forwardingSales,
      'dateTime': instance.dateTime.toIso8601String(),
      'note': instance.note,
      'imagesPathList': instance.imagesPathList,
      'tcsSales': instance.tcsSales,
      'createdAt': instance.createdAt.toIso8601String(),
    };
