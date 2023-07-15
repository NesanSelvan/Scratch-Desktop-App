import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/models/estimate/estimate.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
      "All your estimate record will get cleared",
      onYesTap: () async {
        if (empType == PersonEnum.SoftwareOwner) {
          await Database().storage.setItem("estimates", []);
        } else {
          CustomUtilies.customFailureSnackBar(
            "You cannot delete",
            "Please contact the administrator",
          );
        }
      },
    );
  }

  List<EstimateModel> getAllEstimate() {
    final data = Database().storage.getItem('estimates');
    // debugPrint('Estimate Item: $data');

    final List<EstimateModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('EstimateModel Item: $item');
        datas.add(EstimateModel.fromJson(item as Map<String, dynamic>));
      }
    }
    return datas;
  }

  Future<void> addEstimateToDb(EstimateModel estimateModel) async {
    debugPrint("This Estimate Details : $EstimateModel");
    try {
      // final _billModelList = getAllEstimate();
      // final datas = [..._billModelList, EstimateModel];
      // debugPrint("Datas : $datas");
      // await updateEstimateToDB(datas);

      final billModelList = getAllEstimate();
      final matchedEstimate = billModelList
          .where((element) => element.estimateNo == estimateModel.estimateNo)
          .toList();
      if (matchedEstimate.isNotEmpty) {
        throw Failure(
          "Estimate with same Estimate No ${estimateModel.estimateNo} Already Exists !",
        );
      }
      final datas = [...billModelList, estimateModel];
      await updateEstimateToDB(datas);
    } catch (e) {
      debugPrint("error : $e");
      throw Failure("$e");
    }
  }

  Future<void> updateEstimateToDB(List<EstimateModel> billModelList) async {
    final billModelListMap = getEstimateListJson(billModelList);
    debugPrint("billModelListMap: $billModelListMap");
    await storage.setItem("estimates", billModelListMap);
  }

  Future<void> deleteEstimate(EstimateModel estimateModel) async {
    final datas = getAllEstimate();
    final estimate =
        datas.where((element) => element.id == estimateModel.id).toList();
    debugPrint("Came Estimate: $estimateModel");
    debugPrint("Existng Estimate: $datas");
    debugPrint("Estimate: $estimate");

    if (estimate.isNotEmpty) {
      datas.remove(estimate[0]);
      await updateEstimateToDB(datas);
    }
  }

  Future<void> updateEstimate(EstimateModel estimateModel) async {
    final billsList = getAllEstimate();
    final datas =
        billsList.where((element) => element.id == estimateModel.id).toList();
    final index = billsList.indexOf(datas[0]);
    billsList[index] = estimateModel;
    await updateEstimateToDB(billsList);
  }

  EstimateModel getEstimateModelById(String id) {
    return getAllEstimate().where((element) => element.id == id).toList()[0];
  }

  Future<void> resetEstimate() async {
    clearAll();
    // await storage.setItem("estimates", []);
  }
}
