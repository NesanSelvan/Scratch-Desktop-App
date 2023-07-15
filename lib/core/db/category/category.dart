import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/category/category.dart';
import '../../../models/failure/failure.dart';

class CategoryDB {
  final storage = Database().storage;
  List<CategoryModel> getAllCategory() {
    try {
      final data = Database().storage.getItem('category');
      // debugPrint('Category Item: $data');

      final List<CategoryModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          // debugPrint('CategoryModel Item: $item');
          datas.add(CategoryModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Unit Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> clearAll() async {
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
        "All your categories record will get cleared", onYesTap: () async {
      if (empType == PersonEnum.SoftwareOwner)
        await Database().storage.setItem("category", []);
      else
        CustomUtilies.customFailureSnackBar(
            "You cannot delete", "Please contact the administrator");
    });
  }

  Future<void> addCategoryToDb(CategoryModel categoryModel) async {
    try {
      final categoryModelList = getAllCategory();
      final matchedCategory = categoryModelList
          .where((element) => element.hsnCode == categoryModel.hsnCode)
          .toList();
      if (matchedCategory.isNotEmpty) {
        throw Failure(
          "Category with same HSN ${categoryModel.hsnCode} Already Exists !",
        );
      }
      final datas = [...getAllCategory(), categoryModel];
      await updateCategoryToDB(datas);
    } catch (e) {
      throw Failure("$e");
    }
  }

  Future<void> updateCategoryToDB(List<CategoryModel> categoryModelList) async {
    final categoryModelListMap = getCategoryListJson(categoryModelList);
    await storage.setItem("category", categoryModelListMap);
  }

  Future<void> deleteCategory(CategoryModel categoryModel) async {
    final datas = getAllCategory();
    datas.remove(categoryModel);
    updateCategoryToDB(datas);
  }

  Future<void> updateCategory(CategoryModel categoryModel) async {
    final categoryList = getAllCategory();
    final datas = categoryList
        .where((element) => element.id == categoryModel.id)
        .toList();
    final index = categoryList.indexOf(datas[0]);
    categoryList[index] = categoryModel;
    await updateCategoryToDB(categoryList);
  }

  CategoryModel getCategoryModelById(String id) {
    return getAllCategory().where((element) => element.id == id).toList().first;
  }
}
