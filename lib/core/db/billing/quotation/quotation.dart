import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/failure/failure.dart';
import '../../../../models/quotations/quotations.dart';

class QuotationDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
        "All your quotations record will get cleared", onYesTap: () async {
      if (empType == PersonEnum.SoftwareOwner)
        await Database().storage.setItem("quotations", []);
      else
        CustomUtilies.customFailureSnackBar(
            "You cannot delete", "Please contact the administrator");
    });
  }

  List<QuotationModel> getAllQuotation() {
    final data = Database().storage.getItem('quotations');
    // debugPrint('Quotation Item: $data');

    final List<QuotationModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('QuotationModel Item: $item');
        datas.add(QuotationModel.fromJson(item as Map<String, dynamic>));
      }
    }
    try {
      datas.sort((b, a) {
        return int.parse(a.quotationNo.split("/").first)
            .compareTo(int.parse(b.quotationNo.split("/").first));
      });
    } catch (e) {}
    return datas;
  }

  Future<void> addQuotationToDb(QuotationModel billModel) async {
    debugPrint("This Quotation Details : $billModel");
    try {
      // final _billModelList = getAllQuotation();
      // final datas = [..._billModelList, billModel];
      // debugPrint("Datas : $datas");
      // await updateQuotationToDB(datas);

      final billModelList = getAllQuotation();
      final matchedQuotation = billModelList
          .where((element) => element.quotationNo == billModel.quotationNo)
          .toList();
      if (matchedQuotation.isNotEmpty) {
        throw Failure(
          "Quotation with same Quotation No ${billModel.quotationNo} Already Exists !",
        );
      }
      final datas = [...billModelList, billModel];
      await updateQuotationToDB(datas);
    } catch (e) {
      debugPrint("error : $e");
      throw Failure("$e");
    }
  }

  Future<void> updateQuotationToDB(List<QuotationModel> billModelList) async {
    final billModelListMap = getQuotationListJson(billModelList);
    debugPrint("billModelListMap: $billModelListMap");
    await storage.setItem("quotations", billModelListMap);
  }

  Future<void> deleteQuotation(QuotationModel billModel) async {
    final datas = getAllQuotation();
    datas.remove(billModel);
    updateQuotationToDB(datas);
  }

  Future<void> updateQuotation(QuotationModel billModel) async {
    final billsList = getAllQuotation();
    final datas =
        billsList.where((element) => element.id == billModel.id).toList();
    final index = billsList.indexOf(datas[0]);
    billsList[index] = billModel;
    updateQuotationToDB(billsList);
  }

  QuotationModel getQuotationModelById(String id) {
    return getAllQuotation().where((element) => element.id == id).toList()[0];
  }

  Future<void> resetQuotation() async {
    clearAll();
    // await storage.setItem("quotations", []);
  }
}
