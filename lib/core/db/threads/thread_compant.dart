import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/models/threads/company/thread_company.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThreadCompanyDB {
  final storage = Database().storage;

  List<ThreadCompanyModel> getAllThreadCompanys() {
    try {
      final data = storage.getItem('threads');
      debugPrint('Thread Company Item: $data');

      final List<ThreadCompanyModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          debugPrint('Thread Company Item: $item');
          datas.add(ThreadCompanyModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Thread Company Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> clearAll() async {
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
        "All your threads record will get cleared", onYesTap: () async {
      if (empType == PersonEnum.SoftwareOwner)
        await Database().storage.setItem("threads", []);
      else
        CustomUtilies.customFailureSnackBar(
            "You cannot delete", "Please contact the administrator");
    });
  }

  Future<void> addThreadCompanyToDb(ThreadCompanyModel stockModel) async {
    final datas = [...getAllThreadCompanys(), stockModel];
    await updateThreadCompanyToDB(datas);
  }

  Future<void> updateThreadCompanyToDB(
      List<ThreadCompanyModel> stockModelList) async {
    final unitModelListMap = getThreadCompanyListJson(stockModelList);
    await storage.setItem("threads", unitModelListMap);
  }

  Future<void> deleteThreadCompany(ThreadCompanyModel stockModel) async {
    final datas = getAllThreadCompanys();
    datas.remove(stockModel);
    updateThreadCompanyToDB(datas);
  }

  Future<void> updateThreadCompany(ThreadCompanyModel stockModel) async {
    final stockList = getAllThreadCompanys();
    final datas =
        stockList.where((element) => element.id == stockModel.id).toList();
    if (datas.isNotEmpty) {
      final index = stockList.indexOf(datas[0]);
      stockList[index] = stockModel;
      await updateThreadCompanyToDB(stockList);
      return;
    }
    CustomUtilies.customFailureSnackBar("Error", "Thread Company not updated");
  }

  ThreadCompanyModel getThreadCompanyModelById(String id) {
    return getAllThreadCompanys()
        .where((element) => element.id == id)
        .toList()[0];
  }

  ThreadCompanyModel? getThreadCompanyModelByCompanyAndProductId(
      String companyId, String productId) {
    try {
      // debugPrint("Exists Check : $companyId $productId");
      // debugPrint("Exists Check : ${getAllThreadCompanys().where((element) {
      //   debugPrint("Exists Check : ${element.companyModel.id}");
      //   debugPrint("Exists Check : ${element.threadProduct.product.id}");
      //   return element.companyModel.id == companyId &&
      //       element.threadProduct.product.id == productId;
      // }).toList()}");
      return getAllThreadCompanys()
          .where(
            (element) =>
                element.companyModel.id == companyId &&
                element.threadProduct.product.id == productId,
          )
          .toList()[0];
    } catch (e) {
      return null;
    }
  }
}
