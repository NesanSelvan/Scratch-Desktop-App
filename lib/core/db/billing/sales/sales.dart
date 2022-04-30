import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../../../../models/bill/bill.dart';
import '../../../../models/customer/customer.dart';
import '../../../../models/failure/failure.dart';

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
    return getAllBill().where((element) => element.id == id).toList()[0];
  }

  Future<void> resetSales() async {
    await storage.setItem("sales", []);
  }

  List<BillModel> getBillByDate(DateTime startDate, DateTime endDate) {
    final List<BillModel> bills = [];
    debugPrint("${endDate.difference(startDate).inDays}");
    final startEndDiff = endDate.difference(startDate).inDays;
    for (final item in getAllBill()) {
      debugPrint("${endDate.difference(item.dateTime).inDays}");
      final dateDiff = endDate.difference(item.dateTime).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        bills.add(item);
      }
    }
    return bills;
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

  List<BillModel> getBillByDateAndCustomer(
      DateTime startDate, DateTime endDate, CustomerModel customerModel) {
    final List<BillModel> bills = [];
    debugPrint("${endDate.difference(startDate).inDays}");
    final startEndDiff = endDate.difference(startDate).inDays;
    for (final item in getAllBill()) {
      debugPrint("${endDate.difference(item.dateTime).inDays}");
      final dateDiff = endDate.difference(item.dateTime).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        if (item.customerModel.id == customerModel.id) {
          bills.add(item);
        }
      }
    }
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
}
