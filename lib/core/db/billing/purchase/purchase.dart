import 'dart:developer';

import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseDB {
  final storage = Database().storage;

  Future clearAll() async {
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
      "All your Purchases record will get cleared",
      onYesTap: () async {
        if (empType == PersonEnum.SoftwareOwner) {
          await Database().storage.setItem("purchases", []);
        } else {
          CustomUtilies.customFailureSnackBar(
            "You cannot delete",
            "Please contact the administrator",
          );
        }
      },
    );
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
    return datas.reversed.toList();
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
    try {
      datas.sort((b, a) {
        return int.parse(a.billNo.split("/").first)
            .compareTo(int.parse(b.billNo.split("/").first));
      });
    } catch (e) {}
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
    final comapnyPayment = paymentDB.getPaymentByCompanyId(companyId);
    double givenAmount = 0;
    for (final company in comapnyPayment) {
      givenAmount += company.givenAmount;
    }
    return pendingAmount - givenAmount;
  }

  Future<void> addPurchaseToDb(PurchaseModel purchaseModel) async {
    debugPrint("This Purchase Details : $purchaseModel");
    try {
      final purchaseModelList = getAllPurchase();
      final datas = [...purchaseModelList, purchaseModel];
      await updatePurchaseToDB(datas);
    } catch (e) {
      debugPrint("error : $e");
      throw Failure("$e");
    }
  }

  Future<void> updatePurchaseToDB(List<PurchaseModel> purchaseModelList) async {
    final purchaseModelListMap = getPurchaseListJson(purchaseModelList);
    log("purchaseModelListMap: $purchaseModelListMap");
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
    await updatePurchaseToDB(billsList);
  }

  PurchaseModel? getPurchaseModelById(String id) {
    final data = getAllPurchase().where((element) => element.id == id).toList();
    if (data.isEmpty) {
      return null;
    }
    return getAllPurchase().where((element) => element.id == id).toList()[0];
  }

  Future<void> resetPurchase() async {
    clearAll();
    // await storage.setItem("purchases", []);
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
    DateTime startDate,
    DateTime endDate,
    CompanyModel companyModel,
  ) {
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
