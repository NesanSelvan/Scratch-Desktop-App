import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';

import '../../../models/bank/bank.dart';
import '../../../models/failure/failure.dart';

class BankDB {
  final storage = Database().storage;
  List<BankModel> getAllBank() {
    try {
      final data = Database().storage.getItem('banks');
      debugPrint("Bank List by ID : $data");

      final List<BankModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          // debugPrint('BankModel Item: $item');
          datas.add(BankModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Bank Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> clearAll() async {
    await Database().storage.setItem("banks", []);
  }

  Future<String> checkAndAddBank(BankModel bankModel) async {
    final bankList = getAllBank();
    final matchedData = bankList
        .where(
          (element) =>
              element.bankName == bankModel.bankName &&
              element.accountNo == bankModel.accountNo &&
              element.bankHolderName == bankModel.bankHolderName &&
              element.branch == bankModel.branch,
        )
        .toList();

    if (matchedData.isEmpty) {
      await addBankToDb(bankModel);
      return bankModel.id;
    }
    return matchedData.first.id;
  }

  Future<void> addBankToDb(BankModel bankModel) async {
    try {
      final datas = [...getAllBank(), bankModel];

      await updateBankToDB(datas);
    } catch (e) {
      throw Failure("$e");
    }
  }

  Future<void> updateBankToDB(List<BankModel> pathsList) async {
    final bankListMap = getBanksListJson(pathsList);
    debugPrint("$bankListMap");
    await storage.setItem("banks", bankListMap);
  }

  Future<void> deleteBank(BankModel bankModel) async {
    final datas = getAllBank();
    datas.remove(bankModel);
    await updateBankToDB(datas);
  }

  Future<void> updateBank(BankModel bankModel) async {
    final banksList = getAllBank();
    final datas =
        banksList.where((element) => element.id == bankModel.id).toList();
    final index = banksList.indexOf(datas[0]);
    banksList[index] = bankModel;
    await updateBankToDB(banksList);
  }

  BankModel? getBankModelById(String id) {
    final bankList = getAllBank().where((element) => element.id == id).toList();
    debugPrint("Bank List by ID : $bankList ID : $id");
    if (bankList.isEmpty) {
      return null;
    }
    return getAllBank().where((element) => element.id == id).toList().first;
  }

  Future<void> resetBank() async {
    await storage.setItem("banks", []);
  }
}
