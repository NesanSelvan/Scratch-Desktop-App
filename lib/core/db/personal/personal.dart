import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/company/company.dart';
import '../../../models/failure/failure.dart';

class PersonalCompanyDB {
  final storage = Database().storage;
  List<CompanyModel> getAllCompany() {
    try {
      final data = Database().storage.getItem('personal_company');
      // debugPrint('CUpdated Company Model : $data AS');

      final List<CompanyModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          // debugPrint('CompanyModel Item: $item');
          datas.add(CompanyModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Company Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> clearAll() async {
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
        "All your company record will get cleared", onYesTap: () async {
      if (empType == PersonEnum.SoftwareOwner)
        await Database().storage.setItem("company", []);
      else
        CustomUtilies.customFailureSnackBar(
            "You cannot delete", "Please contact the administrator");
    });
  }

  Future<void> addCompanyToDb(CompanyModel companyModel) async {
    try {
      final companyModelList = getAllCompany();
      final matchedCompany = companyModelList
          .where((element) => element.name == companyModel.name)
          .toList();
      if (matchedCompany.isNotEmpty) {
        throw Failure(
          "Company with same Name ${companyModel.name} Already Exists !",
        );
      }
      final datas = [...getAllCompany(), companyModel];
      await updateCompanyToDB(datas);
    } catch (e) {
      throw Failure("$e");
    }
  }

  Future<void> updateCompanyToDB(List<CompanyModel> companyModelList) async {
    final companyModelListMap = getCompanyListJson(companyModelList);
    debugPrint("Updated Company Model : $companyModelListMap");
    await storage.setItem("company", companyModelListMap);
  }

  Future<void> deleteCompany(CompanyModel companyModel) async {
    final datas = getAllCompany();
    datas.remove(companyModel);
    updateCompanyToDB(datas);
  }

  Future<void> updateCompany(CompanyModel companyModel) async {
    debugPrint("Updated Company Model : $companyModel");
    final companyList = getAllCompany();
    final datas =
        companyList.where((element) => element.id == companyModel.id).toList();
    final index = companyList.indexOf(datas[0]);
    companyList[index] = companyModel;
    debugPrint("Updated Company Model : ${companyList[index]}");
    updateCompanyToDB(companyList);
  }

  CompanyModel getCustomerModelById(String id) {
    return getAllCompany().where((element) => element.id == id).toList()[0];
  }
}
