// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillModel _$$_BillModelFromJson(Map<String, dynamic> json) => _$_BillModel(
      id: json['id'] as String,
      billNo: json['billNo'] as String,
      borrowId: json['borrowId'] as String?,
      customerModel:
          CustomerModel.fromJson(json['customerModel'] as Map<String, dynamic>),
      givenAmount: (json['givenAmount'] as num?)?.toDouble() ?? 0,
      isPaid: json['isPaid'] as bool? ?? false,
      isTax: json['isTax'] as bool? ?? true,
      paidId: json['paidId'] as String? ?? "",
      price: (json['price'] as num).toDouble(),
      productList: (json['productList'] as List<dynamic>?)
          ?.map((e) => SalesProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateTime: DateTime.parse(json['dateTime'] as String),
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      note: json['note'] as String? ?? "",
      supplierRef: json['supplierRef'] as String? ?? "",
      buyerOrderNo: json['buyerOrderNo'] as String? ?? "",
      buyerOrderDate: json['buyerOrderDate'] == null
          ? null
          : DateTime.parse(json['buyerOrderDate'] as String),
      dispatchDocumentNo: json['dispatchDocumentNo'] as String? ?? "",
      dispatchThrough: json['dispatchThrough'] as String? ?? "",
      destination: json['destination'] as String? ?? "",
      isA4Printed: json['isA4Printed'] as bool? ?? false,
    );

Map<String, dynamic> _$$_BillModelToJson(_$_BillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billNo': instance.billNo,
      'borrowId': instance.borrowId,
      'customerModel': instance.customerModel.toJson(),
      'givenAmount': instance.givenAmount,
      'isPaid': instance.isPaid,
      'isTax': instance.isTax,
      'paidId': instance.paidId,
      'price': instance.price,
      'productList': instance.productList?.map((e) => e.toJson()).toList(),
      'dateTime': instance.dateTime.toIso8601String(),
      'discount': instance.discount,
      'note': instance.note,
      'supplierRef': instance.supplierRef,
      'buyerOrderNo': instance.buyerOrderNo,
      'buyerOrderDate': instance.buyerOrderDate?.toIso8601String(),
      'dispatchDocumentNo': instance.dispatchDocumentNo,
      'dispatchThrough': instance.dispatchThrough,
      'destination': instance.destination,
      'isA4Printed': instance.isA4Printed,
    };
