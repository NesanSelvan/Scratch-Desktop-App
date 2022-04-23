import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../models/failure/failure.dart';

class CategoryController extends GetxController {
  List<CategoryModel> categoryModelList =
      Database().categoryDB.getAllCategory();
  final hsnController = TextEditingController();
  final catSymbolController = TextEditingController();
  final categoryController = TextEditingController();
  final taxController = TextEditingController();
  final searchController = TextEditingController();
  final categoryDb = Database().categoryDB;

  final symbolNode = FocusNode();
  final hsnCodeNode = FocusNode();
  final catNode = FocusNode();
  final taxNode = FocusNode();

  @override
  void onInit() {
    Database().initialize();
    getAllCategory();
    super.onInit();
  }

  void getAllCategory() {
    Database().initialize();
    categoryModelList = Database().categoryDB.getAllCategory();
    update();
  }

  Future<void> addCategory() async {
    try {
      await categoryDb.addCategoryToDb(
        CategoryModel(
          id: const Uuid().v1(),
          hsnCode: int.parse(hsnController.text),
          category: categoryController.text,
          tax: double.parse(taxController.text),
          dateTime: DateTime.now(),
        ),
      );
      clearTextField();
      getAllCategory();
      hsnCodeNode.requestFocus();
    } catch (e) {
      debugPrint('Error : $e');
      CustomUtilies.customFailureSnackBar("Error in Adding Category", "$e");
    }
  }

  CategoryModel? selectedCategoryModel;

  void setSelectedCategoryModel(CategoryModel? categoryModel) {
    selectedCategoryModel = categoryModel;
    update();
  }

  Failure? failure;

  Future<void> deleteCategory() async {
    if (selectedCategoryModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Delete Unsuccessfull",
        "Please Select a Category to Delete",
      );
    } else {
      if (await deleteSelectedCategory()) {
        CustomUtilies.customSuccessSnackBar(
          "Delete SuccessFull",
          "Category Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Delete Unsuccessfull", "$failure");
      }
    }
  }

  Future<bool> deleteSelectedCategory() async {
    try {
      await categoryDb.deleteCategory(selectedCategoryModel!);
      getAllCategory();
      selectedCategoryModel = null;
      clearTextField();
      return true;
    } catch (e) {
      failure = Failure("$e");
      update();
      return false;
    }
  }

  Future<void> updateCategory() async {
    if (selectedCategoryModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Update Unsuccessfull",
        "Please Select a Category to Update",
      );
    } else {
      if (await updateSelectedCategory(
        selectedCategoryModel!.copyWith(
          hsnCode: int.parse(hsnController.text),
          category: categoryController.text,
          tax: double.parse(taxController.text),
          dateTime: DateTime.now(),
        ),
      )) {
        CustomUtilies.customSuccessSnackBar(
          "Update SuccessFull",
          "Category Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Update Unsuccessfull", "$failure");
      }
      clearTextField();
    }
  }

  Future<bool> updateSelectedCategory(CategoryModel categoryModel) async {
    try {
      final datas = categoryModelList
          .where((element) => element.id == categoryModel.id)
          .toList();
      if (datas.isEmpty) {
        failure = Failure("No Category Match");
        update();
        return false;
      }
      await categoryDb.updateCategory(categoryModel);
      getAllCategory();
      selectedCategoryModel = null;
      return true;
    } catch (e) {
      failure = Failure("$e");
      return false;
    }
  }

  List<CategoryModel> searchedCategoryModel = [];

  void searchUnit(String text) {
    searchedCategoryModel.clear();
    final datas = categoryModelList.where((element) {
      return element.hsnCode
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          element.tax.toString().toLowerCase().contains(text.toLowerCase()) ||
          element.category.toLowerCase().contains(text.toLowerCase());
    }).toList();
    searchedCategoryModel = datas;
    update();
  }

  void clearTextField() {
    hsnController.clear();
    categoryController.clear();
    taxController.clear();
    searchController.clear();
    hsnCodeNode.requestFocus();
    update();
  }

  void onCategoryTap(CategoryModel e) {
    setSelectedCategoryModel(e);
    hsnController.text = e.hsnCode.toString();
    categoryController.text = e.category;
    taxController.text = e.tax.toString();
  }

  void handleKeyDown() {
    if (selectedCategoryModel == null) {
      onCategoryTap(categoryModelList.first);
    } else {
      if (selectedCategoryModel == categoryModelList.last) {
        onCategoryTap(categoryModelList.first);
      } else {
        onCategoryTap(
          categoryModelList[
              categoryModelList.indexOf(selectedCategoryModel!) + 1],
        );
      }
    }
  }

  void handleKeyUp() {
    if (selectedCategoryModel == null) {
      onCategoryTap(categoryModelList.first);
    } else {
      if (selectedCategoryModel == categoryModelList.first) {
        onCategoryTap(categoryModelList.last);
      } else {
        onCategoryTap(
          categoryModelList[
              categoryModelList.indexOf(selectedCategoryModel!) - 1],
        );
      }
    }
  }

  List<LogicalKeyboardKey> clickedKeys = [];

  void updateKeys(LogicalKeyboardKey logicalKeyboardKey) {
    if (!clickedKeys.contains(logicalKeyboardKey)) {
      clickedKeys.add(logicalKeyboardKey);
    }
  }

  void performKeyboardClickedAction() {
    if (clickedKeys[0] == LogicalKeyboardKey.arrowDown) {
      handleKeyDown();
    } else if (clickedKeys[0] == LogicalKeyboardKey.arrowUp) {
      debugPrint('Up key ');
      handleKeyUp();
    } else if (clickedKeys[0] == LogicalKeyboardKey.delete) {
      // deleteCategory();
      CustomUtilies.customSnackBar(
        "You cannot delete a Category",
        Colors.yellow,
        Colors.white,
        "You can Hide a Category",
        const Icon(Icons.delete),
      );
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyC)) {
      clearTextField();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyU)) {
      updateCategory();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyR)) {
      getAllCategory();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyA)) {
      addCategory();
    }
    clickedKeys.clear();
  }
}
