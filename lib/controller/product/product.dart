import 'package:annai_store/controller/server/server.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/enum/sort/product.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:annai_store/models/price/price.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/utils/image/image.dart';
import 'package:annai_store/utils/keyboard/keyboard.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ProductController extends GetxController {
  List<ProductModel> productModelList = Database().productDB.getAllProduct();
  List<CompanyModel> companyModelList = Database().companyDB.getAllCompany();
  // final codeController = TextEditingController();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final unitController = TextEditingController();
  final unit1Controller = TextEditingController();
  final companyController = TextEditingController();
  final unitQtyController = TextEditingController();
  final unitQty1Controller = TextEditingController();
  final code1Controller = TextEditingController();
  final purchasePriceController = TextEditingController();
  final mrpController = TextEditingController();
  final retailController = TextEditingController();
  final wholesaleController = TextEditingController();
  CategoryModel? selectedCategory;
  UnitModel? selectedUnit;
  UnitModel? selectedUnit1;
  CompanyModel? selectedCompany;
  final searchController = TextEditingController();

  final purchasePrice1Controller = TextEditingController();
  final mrp1Controller = TextEditingController();
  final retail1Controller = TextEditingController();
  final wholesale1Controller = TextEditingController();

  final mrpPercController = TextEditingController(text: "20");
  final retailPercController = TextEditingController(text: "15");
  final wholesalePercController = TextEditingController(text: "10");

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

  bool _multipleCompanyHas = false;
  bool get multipleCompanyHas => _multipleCompanyHas;
  set multipleCompanyHas(bool? val) {
    debugPrint("_multipleCompanyHas: $val");
    if (val != null) {
      _multipleCompanyHas = val;
      debugPrint("_multipleCompanyHas: $_multipleCompanyHas");
      if (_multipleCompanyHas == true) {
        selectedCompany = null;
        companyController.clear();
      }

      update();
    }
  }

  List<PriceModel> _priceModelList = [];
  List<PriceModel> get priceModelList => _priceModelList;
  void addPriceModelList() {
    debugPrint("Adding Price");
    final mrp = mrp1Controller.text.replaceAll("+", "");
    if (selectedUnit1 != null) {
      try {
        final matchData = _priceModelList.where(
          (element) =>
              element.unitModel.id == selectedUnit1!.id &&
              element.unitQty == double.parse(unitQty1Controller.text),
        );
        final priceModel = PriceModel(
          id: const Uuid().v1(),
          code: code1Controller.text,
          unitModel: selectedUnit1!,
          unitQty: double.parse(unitQty1Controller.text),
          mrp: double.parse(mrp),
          retail: double.parse(retail1Controller.text),
          wholesale: double.parse(wholesale1Controller.text),
          purchasePrice: double.parse(purchasePrice1Controller.text),
          createdAt: DateTime.now(),
        );
        if (matchData.isEmpty) {
          _priceModelList.add(priceModel);
        } else {
          final index = _priceModelList.indexOf(matchData.first);
          _priceModelList[index] =
              priceModel.copyWith(id: _priceModelList[index].id);
          CustomUtilies.customSuccessSnackBar(
              "Successfull", "Unit Updated successfully");
        }
        code1Focus.requestFocus();
        clearPriceModelTextFields();
      } catch (e) {
        CustomUtilies.customFailureSnackBar("Error", "$e");
      }
    }
    update();
  }

  void updatePriceModelList() {
    if (_selectedPriceModel != null) {
      final data = _priceModelList
          .where((element) => element.id == _selectedPriceModel!.id)
          .toList();
      if (data.isNotEmpty) {
        final index = _priceModelList.indexOf(data.first);
        _priceModelList[index] = _selectedPriceModel!.copyWith(
          code: code1Controller.text,
          mrp: double.parse(mrp1Controller.text),
          unitModel: selectedUnit1!,
          unitQty: double.parse(unitQty1Controller.text),
          purchasePrice: double.parse(purchasePrice1Controller.text),
          retail: double.parse(retail1Controller.text),
          wholesale: double.parse(wholesale1Controller.text),
        );
        clearPriceModelTextFields();
      }
    }
    update();
  }

  PriceModel? _selectedPriceModel;
  PriceModel? get selectedPriceModel => _selectedPriceModel;
  set setSelectedPriceModel(PriceModel? priceModel) {
    _selectedPriceModel = priceModel;
    updatePriceModelTextField();
    update();
  }

  void updatePriceModelTextField() {
    if (_selectedPriceModel != null) {
      setSelectedUnit1(
        Database().getUnitModelById(_selectedPriceModel!.unitModel.id!),
      );
      unit1Controller.text = _selectedPriceModel?.unitModel.symbol ?? "";

      unitQty1Controller.text = _selectedPriceModel!.unitQty.toString();
      mrp1Controller.text = _selectedPriceModel!.mrp.toString();
      retail1Controller.text = _selectedPriceModel!.retail.toString();
      wholesale1Controller.text = _selectedPriceModel!.wholesale.toString();
      code1Controller.text = _selectedPriceModel?.code ?? "";
      purchasePrice1Controller.text =
          _selectedPriceModel!.purchasePrice.toString();
    } else {
      clearPriceModelTextFields();
    }
    update();
  }

  void clearPriceModelTextFields() {
    code1Controller.clear();
    mrp1Controller.clear();
    retail1Controller.clear();
    unitQty1Controller.clear();
    wholesale1Controller.clear();
    purchasePrice1Controller.clear();
    selectedUnit1 = null;
    unit1Controller.clear();
    _selectedPriceModel = null;
    update();
  }

  final unitDB = Database();

  final productDB = Database().productDB;
  final categoryDB = Database().categoryDB;
  final companyDB = Database().companyDB;

  final categoryFocus = FocusNode();
  final categoryKeyboardFocus = FocusNode();
  final unitKeyboardFocus = FocusNode();
  final companyFocus = FocusNode();
  final companyKeyboardFocus = FocusNode();
  final codeFocus = FocusNode();
  final codeKeyboardFocus = FocusNode();
  final nameKeyboardFocus = FocusNode();
  final nameFocus = FocusNode();
  final unitNode = FocusNode();
  final unitQtyFocus = FocusNode();
  final unitKeyboardQtyFocus = FocusNode();
  final purchaseFocus = FocusNode();
  final purchaseKeyboardFocus = FocusNode();
  final mrpFocus = FocusNode();
  final mrpKeyboardFocus = FocusNode();
  final retailFocus = FocusNode();
  final retailKeyboardFocus = FocusNode();
  final wholesaleFocus = FocusNode();
  final wholesaleKeyboardFocus = FocusNode();
  final unit1Node = FocusNode();
  final unit1KeyboardNode = FocusNode();
  final unitQty1Focus = FocusNode();
  final unitQty1KeyboardFocus = FocusNode();
  final code1Focus = FocusNode();
  final code1KeyboardFocus = FocusNode();
  final purchase1Focus = FocusNode();
  final purchase1KeyboardFocus = FocusNode();
  final mrp1Focus = FocusNode();
  final mrp1KeyboardFocus = FocusNode();
  final retail1Focus = FocusNode();
  final retail1KeyboardFocus = FocusNode();
  final wholesale1Focus = FocusNode();
  final wholesale1KeyboardFocus = FocusNode();

  final wholesalePercFocus = FocusNode();
  final wholesalePercKeyboardFocus = FocusNode();
  final retailPercFocus = FocusNode();
  final retailPercKeyboardFocus = FocusNode();
  final mrpPercFocus = FocusNode();
  final mrpPercKeyboardFocus = FocusNode();

  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;
  set setCategoryModel(List<CategoryModel> data) {
    _categoryList = data;
    update();
  }

  @override
  void onInit() {
    getAllCategory();
    getAllUnits();
    getAllProduct();
    companyModelList = Database().companyDB.getAllCompany();
    print("On Init...");
    super.onInit();
    update();
  }

  ProductSort get sort => _sort;
  ProductSort _sort = ProductSort.category;
  set sort(ProductSort productSort) {
    _sort = productSort;
    if (productSort == ProductSort.createdAt) {
      productModelList.sort((a, b) {
        return b.createdAt.compareTo(a.createdAt);
      });
    } else if (productSort == ProductSort.productName) {
      productModelList.sort((a, b) {
        return a.productName.compareTo(b.productName);
      });
    } else if (productSort == ProductSort.productNumber) {
      productModelList.sort((a, b) {
        int result;
        if (a.productNumber == null) {
          result = 1;
        } else if (b.productNumber == null) {
          result = -1;
        } else {
          result = (int.tryParse(a.productNumber!) ?? 0)
              .compareTo(int.tryParse(b.productNumber!) ?? 0);
        }
        return result;
      });
    }
    print("sort: $_sort");
    update();
  }

  List<UnitModel> _allUnitsList = [];
  List<UnitModel> get allUnitsList => _allUnitsList;
  set setUnitList(List<UnitModel> data) {
    _allUnitsList = data;
    update();
  }

  void getAllUnits() {
    _allUnitsList = Database().getAllUnits();
    update();
  }

  void keyboardSelectCategoryModel(KeyboardEventEnum keyboardEventEnum) {
    final text = categoryController.text;
    setSelectedCategory(
      KeyboardUtilities.keyboardSelectCategoryModel(
        text,
        _categoryList,
        selectedCategory,
        keyboardEventEnum,
      ),
    );
    update();
    debugPrint('selectedCategory: $selectedCategory');
  }

  void keyboardSelectUnitModel(KeyboardEventEnum keyboardEventEnum) {
    final text = unitController.text;
    setSelectedUnit(
      KeyboardUtilities.keyboardSelectUnitModel(
        text,
        _allUnitsList,
        selectedUnit,
        keyboardEventEnum,
      ),
    );
    update();
  }

  void keyboardSelectUnit1Model(KeyboardEventEnum keyboardEventEnum) {
    final text = unit1Controller.text;
    setSelectedUnit1(
      KeyboardUtilities.keyboardSelectUnitModel(
        text,
        _allUnitsList,
        selectedUnit1,
        keyboardEventEnum,
      ),
    );
    update();
  }

  List<double> getMrpRetailWholesaleByPercCal(double value) {
    final mrp = value + (value * (double.parse(mrpPercController.text) / 100));
    final retail =
        value + (value * (double.parse(retailPercController.text) / 100));
    final wholesale =
        value + (value * (double.parse(wholesalePercController.text) / 100));
    return [
      double.parse(mrp.toStringAsFixed(2)),
      double.parse(retail.toStringAsFixed(2)),
      double.parse(wholesale.toStringAsFixed(2))
    ];
  }

  void updateMRPRetailWholeByPercCalculation() {
    try {
      final purchasePrice = double.parse(purchasePriceController.text);
      final mrp = getMrpRetailWholesaleByPercCal(purchasePrice).first;
      final retail = getMrpRetailWholesaleByPercCal(purchasePrice)[1];
      final wholesale = getMrpRetailWholesaleByPercCal(purchasePrice).last;
      mrpController.text = "$mrp";
      retailController.text = "$retail";
      wholesaleController.text = "$wholesale";

      for (final item
          in selectedProductModel!.differentPriceList ?? <PriceModel>[]) {
        final list = getMrpRetailWholesaleByPercCal(item.purchasePrice ?? 0);
        final index = selectedProductModel!.differentPriceList!.indexOf(item);
        final pm = item.copyWith(
          mrp: list.first,
          retail: list[1],
          wholesale: list.last,
        );
        selectedProductModel!.differentPriceList![index] = pm;
      }

      // updateProduct();
    } catch (e) {
      debugPrint("Error");
    }
  }

  void calculateMRPRetailWholesalePurchaseFromMrpWithTax() {
    try {
      if (selectedCategory != null) {
        final mrp = double.parse(mrpController.text);
        final retail = double.parse(retailController.text);
        final wholesale = double.parse(wholesaleController.text);
        // (SalesCalculation.getSalesPrice(salesProductModel, customerModel) /
        //           (1 + (salesProductModel.discountPer! / 100)))
        //       .toStringAsFixed(2)
        // final mrpWithoutTax = mrp - (mrp * (selectedCategory!.tax / 100));
        final mrpWithoutTax = mrp / (1 + (selectedCategory!.tax / 100));
        mrpController.text = mrpWithoutTax.toStringAsFixed(2);
        // final purchasePrice = mrpWithoutTax -
        //     (mrpWithoutTax * (double.parse(mrpController.text) / 100));
        final purchasePrice =
            mrpWithoutTax / (1 + (double.parse(mrpPercController.text) / 100));
        // purchasePriceController.text = purchasePrice.toStringAsFixed(2);
        // updateMRPRetailWholeByPercCalculation();
        final retailWithoutTax = retail / (1 + (selectedCategory!.tax / 100));
        final wholesaleWithoutTax =
            wholesale / (1 + (selectedCategory!.tax / 100));
        retailController.text = retailWithoutTax.toStringAsFixed(2);
        wholesaleController.text = wholesaleWithoutTax.toStringAsFixed(2);
      }
    } catch (e) {
      debugPrint("Error");
    }
  }

  void calculateMRPRetailWholesalePurchaseFromMrpWithTaxDifferentPriceModel() {
    try {
      if (selectedCategory != null) {
        final mrp = double.parse(mrp1Controller.text);
        final retail = double.parse(retail1Controller.text);
        final wholesale = double.parse(wholesale1Controller.text);
        final mrpWithoutTax = mrp / (1 + (selectedCategory!.tax / 100));
        mrp1Controller.text = mrpWithoutTax.toStringAsFixed(2);
        final purchasePrice =
            mrpWithoutTax / (1 + (double.parse(mrpPercController.text) / 100));
        final retailWithoutTax = retail / (1 + (selectedCategory!.tax / 100));
        final wholesaleWithoutTax =
            wholesale / (1 + (selectedCategory!.tax / 100));
        retail1Controller.text = retailWithoutTax.toStringAsFixed(2);
        wholesale1Controller.text = wholesaleWithoutTax.toStringAsFixed(2);
      }
    } catch (e) {
      debugPrint("Error");
    }
  }

  void keyboardSelectCompanyModel(KeyboardEventEnum keyboardEventEnum) {
    final text = companyController.text;
    setSelectedCompany(
      KeyboardUtilities.keyboardSelectCompanyModel(
        text,
        companyModelList,
        selectedCompany,
        keyboardEventEnum,
      ),
    );
    update();
    debugPrint('selectedCategory: $selectedCategory');
  }

  void getAllCategory() {
    debugPrint("Getting All Category from Product Add");
    setCategoryModel = categoryDB.getAllCategory();
  }

  void getAllProduct() {
    productModelList = Database().productDB.getAllProduct();
    update();
  }

  void setSelectedCategory(CategoryModel? categoryModel) {
    selectedCategory = categoryModel;

    update();
  }

  void setSelectedUnit(UnitModel? unitModel) {
    selectedUnit = unitModel;
    update();
  }

  void setSelectedUnit1(UnitModel? unitModel) {
    selectedUnit1 = unitModel;
    update();
  }

  void setSelectedCompany(CompanyModel? companyModel) {
    selectedCompany = companyModel;
    update();
  }

  Future<void> addProduct() async {
    debugPrint("Adding Product...");
    final List<String> updatedImagesList =
        await ImageUtilities.moveImagesToSafeDir(_imagesList);
    try {
      await productDB.addProductToDb(
        ProductModel(
          id: const Uuid().v1(),
          imagesList: updatedImagesList,
          code: barcodeController.text,
          productName: nameController.text,
          categoryId: selectedCategory!.id,
          unitId: selectedUnit?.id ?? "",
          unitQty: int.parse(unitQtyController.text),
          differentPriceList: _priceModelList,
          purchasePrice: double.parse(purchasePriceController.text),
          sellingPrice: double.parse(mrpController.text),
          isHidden: false,
          wholesale: double.parse(wholesaleController.text),
          retail: double.parse(retailController.text),
          isPending: false,
          companyId: selectedCompany?.id,
          createdAt: DateTime.now(),
        ),
      );
      clearTextField();
      getAllProduct();
      CustomUtilies.customSuccessSnackBar("Success", "Added Successfully");
      // searchProduct(searchController.text);
    } catch (e) {
      debugPrint('Error : $e');
      CustomUtilies.customFailureSnackBar("Error in Adding Product", "$e");
    }
  }

  ProductModel? selectedProductModel;

  void setSelectedProductModel(ProductModel? productModel) {
    selectedProductModel = productModel;
    if (productModel != null) {
      nameController.text = productModel.productName.toString();
      barcodeController.text = productModel.code.toString();
      unitQtyController.text = productModel.unitQty.toString();
      purchasePriceController.text = productModel.purchasePrice.toString();
      mrpController.text = productModel.sellingPrice.toString();
      retailController.text = productModel.retail.toString();
      wholesaleController.text = productModel.wholesale.toString();
      unitController.text =
          Database().getUnitModelById(productModel.unitId)?.symbol ?? "";
      setSelectedCategory(
        categoryDB.getCategoryModelById(productModel.categoryId),
      );
      setSelectedUnit(unitDB.getUnitModelById(productModel.unitId));
      if (productModel.companyId != null) {
        setSelectedCompany(
          companyDB.getCompanyById(productModel.companyId!),
        );
      }

      _priceModelList = productModel.differentPriceList ?? [];

      categoryController.text = selectedCategory!.category;

      companyController.text = selectedCompany?.name ?? "";
    } else {}
    update();
  }

  Failure? failure;

  Future<void> deleteProduct() async {
    if (selectedProductModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Delete Unsuccessfull",
        "Please Select a Product to Delete",
      );
    } else {
      if (await deleteSelectedProduct()) {
        CustomUtilies.customSuccessSnackBar(
          "Delete SuccessFull",
          "Product Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Delete Unsuccessfull", "$failure");
      }
    }
    searchProduct(searchController.text);
  }

  void clearAll() {
    debugPrint("Clearing All...");
    searchController.clear();
    setSelectedProductModel(null);
    codeFocus.requestFocus();
    clearTextField();
    update();
  }

  int count = -1;

  Future<void> addProductNumber() async {
    productModelList.sort((a, b) {
      return b.createdAt.compareTo(a.createdAt);
    });
    final productLength = productDB.getAllProduct().length;
    count = 0;
    for (final product in productModelList) {
      // final productNumber = "$count.${category.hsnCode}";
      // debugPrint("Product No : $productNumber");
      await productDB.updateProduct(
        product.copyWith(
          productNumber: "${count + 1}",
        ),
      );
      count++;
      print("productDB: ${product.productName} $count");
      update();
    }
    count = 0;
    getAllProduct();
    update();
    print("Update Done");
    // final categoryList = categoryDB.getAllCategory();
    // for (final category in categoryList) {
    //   final productsList = productDB.getAllProductByCategoryId(category.id);
    //   for (final product in productsList) {
    //     final productNumber = "$count.${category.hsnCode}";
    //     debugPrint("Product No : $productNumber");
    //     await productDB
    //         .updateProduct(product.copyWith(productNumber: productNumber));
    //     count += 1;
    //   }
    //   // count += 1000 - productsList.length;
    //   count = 1;
    // }
  }

  Future<void> updateProductNumber(
    String newNumber,
    ProductModel product,
  ) async {
    final products = productDB.getAllProduct();
    bool isExists = false;
    for (final p in products) {
      if (p.productNumber == newNumber) {
        CustomUtilies.customFailureSnackBar(
          "Error",
          "Product ${p.productName} with same Product Number Exists!",
        );
        isExists = true;
        break;
      }
    }
    if (!isExists) {
      await productDB.updateProduct(product.copyWith(productNumber: newNumber));
      CustomUtilies.customSuccessSnackBar("Success", "Updated Successfully");
    }
  }

  Future<bool> deleteSelectedProduct() async {
    try {
      await productDB.deleteProduct(selectedProductModel!);
      getAllProduct();
      selectedProductModel = null;
      clearTextField();
      return true;
    } catch (e) {
      failure = Failure("$e");
      update();
      return false;
    }
  }

  Future<void> updateProduct() async {
    addPriceModelList();
    if (selectedProductModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Update Unsuccessfull",
        "Please Select a Product to Update",
      );
    } else {
      final List<String> updatedImagesList =
          await ImageUtilities.moveImagesToSafeDir(_imagesList);
      if (await updateSelectedProduct(
        selectedProductModel!.copyWith(
          id: selectedProductModel!.id,
          code: barcodeController.text,
          imagesList: updatedImagesList,
          productName: nameController.text,
          categoryId: selectedCategory!.id,
          unitId: selectedUnit!.id ?? "",
          unitQty: int.parse(unitQtyController.text),
          differentPriceList: _priceModelList,
          purchasePrice: double.parse(purchasePriceController.text),
          sellingPrice: double.parse(mrpController.text),
          isHidden: false,
          wholesale: double.parse(wholesaleController.text),
          retail: double.parse(retailController.text),
          isPending: false,
          companyId: selectedCompany?.id,
          createdAt: DateTime.now(),
        ),
      )) {
        CustomUtilies.customSuccessSnackBar(
          "Update SuccessFull",
          "Product Deleted Successfully",
        );
        searchProduct(searchController.text);
        clearTextField();
      } else {
        CustomUtilies.customFailureSnackBar("Update Unsuccessfull", "$failure");
      }
      clearTextField();
    }
  }

  Future<bool> updateSelectedProduct(ProductModel productModel) async {
    try {
      final datas = productModelList
          .where((element) => element.id == productModel.id)
          .toList();
      if (datas.isEmpty) {
        failure = Failure("No Product Match");
        update();
        return false;
      }
      await productDB.updateProduct(productModel);
      getAllProduct();
      selectedProductModel = null;
      return true;
    } catch (e) {
      failure = Failure("$e");
      return false;
    }
  }

  List<ProductModel> sortProduct = [];

  List<ProductModel> searchedProductModel = [];

  void searchProduct(String text) {
    searchedProductModel.clear();

    // final datas =
    //     SearchUtility.customSearch<ProductModel>(text, productModelList);

    final datas = productModelList.where((element) {
      // ignore: avoid_bool_literals_in_conditional_expressions
      return element.code.toLowerCase().contains(text.toLowerCase()) ||
              element.productName.toLowerCase().contains(text.toLowerCase()) ||
              element.productNumber == null ||
              element.productNumber == ""
          ? true
          : element.productNumber
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase());
    }).toList();

    searchedProductModel = datas;
    update();
  }

  void clearTextField() {
    nameController.clear();
    barcodeController.clear();
    unitQtyController.clear();
    purchasePriceController.clear();
    mrpController.clear();
    retailController.clear();
    wholesaleController.clear();
    setSelectedCategory(null);
    setSelectedUnit(null);
    selectedCompany = null;
    selectedUnit1 = null;
    categoryController.clear();
    companyController.clear();
    unit1Controller.clear();
    unitController.clear();
    clearPriceModelTextFields();
    _priceModelList = [];
    _imagesList.clear();
    codeFocus.requestFocus();
    update();
  }

  void onProductTap(ProductModel e) {
    setSelectedProductModel(e);
  }

  void handleKeyDown() {
    if (selectedProductModel == null) {
      onProductTap(productModelList.first);
    } else {
      if (selectedProductModel == productModelList.last) {
        onProductTap(productModelList.first);
      } else {
        onProductTap(
          productModelList[productModelList.indexOf(selectedProductModel!) + 1],
        );
      }
    }
  }

  void handleKeyUp() {
    if (selectedProductModel == null) {
      onProductTap(productModelList.first);
    } else {
      if (selectedProductModel == productModelList.first) {
        onProductTap(productModelList.last);
      } else {
        onProductTap(
          productModelList[productModelList.indexOf(selectedProductModel!) - 1],
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
    // if (clickedKeys[0] == LogicalKeyboardKey.arrowDown) {
    //   handleKeyDown();
    // } else if (clickedKeys[0] == LogicalKeyboardKey.arrowUp) {
    //   debugPrint('Up key ');
    //   handleKeyUp();
    // } else
    if (clickedKeys[0] == LogicalKeyboardKey.delete) {
      // deleteProduct();
      CustomUtilies.customSnackBar(
        "You cannot delete a Product",
        Colors.yellow,
        Colors.white,
        "You can Hide a Product",
        const Icon(Icons.delete),
      );
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyC)) {
      clearTextField();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyU)) {
      updateProduct();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyR)) {
      getAllProduct();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyA)) {
      addProduct();
    }
    clickedKeys.clear();
  }
}
