import 'dart:developer';

import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class SalesDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    await Database().storage.setItem("sales", []);
  }

  List<BillModel> getAllBill() {
    final data = Database().storage.getItem('sales');
    // debugPrint('Bill Item: $data');

    final List<BillModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('BillModel Item: $item');
        datas.add(BillModel.fromJson(item as Map<String, dynamic>));
      }
    }

    datas.sort((b, a) {
      return int.parse(a.billNo.split("/").first)
          .compareTo(int.parse(b.billNo.split("/").first));
    });
    return datas;
  }

  Future<void> addBillToDb(BillModel billModel) async {
    debugPrint("This Bill Details : $billModel");
    try {
      // final _billModelList = getAllBill();
      // final datas = [..._billModelList, billModel];
      // debugPrint("Datas : $datas");
      // await updateBillToDB(datas);

      final billModelList = getAllBill();
      final matchedBill = billModelList
          .where((element) => element.billNo == billModel.billNo)
          .toList();
      if (matchedBill.isNotEmpty) {
        throw Failure(
          "Bill with same Bill No ${billModel.billNo} Already Exists !",
        );
      }
      final datas = [...billModelList, billModel];
      await updateBillToDB(datas);
    } catch (e) {
      debugPrint("error : $e");
      throw Failure("$e");
    }
  }

  Future<void> updateBillToDB(List<BillModel> billModelList) async {
    final billModelListMap = getBillListJson(billModelList);
    debugPrint("billModelListMap: $billModelListMap");
    await storage.setItem("sales", billModelListMap);
  }

  Future<void> deleteBill(BillModel billModel) async {
    final datas = getAllBill();
    datas.remove(billModel);
    updateBillToDB(datas);
  }

  Future<void> updateBill(BillModel billModel) async {
    final billsList = getAllBill();
    final datas =
        billsList.where((element) => element.id == billModel.id).toList();
    final index = billsList.indexOf(datas[0]);
    billsList[index] = billModel;
    await updateBillToDB(billsList);
  }

  BillModel getBillModelById(String id) {
    try {
      return getAllBill().where((element) => element.id == id).toList()[0];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetSales() async {
    clearAll();
    // await storage.setItem("sales", []);
  }

  List<BillModel> getBillByDate(DateTime startDate, DateTime endDate) {
    final finalStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);
    final finalEndDate = DateTime(endDate.year, endDate.month, endDate.day);
    final List<BillModel> bills = [];
    final startEndDiff = finalEndDate.difference(finalStartDate).inDays;
    log("startEndDiff $startEndDiff");
    for (final item in getAllBill()) {
      final finalDateTime =
          DateTime(item.dateTime.year, item.dateTime.month, item.dateTime.day);
      final dateDiff = finalEndDate.difference(finalDateTime).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        bills.add(item);
      }
    }
    log("Bills DateTime ${bills.first.dateTime} ${bills.last.dateTime}");
    return bills;
    // final List<BillModel> bills = [];
    // final finalStartDate =
    //     DateTime(startDate.year, startDate.month, startDate.day);
    // final finalEndDate = DateTime(endDate.year, endDate.month, endDate.day);

    // final startEndDiff = finalEndDate.difference(finalStartDate).inDays;
    // for (final item in getAllBill()) {
    //   final dateDiff = finalEndDate.difference(item.dateTime).inDays;
    //   if (dateDiff <= startEndDiff && dateDiff >= 0) {
    //     bills.add(item);
    //   }
    // }
    // return bills;
  }

  List<BillModel> getTodaysBill() {
    final List<BillModel> bills = [];

    for (final item in getAllBill()) {
      if (DateTime(
            item.dateTime.year,
            item.dateTime.month,
            item.dateTime.day,
          ) ==
          DateTime(
            getTodaysDate().year,
            getTodaysDate().month,
            getTodaysDate().day,
          )) {
        bills.add(item);
      }
    }
    return bills;
  }

  List<BillModel> getBillByPreviousDateAndCustomer(
    DateTime startDate,
    String customerId,
  ) {
    print("Hello ${getAllBill().length}");
    final List<BillModel> bills = [];
    for (final item in getAllBill()
        .where((element) => element.customerModel.id == customerId)
        .toList()) {
      // print(item.dateTime);
      final diff = item.dateTime.difference(startDate);
      if (diff.inHours < 0) {
        bills.add(item);
      }
      // log("diff: $diff");
    }
    return bills;
  }

  List<BillModel> getBillByDateAndCustomer(
    DateTime startDate,
    DateTime endDate,
    String customerId,
  ) {
    final finalStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);
    final finalEndDate = DateTime(endDate.year, endDate.month, endDate.day);
    final List<BillModel> bills = [];
    final startEndDiff = finalEndDate.difference(finalStartDate).inDays;
    log("startEndDiff $startEndDiff");
    for (final item in getAllBill()
        .where((element) => element.customerModel.id == customerId)) {
      final finalDateTime =
          DateTime(item.dateTime.year, item.dateTime.month, item.dateTime.day);
      final dateDiff = finalEndDate.difference(finalDateTime).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        if (item.customerModel.id == customerId) {
          log("dateDiff $dateDiff ${item.dateTime} ${item.billNo}");
          bills.add(item);
        }
      }
    }
    // log("Bills DateTime ${bills.first.dateTime} ${bills.last.dateTime}");
    return bills;
  }

  List<BillModel> getBillByDateAndCategory(
    DateTime startDate,
    DateTime endDate,
    String categoryId,
  ) {
    final finalStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);
    final finalEndDate = DateTime(endDate.year, endDate.month, endDate.day);
    final List<BillModel> bills = [];
    final startEndDiff = finalEndDate.difference(finalStartDate).inDays;
    log("startEndDiff $startEndDiff");
    //TODO: Start working from here
    // for (final item in getAllBill()
    //     .where((element) => element.customerModel.id == customerId)) {
    //   final finalDateTime =
    //       DateTime(item.dateTime.year, item.dateTime.month, item.dateTime.day);
    //   final dateDiff = finalEndDate.difference(finalDateTime).inDays;
    //   if (dateDiff <= startEndDiff && dateDiff >= 0) {
    //     if (item.customerModel.id == customerId) {
    //       log("dateDiff $dateDiff ${item.dateTime} ${item.billNo}");
    //       bills.add(item);
    //     }
    //   }
    // }
    // log("Bills DateTime ${bills.first.dateTime} ${bills.last.dateTime}");
    return bills;
  }

  Future<void> fixBillNo() async {
    final allBill = getAllBill();
    final List<BillModel> _updatedBill = [];
    for (final bill in allBill) {
      final billNo = bill.billNo.split("/").first.trim();
      _updatedBill.add(bill.copyWith(billNo: "$billNo / ${getYear()}"));
    }
    await updateBillToDB(_updatedBill);
  }

  Future<void> clearGivenAmount() async {
    final allBill = getAllBill();
    final List<BillModel> _updatedBill = [];
    for (final bill in allBill) {
      _updatedBill.add(bill.copyWith(givenAmount: 0));
    }
    await updateBillToDB(_updatedBill);
  }

  List<BillModel> getBillByStartDateAndCustomer(
    DateTime startDate,
    String customerId,
  ) {
    print("Hello ${getAllBill().length} $customerId");
    final List<BillModel> bills = [];
    final customerBills = getAllBill()
        .where((element) => element.customerModel.id == customerId)
        .toList();
    print("CustomerBills: $customerBills");
    final finalStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);
    for (final item in customerBills) {
      // print(item.dateTime);
      final diff = item.dateTime.difference(finalStartDate);
      print(diff.inDays);

      if (diff.inDays > 0) {
        bills.add(item);
      }
      // log("diff: $diff");
    }
    print("CustomerBills: $bills");

    return bills;
  }
}
