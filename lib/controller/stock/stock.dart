import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../models/failure/failure.dart';
import '../../models/stocks/stock.dart';
import '../../screens/add/product/product.dart';
import '../billing/sales/sales.dart';
import '../home/home.dart';

class StockController extends GetxController {
  final stocksDB = Database().stocksDB;
  List<StockModel> stockModelList = Database().stocksDB.getAllStocks();
  List<StockModel> searchedStockList = Database().stocksDB.getAllStocks();
  List<ProductModel> allProductsList = Database().productDB.getAllProduct();
  final productNameController = TextEditingController();
  final stockCountController = TextEditingController();
  final searchController = TextEditingController();

  @override
  void onInit() {
    Database().initialize();
    getAllStocks();
    super.onInit();
  }

  ProductModel? selectedProduct;

  void getAllStocks() {
    stockModelList = Database().stocksDB.getAllStocks();
    debugPrint("stockModelList : $stockModelList");
    update();
  }

  void keyboardSelectCustomerModel() {
    final text = productNameController.text;
    debugPrint('text: $text');
    final productList = allProductsList
        .where(
          (suggestion) =>
              suggestion.productName.toLowerCase().contains(text.toLowerCase()),
        )
        .toList();

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (selectedProduct == null) {
      selectedProduct = productList[0];
    } else {
      if (productList.contains(selectedProduct)) {
        final index = productList.indexOf(selectedProduct!);
        if (index + 1 == productList.length) {
          selectedProduct = productList[0];
        } else {
          selectedProduct = productList[index + 1];
        }
      } else {
        selectedProduct = productList[0];
      }
    }
    update();
    debugPrint('selectedProduct: $selectedProduct');
  }

  Future<void> addStock() async {
    final allStocks = stocksDB.getAllStocks();
    final matchedStock = allStocks
        .where((element) => element.productId == selectedProduct!.id)
        .toList();
    debugPrint("selectedProduct: $selectedProduct");

    if (matchedStock.isEmpty) {
      await stocksDB.addStockToDb(
        StockModel(
          const Uuid().v4(),
          selectedProduct!.id,
          selectedProduct!.code,
          double.parse(stockCountController.text),
          DateTime.now(),
        ),
      );
    } else {
      debugPrint("matchedStock: $matchedStock");
      setSelectedStockModel(matchedStock[0]);
      debugPrint("selectedStockModel : $selectedStockModel");
      updateSelectedStock(
        StockModel(
          selectedStockModel!.id,
          selectedProduct!.id,
          selectedProduct!.code,
          selectedStockModel!.qty + int.parse(stockCountController.text),
          DateTime.now(),
        ),
      );
      CustomUtilies.customSuccessSnackBar(
        "Update SuccessFull",
        "Stock Updated Successfully",
      );
    }
    selectedProduct = null;
    getAllStocks();
    clearTextField();
    update();
  }

  StockModel? selectedStockModel;

  void setSelectedStockModel(StockModel? stockModel) {
    selectedStockModel = stockModel;
    update();
  }

  Failure? failure;

  Future<void> deleteStock() async {
    if (selectedStockModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Delete Unsuccessful",
        "Please Select a Stock to Delete",
      );
    } else {
      if (await deleteSelectedStock()) {
        CustomUtilies.customSuccessSnackBar(
          "Delete SuccessFull",
          "Stock Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Delete Unsuccessful", "$failure");
      }
    }
  }

  Future<bool> deleteSelectedStock() async {
    try {
      await stocksDB.deleteStock(selectedStockModel!);
      getAllStocks();
      selectedStockModel = null;
      clearTextField();
      return true;
    } catch (e) {
      failure = Failure("$e");
      update();
      return false;
    }
  }

  Future<void> updateStock() async {
    if (selectedStockModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Update Unsuccessfull",
        "Please Select a Stock to Update",
      );
    } else {
      selectedProduct =
          productDB.getProductModelById(selectedStockModel!.productId);
      if (await updateSelectedStock(
        StockModel(
          selectedStockModel!.id,
          selectedProduct!.id,
          selectedProduct!.code,
          double.parse(stockCountController.text),
          DateTime.now(),
        ),
      )) {
        CustomUtilies.customSuccessSnackBar(
          "Update SuccessFull",
          "Stock Updated Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Update Unsuccessfull", "$failure");
      }
      clearTextField();
    }
  }

  Future<bool> updateSelectedStock(StockModel stockModel) async {
    try {
      final datas = stockModelList
          .where(
            (element) =>
                element.productCode == stockModel.productCode ||
                element.productId == stockModel.productId,
          )
          .toList();
      if (datas.isEmpty) {
        failure = Failure("No Stock Match");
        update();
        return false;
      }
      await stocksDB.updateStock(stockModel);
      getAllStocks();
      selectedStockModel = null;
      return true;
    } catch (e) {
      failure = Failure("$e");
      return false;
    }
  }

  void searchStock(String text) {
    searchedStockList.clear();
    final datas = stockModelList.where((element) {
      return element.productCode.toLowerCase().contains(text.toLowerCase()) ||
          element.productId.toLowerCase().contains(text.toLowerCase());
    }).toList();
    searchedStockList = datas;
    update();
  }

  void clearTextField() {
    productNameController.clear();
    stockCountController.clear();
    update();
  }

  void onStockTap(StockModel e) {
    setSelectedStockModel(e);
    if (productDB.getProductModelById(e.productId) == null) {
      return;
    }
    productNameController.text =
        productDB.getProductModelById(e.productId)!.productName;
    stockCountController.text = "${e.qty}";
  }

  void handleKeyDown() {
    if (selectedStockModel == null) {
      onStockTap(stockModelList.first);
    } else {
      if (selectedStockModel == stockModelList.last) {
        onStockTap(stockModelList.first);
      } else {
        onStockTap(
          stockModelList[stockModelList.indexOf(selectedStockModel!) + 1],
        );
      }
    }
  }

  void handleKeyUp() {
    if (selectedStockModel == null) {
      onStockTap(stockModelList.first);
    } else {
      if (selectedStockModel == stockModelList.first) {
        onStockTap(stockModelList.last);
      } else {
        onStockTap(
          stockModelList[stockModelList.indexOf(selectedStockModel!) - 1],
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

  void performKeyboardClickedAction(HomeController homeController) {
    if (clickedKeys[0] == LogicalKeyboardKey.arrowDown) {
      handleKeyDown();
    } else if (clickedKeys[0] == LogicalKeyboardKey.arrowUp) {
      handleKeyUp();
    } else if (clickedKeys[0] == LogicalKeyboardKey.delete) {
      // deleteStock();
      CustomUtilies.customSnackBar(
        "You cannot delete a Stock",
        Colors.yellow,
        Colors.white,
        "You can Hide a Stock",
        const Icon(Icons.delete),
      );
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyC)) {
      clearTextField();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyU)) {
      updateStock();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyR)) {
      getAllStocks();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyA)) {
      addStock();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.arrowUp)) {
      debugPrint('Add Stock ');
      homeController.setCurrentSelectedWidget(const AddProductScreen());
    }
    clickedKeys.clear();
  }

  Future<void> resetStock() async {
    await stocksDB.resetAllStock();
    getAllStocks();
  }

  Future<void> resetAllNegativeStock() async {
    await stocksDB.resetOnlyNegativeStock();
    getAllStocks();
  }
}
