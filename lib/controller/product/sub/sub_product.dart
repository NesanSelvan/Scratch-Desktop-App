import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../enum/keyboard.dart';
import '../../../models/product/product.dart';
import '../../../models/product/sub/details/sub_product_details.dart';
import '../../../models/product/sub/sub_product.dart';
import '../../../models/threads/threads.dart';
import '../../../utils/keyboard/keyboard.dart';
import '../../billing/sales/sales.dart';

class SubProductController extends GetxController {
  final productController = TextEditingController();
  final subProductNoController = TextEditingController();
  final subProductNameController = TextEditingController();
  final subProductStockController = TextEditingController();

  final productNode = FocusNode();
  final productKeyboardNode = FocusNode();

  final subproductNoNode = FocusNode();
  final subproductNameNode = FocusNode();
  final subproductStockNode = FocusNode();

  List<ProductModel> productList = productDB.getAllProduct();

  SubProductModel? _subProductModel;
  SubProductModel? get subProductModel => _subProductModel;
  set setSubProductModel(SubProductModel? value) {
    _subProductModel = value;
  }

  ProductModel? _selectedProductModel;
  ProductModel? get selectedProductModel => _selectedProductModel;
  set setSelectedProductModel(ProductModel? value) {
    _selectedProductModel = value;
    if (_selectedProductModel != null) {
      subProductNoController.text = _selectedProductModel?.productNumber ?? "";
      setSubProductModel = subProductsDB
          .getSubProductModelByProductId(_selectedProductModel!.id);
    } else {
      subProductNoController.text = "";
      _subProductModel = null;
      subProductNoController.clear();
    }
    update();
  }

  bool _isAddClicked = true;
  bool get isAddClicked => _isAddClicked;
  set setIsAddClicked(bool val) {
    _isAddClicked = val;
    setSelectedThreadModel = null;
    update();
  }

  void deleteSubProductModel(SubProductModel e) {
    subProductsDB.deleteSubProduct(e);
    performInit();

    update();
  }

  void keyboardSelectProductModel(KeyboardEventEnum keyboardEventEnum) {
    // companyList = companyDB.getAllCompany();
    final text = productController.text;
    setSelectedProductModel = KeyboardUtilities.keyboardSelectProductModel(
      text,
      productList,
      _selectedProductModel,
      keyboardEventEnum,
    );
    update();
  }

  @override
  void performInit() {
    _subProductsList = subProductsDB.getAllSubProducts();

    update();
  }

  /*
    Adding Sub Product to Database
  */
  Future<void> addSubProductToDB() async {
    /* If Selected Product is Empty Show Error
    */
    if (selectedProductModel == null) {
      CustomUtilies.customFailureSnackBar("error", "Pleasem Select a Product");
      return;
    }
    try {
      final subProductDetails = SubProductDetailsModel(
        id: const Uuid().v4(),
        productNumber: subProductNoController.text,
        name: subProductNameController.text,
        imagesList: _imagesList,
        stock: int.parse(subProductStockController.text),
        createdAt: DateTime.now(),
      );
      final existsData =
          subProductsDB.getSubProductModelByProductId(selectedProductModel!.id);

      if (existsData == null) {
        final subProduct = SubProductModel(
          id: const Uuid().v4(),
          productModel: _selectedProductModel!,
          subProducts: [subProductDetails],
          createdAt: DateTime.now(),
        );
        subProductsDB.addSubProductToDb(subProduct);
        CustomUtilies.customSuccessSnackBar("Success", "Sub Product Added");
      } else {
        await updateSubProduct(existsData, subProductDetails);
      }
      setSelectedProductModel = _selectedProductModel;
      clearAfterAdd();
      subproductNameNode.requestFocus();
      performInit();
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "Error : $e");
    }
    update();
  }

  void clearAfterAdd() {
    subProductNameController.clear();
    subProductStockController.clear();
    _imagesList.clear();
  }

  final List<String> _imagesList = [];
  List<String> get imagesList => _imagesList;
  set setImageInImagesList(String data) {
    _imagesList.add(data);
    update();
  }

  set removeImageFromImagesList(String data) {
    _imagesList.remove(data);
    update();
  }

  Future<void> updateSubProduct(SubProductModel existsData,
      SubProductDetailsModel subProductDetailsModel) async {
    bool isExists = false;
    for (final item in existsData.subProducts) {
      if (item.name == subProductDetailsModel.name ||
          item.productNumber == subProductDetailsModel.productNumber) {
        CustomUtilies.customFailureSnackBar(
          "Error",
          "Product with same name exists!",
        );
        isExists = true;
        break;
      }
    }
    if (!isExists) {
      await subProductsDB.updateSubProduct(
        existsData.copyWith(
          subProducts: [...existsData.subProducts, subProductDetailsModel],
        ),
      );
      setSubProductModel = subProductsDB.getSubProductModelById(existsData.id);
      CustomUtilies.customSuccessSnackBar("Success", "Sub Product Added");
    }
  }

  void clearOnAddSubProduct() {
    setSelectedProductModel = null;
    productController.clear();
    subProductNameController.clear();
    subProductStockController.clear();
    imagesList.clear();
    update();
  }

  List<SubProductModel> _subProductsList = [];
  List<SubProductModel> get subProductsList => _subProductsList;

  SubProductModel? _selectedThreadsCompanyModel;
  SubProductModel? get selectedThreadsCompanyModel =>
      _selectedThreadsCompanyModel;

  set setSelectedThreadModel(SubProductModel? value) {
    _selectedThreadsCompanyModel = value;
    _threadStock.clear();
    update();
  }

  final List<ThreadsModel> _threadStock = [];
  List<ThreadsModel> get threadStock => _threadStock;

  void onTextFieldUpdated(String box, ThreadsModel threadsModel) {
    try {
      final stock = int.parse(box.split('').reversed.join());
      final list = _threadStock
          .where((element) => element.number == threadsModel.number)
          .toList();
      final updatedThread = threadsModel.copyWith(stock: stock);
      if (list.isEmpty) {
        _threadStock.add(updatedThread);
      } else {
        final index = _threadStock.indexOf(list.first);
        _threadStock[index] = updatedThread;
      }
      debugPrint("************** Threads List *************");
      debugPrint("$_threadStock");
      debugPrint("******************************************");
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "$e");
    }
    update();
  }

  Future<void> saveThreads() async {
    // debugPrint("updatedThread : $_threadStock");
    // if (_selectedThreadsCompanyModel != null) {
    //   List<ThreadsModel> updatedThread = [];
    //   final threadProduct =
    //       _selectedThreadsCompanyModel!.threadProduct.copyWith();
    //   for (final thread in threadProduct.threads) {
    //     final updatedThreadList =
    //         _threadStock.where((ele) => ele.number == thread.number).toList();
    //     if (updatedThreadList.isEmpty) {
    //       updatedThread.add(thread);
    //     } else {
    //       updatedThread.add(thread.copyWith(stock: updatedThreadList[0].stock));
    //     }
    //   }
    //   await SubProductDB.updateSubProduct(_selectedThreadsCompanyModel!
    //       .copyWith(
    //           threadProduct: _selectedThreadsCompanyModel!.threadProduct
    //               .copyWith(threads: updatedThread)));
    //   setSelectedThreadModel =
    //       SubProductDB.getSubProductModelById(_selectedThreadsCompanyModel!.id);
    //   debugPrint("updatedThread : $updatedThread");
    //   _threadStock.clear();
    //   update();
    // }
  }
}
