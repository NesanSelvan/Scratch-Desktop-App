import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:annai_store/models/receipts/receipt.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiptDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
      "All your receipts record will get cleared",
      onYesTap: () async {
        if (empType == PersonEnum.SoftwareOwner) {
          await Database().storage.setItem("receipts", []);
        } else {
          CustomUtilies.customFailureSnackBar(
            "You cannot delete",
            "Please contact the administrator",
          );
        }
      },
    );
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
    try {
      datas.sort((b, a) {
        return int.parse(b.receiptNo.split("/").first)
            .compareTo(int.parse(a.receiptNo.split("/").first));
      });
    } catch (e) {}
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
    clearAll();
    // await storage.setItem("receipts", []);
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

  List<ReceiptModel> getBillByPreviousDateAndCustomer(
    DateTime startDate,
    String customerId,
  ) {
    final List<ReceiptModel> receipts = [];
    for (final item in getAllReceipt()
        .where((element) => element.customerModel.id == customerId)
        .toList()) {
      final diff = item.createdAt.difference(startDate);
      if (diff.inHours < 0) {
        receipts.add(item);
      }
    }
    return receipts;
  }

  List<ReceiptModel> getBillByStartDateAndCustomer(
    DateTime startDate,
    String customerId,
  ) {
    final List<ReceiptModel> receipts = [];
    final finalStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);
    for (final item in getAllReceipt()
        .where((element) => element.customerModel.id == customerId)
        .toList()) {
      final diff = item.createdAt.difference(finalStartDate);
      print(diff.inDays);

      if (diff.inDays > 0) {
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
    final finalStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);
    final finalEndDate = DateTime(endDate.year, endDate.month, endDate.day);
    final List<ReceiptModel> receipts = [];

    final startEndDiff = finalEndDate.difference(finalStartDate).inDays;

    for (final item in getAllReceipt()
        .where((element) => element.customerModel.id == customerId)
        .toList()) {
      final finalDateTime = DateTime(
        item.createdAt.year,
        item.createdAt.month,
        item.createdAt.day,
      );
      final dateDiff = finalEndDate.difference(finalDateTime).inDays;

      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        receipts.add(item);
      }
    }
    return receipts;
  }
}
