import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../../../../models/customer/customer.dart';
import '../../../../models/failure/failure.dart';
import '../../../../models/sewing_service/sewing_service.dart';

class SewingServicesDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    await Database().storage.setItem("sewing_service", []);
  }

  List<SewingService> getAllSewingService() {
    final data = Database().storage.getItem('sewing_service');
    // debugPrint('SewingService Item: $data');

    final List<SewingService> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('SewingService Item: $item');
        datas.add(SewingService.fromJson(item as Map<String, dynamic>));
      }
    }

    datas.sort((b, a) {
      return int.parse(a.billNo.split("/").first)
          .compareTo(int.parse(b.billNo.split("/").first));
    });
    return datas;
  }

  Future<void> addSewingServiceToDb(SewingService sewingService) async {
    debugPrint("This SewingService Details : $sewingService");
    try {
      // final _billModelList = getAllSewingService();
      // final datas = [..._billModelList, sewingService];
      // debugPrint("Datas : $datas");
      // await updateSewingServiceToDB(datas);

      final billModelList = getAllSewingService();
      final matchedSewingService = billModelList
          .where((element) => element.billNo == sewingService.billNo)
          .toList();
      if (matchedSewingService.isNotEmpty) {
        throw Failure(
          "SewingService with same SewingService No ${sewingService.billNo} Already Exists !",
        );
      }
      final datas = [...billModelList, sewingService];
      await updateSewingServiceToDB(datas);
    } catch (e) {
      debugPrint("error : $e");
      throw Failure("$e");
    }
  }

  Future<void> updateSewingServiceToDB(
      List<SewingService> billModelList) async {
    final billModelListMap = getSewingServiceListJson(billModelList);
    debugPrint("billModelListMap: $billModelListMap");
    await storage.setItem("sewing_service", billModelListMap);
  }

  Future<void> deleteSewingService(SewingService sewingService) async {
    final datas = getAllSewingService();
    datas.remove(sewingService);
    updateSewingServiceToDB(datas);
  }

  Future<void> updateSewingService(SewingService sewingService) async {
    final billsList = getAllSewingService();
    final datas =
        billsList.where((element) => element.id == sewingService.id).toList();
    final index = billsList.indexOf(datas[0]);
    billsList[index] = sewingService;
    await updateSewingServiceToDB(billsList);
  }

  SewingService getSewingServiceModelById(String id) {
    return getAllSewingService()
        .where((element) => element.id == id)
        .toList()[0];
  }

  Future<void> resetSales() async {
    await storage.setItem("sewing_service", []);
  }

  List<SewingService> getSewingServiceByDate(
      DateTime startDate, DateTime endDate) {
    final List<SewingService> bills = [];
    debugPrint("${endDate.difference(startDate).inDays}");
    final startEndDiff = endDate.difference(startDate).inDays;
    for (final item in getAllSewingService()) {
      debugPrint("${endDate.difference(item.dateTime).inDays}");
      final dateDiff = endDate.difference(item.dateTime).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        bills.add(item);
      }
    }
    return bills;
  }

  List<SewingService> getTodaysSewingService() {
    final List<SewingService> bills = [];

    for (final item in getAllSewingService()) {
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

  List<SewingService> getSewingServiceByDateAndCustomer(
      DateTime startDate, DateTime endDate, CustomerModel customerModel) {
    final List<SewingService> bills = [];
    debugPrint("${endDate.difference(startDate).inDays}");
    final startEndDiff = endDate.difference(startDate).inDays;
    for (final item in getAllSewingService()) {
      debugPrint("${endDate.difference(item.dateTime).inDays}");
      final dateDiff = endDate.difference(item.dateTime).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        if (item.customerModel?.id == customerModel.id) {
          bills.add(item);
        }
      }
    }
    return bills;
  }
}
