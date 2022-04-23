import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:flutter/material.dart';

class PurchaseDB {
  final storage = Database().storage;

  Future clearAll() async {
    await Database().storage.setItem("purchases", []);
  }

  List<PurchaseModel> getAllPurchase() {
    final data = Database().storage.getItem('purchases');
    // debugPrint('Purchase Item: $data');

    final List<PurchaseModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('PurchaseModel Item: $item');
        datas.add(PurchaseModel.fromJson(item as Map<String, dynamic>));
      }
    }
    return datas;
  }

  List<PurchaseModel> getPurchaseBillByCompanyId(String companyId) {
    final data = Database().storage.getItem('purchases');
    // debugPrint('Purchase Item: $data');

    final List<PurchaseModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('PurchaseModel Item: $item');
        final purchaseModel =
            PurchaseModel.fromJson(item as Map<String, dynamic>);
        if (purchaseModel.companyModel.id == companyId) {
          datas.add(purchaseModel);
        }
      }
    }
    return datas;
  }

  double getPendingAmountByCompany(String companyId) {
    final purchaseBills = getPurchaseBillByCompanyId(companyId);
    double pendingAmount = 0;
    for (final purchaseBill in purchaseBills) {
      double totalGivenAmount = 0;
      for (final paymentId in purchaseBill.paymentsIdList) {
        // ignore: avoid_dynamic_calls
        final paymentModel = paymentDB.getPaymentModelById(paymentId);
        if (paymentModel != null) {
          totalGivenAmount += paymentModel.givenAmount;
        }
      }
      pendingAmount += purchaseBill.grandTotal - totalGivenAmount;
    }
    return pendingAmount;
  }

  Future<void> addPurchaseToDb(PurchaseModel purchaseModel) async {
    debugPrint("This Purchase Details : $purchaseModel");
    try {
      final purchaseModelList = getAllPurchase();
      // final matchedPurchase = purchaseModelList
      //     .where((element) => element.quotationNo == purchaseModel.quotationNo)
      //     .toList();
      // if (matchedPurchase.isNotEmpty) {
      //   throw Failure(
      //       "Purchase with same Purchase No ${purchaseModel.quotationNo} Already Exists !");
      // }
      final datas = [...purchaseModelList, purchaseModel];
      await updatePurchaseToDB(datas);
    } catch (e) {
      debugPrint("error : $e");
      throw Failure("$e");
    }
  }

  Future<void> updatePurchaseToDB(List<PurchaseModel> purchaseModelList) async {
    final purchaseModelListMap = getPurchaseListJson(purchaseModelList);
    debugPrint("purchaseModelListMap: $purchaseModelListMap");
    await storage.setItem("purchases", purchaseModelListMap);
  }

  Future<void> deletePurchase(PurchaseModel purchaseModel) async {
    final datas = getAllPurchase();
    datas.remove(purchaseModel);
    updatePurchaseToDB(datas);
  }

  Future<void> updatePurchase(PurchaseModel purchaseModel) async {
    final billsList = getAllPurchase();
    final datas =
        billsList.where((element) => element.id == purchaseModel.id).toList();
    final index = billsList.indexOf(datas[0]);
    billsList[index] = purchaseModel;
    updatePurchaseToDB(billsList);
  }

  PurchaseModel? getPurchaseModelById(String id) {
    final data = getAllPurchase().where((element) => element.id == id).toList();
    if (data.isEmpty) {
      return null;
    }
    return getAllPurchase().where((element) => element.id == id).toList()[0];
  }

  Future<void> resetPurchase() async {
    await storage.setItem("purchases", []);
  }

  List<PurchaseModel> getBillByDate(DateTime startDate, DateTime endDate) {
    final List<PurchaseModel> bills = [];
    debugPrint("${endDate.difference(startDate).inDays}");
    final startEndDiff = endDate.difference(startDate).inDays;
    for (final item in getAllPurchase()) {
      debugPrint("${endDate.difference(item.dateTime).inDays}");
      final dateDiff = endDate.difference(item.dateTime).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        bills.add(item);
      }
    }
    return bills;
  }

  List<PurchaseModel> getBillByDateAndCompany(
      DateTime startDate, DateTime endDate, CompanyModel companyModel) {
    final List<PurchaseModel> bills = [];
    debugPrint("${endDate.difference(startDate).inDays}");
    final startEndDiff = endDate.difference(startDate).inDays;
    for (final item in getAllPurchase()) {
      debugPrint("${endDate.difference(item.dateTime).inDays}");
      final dateDiff = endDate.difference(item.dateTime).inDays;
      if (dateDiff <= startEndDiff && dateDiff >= 0) {
        if (item.companyModel.id == companyModel.id) {
          bills.add(item);
        }
      }
    }
    return bills;
  }
}
