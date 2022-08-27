import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/failure/failure.dart';
import '../../../../models/voucher/voucher.dart';

class VoucherDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
        "All your vouchers record will get cleared", onYesTap: () async {
      if (empType == PersonEnum.SoftwareOwner)
        await Database().storage.setItem("vouchers", []);
      else
        CustomUtilies.customFailureSnackBar(
            "You cannot delete", "Please contact the administrator");
    });
  }

  List<VoucherModel> getAllVoucher() {
    final data = Database().storage.getItem('vouchers');
    // debugPrint('Voucher Item: $data');

    final List<VoucherModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('VoucherModel Item: $item');
        datas.add(VoucherModel.fromJson(item as Map<String, dynamic>));
      }
    }
    try {
      datas.sort((b, a) {
        return int.parse(a.voucherNo.split("/").first)
            .compareTo(int.parse(b.voucherNo.split("/").first));
      });
    } catch (e) {}
    return datas;
  }

  Future<void> addVoucherToDb(VoucherModel voucherModel) async {
    debugPrint("This Voucher Details : $voucherModel");
    try {
      // final _receiptModelList = getAllVoucher();
      // final datas = [..._receiptModelList, voucherModel];
      // debugPrint("Datas : $datas");
      // await updateVoucherToDB(datas);

      final voucherModelList = getAllVoucher();
      final matchedVoucher = voucherModelList
          .where((element) => element.voucherNo == voucherModel.voucherNo)
          .toList();
      if (matchedVoucher.isNotEmpty) {
        throw Failure(
          "Voucher with same Voucher No ${voucherModel.voucherNo} Already Exists !",
        );
      }
      final datas = [...voucherModelList, voucherModel];
      await updateVoucherToDB(datas);
    } catch (e) {
      debugPrint("error : $e");
      throw Failure("$e");
    }
  }

  Future<void> updateVoucherToDB(List<VoucherModel> voucherModelList) async {
    final receiptModelListMap = getVoucherListJson(voucherModelList);
    debugPrint("receiptModelListMap: $receiptModelListMap");
    await storage.setItem("vouchers", receiptModelListMap);
  }

  Future<void> deleteVoucher(VoucherModel voucherModel) async {
    final datas = getAllVoucher();
    datas.remove(voucherModel);
    updateVoucherToDB(datas);
  }

  Future<void> updateVoucher(VoucherModel voucherModel) async {
    final billsList = getAllVoucher();
    final datas =
        billsList.where((element) => element.id == voucherModel.id).toList();
    final index = billsList.indexOf(datas[0]);
    billsList[index] = voucherModel;
    updateVoucherToDB(billsList);
  }

  VoucherModel getVoucherModelById(String id) {
    return getAllVoucher().where((element) => element.id == id).toList()[0];
  }

  Future<void> resetVouchers() async {
    clearAll();
    // await storage.setItem("vouchers", []);
  }

  Future<void> update() async {
    final datas = getAllVoucher();
    final List<Map<String, dynamic>> datasJson = [];
    for (final item in datas) {
      datasJson.add(item.toJson());
      final jsonData = item.toJson();
      jsonData["advanceAmount"] = 0;
      await updateVoucher(VoucherModel.fromJson(jsonData));
    }
    for (final item in datasJson) {
      item['advanceAmount'] = 0;
    }
  }
}
