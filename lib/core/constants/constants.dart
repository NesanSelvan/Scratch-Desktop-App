import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

const Color kPrimaryColor = Colors.blue;
const MaterialColor kMidPrimaryColor = Colors.blue;
final Color kLightPrimaryColor = Colors.blue[50]!;
final Color kSelectedColor = Colors.blue[100]!;

//Unit
const String formalName = "Formal Name";
const String symbol = "Symbol";

const List<String> stateList = [
  "Andhra Pradesh",
  "Arunachal Pradesh ",
  "Assam",
  "Bihar",
  "Chhattisgarh",
  "Goa",
  "Gujarat",
  "Haryana",
  "Himachal Pradesh",
  "Jammu and Kashmir",
  "Jharkhand",
  "Karnataka",
  "Kerala",
  "Madhya Pradesh",
  "Maharashtra",
  "Manipur",
  "Meghalaya",
  "Mizoram",
  "Nagaland",
  "Odisha",
  "Punjab",
  "Rajasthan",
  "Sikkim",
  "Tamil Nadu",
  "Telangana",
  "Tripura",
  "Uttar Pradesh",
  "Uttarakhand",
  "West Bengal",
  "Andaman and Nicobar Islands",
  "Chandigarh",
  "Dadra and Nagar Haveli",
  "Daman and Diu",
  "Lakshadweep",
  "Delhi",
  "Puducherry"
];

List<String> customerType = ["MRP", "Tailor", "Wholesale"];

//SERVER
const String ipAddress = "192.168.0.105";
const int port = 4000;

typedef DynamicCallback = Function(dynamic data);
typedef Uint8ListCallback = Function(Uint8List data);

String getYear() {
  debugPrint(
    'YEAR ${getTodaysDate().year} - ${getTodaysDate().add(const Duration(days: 365)).year}',
  );
  final todaysDate = DateTime.now();
  log("Year and Month Day From Bill: ${todaysDate.month} ${todaysDate.day}");
  if (todaysDate.month >= 4) {
    return "${getTodaysDate().subtract(const Duration(days: 365)).year + 1} - ${getTodaysDate().year + 1}";
  }
  return "${getTodaysDate().subtract(const Duration(days: 365)).year} - ${getTodaysDate().year}";
}

// String getBillNo(List<BillModel> list) {
//   if (list.isEmpty) {
//     return "1 / ${getYear()}";
//   }
//   debugPrint('Bill No : ${list.length + 1} / ${getYear()}');
//   final billModel = list.last;
//   final number = int.parse(billModel.billNo!.split("/")[0].trim());
//   return "${number + 1} / ${getYear()}";
// }

String getBillNo(List<String> list) {
  if (list.isEmpty) {
    return "1 / ${getYear()}";
  }
  debugPrint('Bill No : ${list.length + 1} / ${getYear()}');
  final billNo = list.last;
  list.sort((a, b) {
    final aBill = int.parse(a.split("/")[0].trim());
    final bBill = int.parse(b.split("/")[0].trim());

    return aBill.compareTo(bBill);
  });
  // final number = int.parse(billNo.split("/")[0].trim());
  return "${int.parse(list.last.split("/")[0].trim()) + 1} / ${getYear()}";
}

int getNoFromBillNo(String billNo) {
  return int.parse(billNo.split("/").first.trim());
}

// String getReceiptNo(List<ReceiptModel> list) {
//   if (list.isEmpty) {
//     return "1 / ${getYear()}";
//   }
//   debugPrint('Bill No : ${list.length + 1} / ${getYear()}');
//   final billModel = list.last;
//   final number = int.parse(billModel.receiptNo.split("/")[0].trim());
//   return "${number + 1} / ${getYear()}";
// }

// String getQuotationNo(List<QuotationModel> list) {
//   if (list.isEmpty) {
//     return "1 / ${getYear()}";
//   }
//   debugPrint('Bill No : ${list.length + 1} / ${getYear()}');
//   final billModel = list.last;
//   final number = int.parse(billModel.quotationNo.split("/")[0].trim());
//   return "${number + 1} / ${getYear()}";
// }

// String getOrderNo(List<OrderModel> list) {
//   if (list.isEmpty) {
//     return "1 / ${getYear()}";
//   }
//   debugPrint('Order No : ${list.length + 1} / ${getYear()}');
//   final billModel = list.last;
//   final number = int.parse(billModel.orderNo.split("/")[0].trim());
//   return "${number + 1} / ${getYear()}";
// }

// String getEstimateNo(List<EstimateModel> list) {
//   if (list.isEmpty) {
//     return "1 / ${getYear()}";
//   }
//   debugPrint('Order No : ${list.length + 1} / ${getYear()}');
//   final billModel = list.last;
//   final number = int.parse(billModel.estimateNo.split("/")[0].trim());
//   return "${number + 1} / ${getYear()}";
// }

final paymentMethod = ["Cash", "Cheque", "PayTM", "GPay", "NEFT"];

const localhostPort = 5000;
