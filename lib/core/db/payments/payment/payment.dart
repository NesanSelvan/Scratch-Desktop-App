import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';

import '../../../../models/failure/failure.dart';
import '../../../../models/payment/payment.dart';

class PaymentDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    await Database().storage.setItem("payments", []);
  }

  List<PaymentModel> getAllPayment() {
    final data = Database().storage.getItem('payments');
    // debugPrint('Payment Item: $data');

    final List<PaymentModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('PaymentModel Item: $item');
        datas.add(PaymentModel.fromJson(item as Map<String, dynamic>));
      }
    }
    return datas;
  }

  Future<void> addPaymentToDb(PaymentModel paymentModel) async {
    try {
      // final _paymentModelList = getAllPayment();
      // final datas = [..._paymentModelList, paymentModel];
      // debugPrint("Datas : $datas");
      // await updatePaymentToDB(datas);

      final paymentModelList = getAllPayment();
      final datas = [...paymentModelList, paymentModel];
      await updatePaymentToDB(datas);
    } catch (e) {
      throw Failure("$e");
    }
  }

  Future<void> updatePaymentToDB(List<PaymentModel> paymentModelList) async {
    final paymentModelListMap = getPaymentListJson(paymentModelList);
    debugPrint("paymentModelListMap: $paymentModelListMap");
    await storage.setItem("payments", paymentModelListMap);
  }

  Future<void> deletePayment(PaymentModel paymentModel) async {
    final datas = getAllPayment();
    datas.remove(paymentModel);
    await updatePaymentToDB(datas);
  }

  Future<void> updatePayment(PaymentModel paymentModel) async {
    final billsList = getAllPayment();
    final datas =
        billsList.where((element) => element.id == paymentModel.id).toList();
    final index = billsList.indexOf(datas[0]);
    billsList[index] = paymentModel;
    updatePaymentToDB(billsList);
  }

  PaymentModel? getPaymentModelById(String id) {
    final datas = getAllPayment().where((element) => element.id == id).toList();
    try {
      if (datas.isEmpty) {
        return null;
      }
      return datas.first;
    } catch (e) {
      return null;
    }
  }

  List<PaymentModel> getPaymentByPurchaseID(String purchaseID) {
    return getAllPayment()
        .where((element) => element.purchaseId == purchaseID)
        .toList();
  }

  Future<void> resetPayments() async {
    await storage.setItem("payments", []);
  }

  Future<void> update() async {
    final datas = getAllPayment();
    final List<Map<String, dynamic>> datasJson = [];
    for (final item in datas) {
      datasJson.add(item.toJson());
      final jsonData = item.toJson();
      jsonData["advanceAmount"] = 0;
      await updatePayment(PaymentModel.fromJson(jsonData));
    }
    for (final item in datasJson) {
      item['advanceAmount'] = 0;
    }
  }

  List<PaymentModel> getPaymentByDate(DateTime startDate, DateTime endDate) {
    final List<PaymentModel> receipts = [];

    final startEndDiff = endDate.difference(startDate).inDays;

    for (final item in getAllPayment()) {
      debugPrint("${endDate.difference(item.createdAt).inDays}");
      final dateDiff = endDate.difference(item.createdAt).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        receipts.add(item);
      }
    }
    return receipts;
  }
}
