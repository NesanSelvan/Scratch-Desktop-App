import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';

import '../../../../models/failure/failure.dart';
import '../../../../models/receipts/receipt.dart';

class ReceiptDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    await Database().storage.setItem("receipts", []);
  }

  List<ReceiptModel> getAllReceipt() {
    final data = Database().storage.getItem('receipts');
    // debugPrint('Receipt Item: $data');

    final List<ReceiptModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('ReceiptModel Item: $item');
        datas.add(ReceiptModel.fromJson(item as Map<String, dynamic>));
      }
    }
    return datas.reversed.toList();
  }

  Future<void> addReceiptToDb(ReceiptModel receiptModel) async {
    debugPrint("This Receipt Details : $receiptModel");
    try {
      // final _receiptModelList = getAllReceipt();
      // final datas = [..._receiptModelList, receiptModel];
      // debugPrint("Datas : $datas");
      // await updateReceiptToDB(datas);

      final receiptModelList = getAllReceipt();
      final matchedReceipt = receiptModelList
          .where((element) => element.receiptNo == receiptModel.receiptNo)
          .toList();
      if (matchedReceipt.isNotEmpty) {
        throw Failure(
          "Receipt with same Receipt No ${receiptModel.receiptNo} Already Exists !",
        );
      }
      final datas = [...receiptModelList, receiptModel];
      await updateReceiptToDB(datas);
    } catch (e) {
      debugPrint("error : $e");
      throw Failure("$e");
    }
  }

  Future<void> updateReceiptToDB(List<ReceiptModel> receiptModelList) async {
    final receiptModelListMap = getReceiptListJson(receiptModelList);
    debugPrint("receiptModelListMap: $receiptModelListMap");
    await storage.setItem("receipts", receiptModelListMap);
  }

  Future<void> deleteReceipt(ReceiptModel receiptModel) async {
    final datas = getAllReceipt();
    datas.remove(receiptModel);
    updateReceiptToDB(datas);
  }

  Future<void> updateReceipt(ReceiptModel receiptModel) async {
    final billsList = getAllReceipt();
    final datas =
        billsList.where((element) => element.id == receiptModel.id).toList();
    final index = billsList.indexOf(datas[0]);
    billsList[index] = receiptModel;
    updateReceiptToDB(billsList);
  }

  ReceiptModel getReceiptModelById(String id) {
    return getAllReceipt().where((element) => element.id == id).toList()[0];
  }

  Future<void> resetReceipts() async {
    await storage.setItem("receipts", []);
  }

  Future<void> update() async {
    final datas = getAllReceipt();
    final List<Map<String, dynamic>> datasJson = [];
    for (final item in datas) {
      datasJson.add(item.toJson());
      final jsonData = item.toJson();
      jsonData["advanceAmount"] = 0;
      await updateReceipt(ReceiptModel.fromJson(jsonData));
    }
    for (final item in datasJson) {
      item['advanceAmount'] = 0;
    }
  }

  List<ReceiptModel> getReceiptByDate(DateTime startDate, DateTime endDate) {
    final List<ReceiptModel> receipts = [];

    final startEndDiff = endDate.difference(startDate).inDays;

    for (final item in getAllReceipt()) {
      debugPrint("${endDate.difference(item.createdAt).inDays}");
      final dateDiff = endDate.difference(item.createdAt).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        receipts.add(item);
      }
    }
    return receipts;
  }

  List<ReceiptModel> getReceiptByDateAndCustomerId(
    DateTime startDate,
    DateTime endDate,
    String customerId,
  ) {
    final List<ReceiptModel> receipts = [];

    final startEndDiff = endDate.difference(startDate).inDays;

    for (final item in getAllReceipt()
        .where((element) => element.customerModel.id == customerId)
        .toList()) {
      debugPrint("${endDate.difference(item.createdAt).inDays}");
      final dateDiff = endDate.difference(item.createdAt).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        receipts.add(item);
      }
    }
    return receipts;
  }
}
