import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill.freezed.dart';
part 'bill.g.dart';

@unfreezed
abstract class BillModel with _$BillModel {
  @JsonSerializable(explicitToJson: true)
  factory BillModel({
    required String id,
    required String billNo,
    String? borrowId,
    required CustomerModel customerModel,
    @Default(0) double? givenAmount,
    @Default(false) bool? isPaid,
    @Default(true) bool? isTax,
    @Default("") String? paidId,
    required double price,
    required List<SalesProductModel>? productList,
    required DateTime dateTime,
    @Default(0) double? discount,
    @Default("") String? note,
    @Default("") String? supplierRef,
    @Default("") String? buyerOrderNo,
    DateTime? buyerOrderDate,
    @Default("") String? dispatchDocumentNo,
    @Default("") String? dispatchThrough,
    @Default("") String? destination,
    @Default(false) bool? isA4Printed,
  }) = _BillModel;
  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);
}

// class BillModel {
//   String? id;
//   String? billNo;
//   String? borrowId;
//   CustomerModel? customerModel;
//   double? givenAmount;
//   bool? isPaid;
//   bool? isTax;
//   String? paidId;

//   double? price;
//   List<SalesProductModel>? productList;
//   DateTime? dateTime;
//   double? discount;
//   String? note;
//   String? supplierRef;
//   String? buyerOrderNo;
//   DateTime? buyerOrderDate;
//   String? dispatchDocumentNo;
//   String? dispatchThrough;
//   String? destination;

//   BillModel(
//       {required this.id,
//       required this.billNo,
//       this.borrowId,
//       this.buyerOrderDate,
//       this.buyerOrderNo,
//       required this.customerModel,
//       required this.dateTime,
//       this.destination,
//       required this.discount,
//       this.dispatchDocumentNo,
//       this.dispatchThrough,
//       required this.givenAmount,
//       required this.isPaid,
//       required this.isTax,
//       this.note,
//       required this.paidId,
//       required this.price,
//       required this.productList,
//       this.supplierRef});
//   Map<String, dynamic> toJson() {
//     final json = <String, dynamic>{};
//     json['billNo'] = billNo;
//     json['id'] = id;
//     json['borrowId'] = borrowId;
//     json['buyerOrderDate'] = buyerOrderDate.toString();
//     json['buyerOrderNo'] = buyerOrderNo;
//     json['customerModel'] = customerModel!.toJson();
//     json['dateTime'] = dateTime.toString();
//     json['destination'] = destination;
//     json['discount'] = discount;
//     json['dispatchDocumentNo'] = dispatchDocumentNo;
//     json['dispatchThrough'] = dispatchThrough;
//     json['givenAmount'] = givenAmount;
//     json['isPaid'] = isPaid;
//     json['isTax'] = isTax;
//     json['note'] = note;
//     json['paidId'] = paidId;
//     json['price'] = price;
//     json['supplierRef'] = supplierRef;

//     List<Map<String, dynamic>> datas = [];
//     for (final item in productList!) {
//       datas.add(item.toJson());
//     }
//     json['productList'] = datas;
//     return json;
//   }

//   BillModel.fromJson(Map<String, dynamic> json) {
//     billNo = validateStringData("${json['billNo']}");
//     id = validateStringData("${json['id']}");
//     borrowId = validateStringData("${json['borrowId']}");
//     customerModel =
//         CustomerModel.fromJson(json['customerModel'] as Map<String, dynamic>);
//     givenAmount = validateDoubleData("${json['givenAmount']}");
//     isPaid = validateBoolData(json['isPaid'] as bool);
//     isTax = validateBoolData(json['isTax'] as bool);
//     paidId = validateStringData("${json['paidId']}");
//     price = validateDoubleData("${json['price']}");
//     // productList = validateStringData("json['productList']");
//     dateTime = validateDateTime("${json['dateTime']}");
//     discount = validateDoubleData("${json['discount']}");
//     note = validateStringData("${json['note']}");
//     supplierRef = validateStringData("${json['supplierRef']}");
//     buyerOrderNo = validateStringData("${json['buyerOrderNo']}");
//     buyerOrderDate = validateDateTime("${json['buyerOrderDate']}");
//     dispatchDocumentNo = validateStringData("${json['dispatchDocumentNo']}");
//     dispatchThrough = validateStringData("${json['dispatchThrough']}");
//     destination = validateStringData("${json['destination']}");
//     List<SalesProductModel> datas = [];
//     for (final item in json['productList'] as List) {
//       datas.add(SalesProductModel.fromJson(item as Map<String, dynamic>));
//     }
//     productList = datas;
//   }
// }

List<Map<String, dynamic>> getBillListJson(List<BillModel> list) {
  return list.map((e) => e.toJson()).toList();
}
