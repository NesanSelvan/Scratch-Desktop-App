import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';

import '../../../models/company/company.dart';
import '../../../models/failure/failure.dart';

class CompanyDB {
  final storage = Database().storage;
  List<CompanyModel> getAllCompany() {
    try {
      final data = Database().storage.getItem('company');
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
    await Database().storage.setItem("company", []);
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

  CompanyModel getCompanyById(String id) {
    return getAllCompany().where((element) => element.id == id).toList()[0];
  }
}
