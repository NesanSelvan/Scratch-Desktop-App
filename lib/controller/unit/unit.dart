import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'package:annai_store/models/failure/failure.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/screens/add/product/product.dart';
import 'package:annai_store/controller/home/home.dart';

class UnitController extends GetxController {
  List<UnitModel> unitModelList = Database().getAllUnits();
  final symbolController = TextEditingController();
  final formalNameController = TextEditingController();
  final searchController = TextEditingController();

  final symbolNode = FocusNode();
  final formalNameNode = FocusNode();

  @override
  void onInit() {
    Database().initialize();
    getAllUnits();
    super.onInit();
  }

  void getAllUnits() {
    Database().initialize();
    unitModelList = Database().getAllUnits();
    update();
  }

  Future<void> addUnit() async {
    await Database().addUnitToDb(
      UnitModel(
        const Uuid().v4(),
        symbolController.text,
        formalNameController.text,
        null,
        DateTime.now(),
      ),
    );
    clearTextField();
    symbolNode.requestFocus();
    getAllUnits();
  }

  UnitModel? selectedUnitModel;

  void setSelectedUnitModel(UnitModel? unitModel) {
    selectedUnitModel = unitModel;
    update();
  }

  Failure? failure;

  Future<void> deleteUnit() async {
    if (selectedUnitModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Delete Unsuccessfull",
        "Please Select a Unit to Delete",
      );
    } else {
      if (await deleteSelectedUnit()) {
        CustomUtilies.customSuccessSnackBar(
          "Delete SuccessFull",
          "Unit Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Delete Unsuccessfull", "$failure");
      }
    }
  }

  Future<bool> deleteSelectedUnit() async {
    try {
      await Database().deleteUnit(selectedUnitModel!);
      getAllUnits();
      selectedUnitModel = null;
      clearTextField();
      return true;
    } catch (e) {
      failure = Failure("$e");
      update();
      return false;
    }
  }

  Future<void> updateUnit() async {
    if (selectedUnitModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Update Unsuccessfull",
        "Please Select a Unit to Update",
      );
    } else {
      if (await updateSelectedUnit(
        UnitModel(
          selectedUnitModel!.id,
          symbolController.text,
          formalNameController.text,
          null,
          DateTime.now(),
        ),
      )) {
        CustomUtilies.customSuccessSnackBar(
          "Update SuccessFull",
          "Unit Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Update Unsuccessfull", "$failure");
      }
      clearTextField();
    }
  }

  Future<bool> updateSelectedUnit(UnitModel unitModel) async {
    try {
      final datas = unitModelList
          .where(
            (element) =>
                element.formalName == unitModel.formalName ||
                element.symbol == unitModel.symbol,
          )
          .toList();
      if (datas.isEmpty) {
        failure = Failure("No Unit Match");
        update();
        return false;
      }
      await Database().updateUnit(unitModel);
      getAllUnits();
      selectedUnitModel = null;
      return true;
    } catch (e) {
      failure = Failure("$e");
      return false;
    }
  }

  List<UnitModel> searchedUnitList = [];

  void searchUnit(String text) {
    searchedUnitList.clear();
    final datas = unitModelList.where((element) {
      return element.symbol!.toLowerCase().contains(text.toLowerCase()) ||
          element.formalName!.toLowerCase().contains(text.toLowerCase());
    }).toList();
    searchedUnitList = datas;
    update();
  }

  void clearTextField() {
    symbolController.clear();
    formalNameController.clear();

    update();
  }

  void onUnitTap(UnitModel e) {
    setSelectedUnitModel(e);
    symbolController.text = e.symbol!;
    formalNameController.text = e.formalName!;
  }

  void handleKeyDown() {
    if (selectedUnitModel == null) {
      onUnitTap(unitModelList.first);
    } else {
      if (selectedUnitModel == unitModelList.last) {
        onUnitTap(unitModelList.first);
      } else {
        onUnitTap(unitModelList[unitModelList.indexOf(selectedUnitModel!) + 1]);
      }
    }
  }

  void handleKeyUp() {
    if (selectedUnitModel == null) {
      onUnitTap(unitModelList.first);
    } else {
      if (selectedUnitModel == unitModelList.first) {
        onUnitTap(unitModelList.last);
      } else {
        onUnitTap(unitModelList[unitModelList.indexOf(selectedUnitModel!) - 1]);
      }
    }
  }

  List<LogicalKeyboardKey> clickedKeys = [];

  void updateKeys(LogicalKeyboardKey logicalKeyboardKey) {
    if (!clickedKeys.contains(logicalKeyboardKey)) {
      clickedKeys.add(logicalKeyboardKey);
    }
  }

  void performKeyboardClickedAction(HomeController homeController) {
    if (clickedKeys[0] == LogicalKeyboardKey.arrowDown) {
      handleKeyDown();
    } else if (clickedKeys[0] == LogicalKeyboardKey.arrowUp) {
      handleKeyUp();
    } else if (clickedKeys[0] == LogicalKeyboardKey.delete) {
      // deleteUnit();
      CustomUtilies.customSnackBar(
        "You cannot delete a Unit",
        Colors.yellow,
        Colors.white,
        "You can Hide a Unit",
        const Icon(Icons.delete),
      );
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyC)) {
      clearTextField();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyU)) {
      updateUnit();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyR)) {
      getAllUnits();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyA)) {
      addUnit();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.arrowUp)) {
      debugPrint('Add Product ');
      homeController.setCurrentSelectedWidget(const AddProductScreen());
    }
    clickedKeys.clear();
  }
}
