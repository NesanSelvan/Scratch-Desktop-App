import 'dart:developer';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/core/constants/calculations/bills/purchase.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/purchase/product/purchase_product.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:annai_store/models/stocks/stock.dart';
import 'package:annai_store/utils/image/image.dart';
import 'package:annai_store/utils/keyboard/keyboard.dart';
import 'package:annai_store/utils/null/null.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

class PurchaseController extends GetxController {
  DateTime pickedDateTime = getTodaysDate();

  final productController = TextEditingController();
  final qtyController = TextEditingController(text: "1");
  final discountController = TextEditingController(text: "0");
  final discountPercController = TextEditingController(text: "0");
  final companyController = TextEditingController();
  final rateController = TextEditingController(text: "0");

  final totalAmountController = TextEditingController(text: "0");
  final forwardingSalesController = TextEditingController(text: "0");
  final tcsSalesController = TextEditingController(text: "0");
  final taxController = TextEditingController(text: "0");
  final taxableValueController = TextEditingController(text: "0");
  final lorryFrightController = TextEditingController(text: "0");
  final lorryFrightOverallController = TextEditingController(text: "0");
  final lorryFrightOverallTaxController = TextEditingController(text: "6");
  final lorryFrightOverallTotalController = TextEditingController(text: "0");
  final amountController = TextEditingController(text: "0");

  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController overallDiscountController = TextEditingController();
  List<PurchaseProductModel> purchaseProductModelList = [];
  PurchaseProductModel? selectedPurchaseProductModel;

  final companyNode = FocusNode();
  final invoiceNoKeyboardNode = FocusNode();
  final overallDiscountKeyboardNode = FocusNode();
  final companyKeyboardNode = FocusNode();
  final invoiceNoNode = FocusNode();
  final overallDiscountNode = FocusNode();
  final productNode = FocusNode();
  final productKeyboardNode = FocusNode();

  double grandTotal = 0;

  bool _overallDiscountPercentage = true;
  bool get overallDiscountPercentage => _overallDiscountPercentage;
  set overallDiscountPercentage(bool val) {
    _overallDiscountPercentage = val;
    update();
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

  PurchaseModel? _billModel;
  PurchaseModel? get billModel => _billModel;

  set setPurchaseModel(PurchaseModel billModel) {
    _billModel = billModel;
    log("_billModel: ${_billModel?.billNo}");
    update();
  }

  void calculateOverallLorryFright(String? val) {
    double lorryFright = 0;
    double lorryFrightTax = 0;
    double lorryFrightTotal = 0;
    try {
      lorryFright = double.parse(lorryFrightOverallController.text);
      lorryFrightTax = double.parse(lorryFrightOverallTaxController.text);
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", e.toString());
    }
    lorryFrightTotal = lorryFright + (lorryFright * (lorryFrightTax / 100));
    lorryFrightOverallTotalController.text =
        lorryFrightTotal.toStringAsFixed(2);
  }

  void getPurchaseBillNo() {
    if (selectedCompanyModel != null) {
      debugPrint("Geting Purchase Bill No...");
      final purchaseList = purchaseDB.getAllPurchase();
      final matchedList = purchaseList.where(
        (element) => element.companyModel.id == selectedCompanyModel!.id,
      );
      invoiceNumberController.text =
          getBillNo(matchedList.map((e) => e.billNo).toList());
      print("Bil nO: ${getBillNo(matchedList.map((e) => e.billNo).toList())}");
    }
    update();
  }

  void performInit() {
    getAllCompany();
    if (_billModel != null) {
      // clearAll();
      isUpdated = false;
      setAllFieldForSelectedBill();
    }
    update();
  }

  bool isUpdated = false;
  void setAllFieldForSelectedBill() {
    log("setAllFieldForSelectedBill: $isUpdated");
//     customerFocusNode.unfocus();
    if (!isUpdated) {
      setSelectedCompanyModel = _billModel!.companyModel;
      companyController.text = _billModel!.companyModel.name;
      invoiceNumberController.text = _billModel!.billNo;
      overallDiscountController.text =
          (_billModel!.overallDiscount ?? '').toString();

      pickedDateTime = _billModel!.dateTime;
      purchaseProductModelList = _billModel!.productList ?? [];
      forwardingSalesController.text =
          (_billModel!.forwardingSales ?? '').toString();
      tcsSalesController.text = (_billModel!.tcsSales ?? '').toString();
      lorryFrightController.text = (_billModel!.tcsSales ?? '').toString();

      calculateGrandTotal();

      // customerController.text = _billModel!.customerModel.name;

      // noteController.text = _billModel!.note ?? "";
      // invoiceNumberController.text = _billModel!.billNo;

      // salesProductModelList = _billModel!.productList;

      // supplierRefController.text = _billModel!.supplierRef ?? "";
      // orderDateController.text = _billModel!.buyerOrderDate == null
      //     ? ""
      //     : getFormattedDate(_billModel!.buyerOrderDate!);
      // despatchDocNoController.text = _billModel!.dispatchDocumentNo ?? "";
      // destinationController.text = _billModel!.destination ?? "";
      // pickedDateTime = _billModel!.dateTime;
      isUpdated = true;
      try {
        update();
      } catch (e) {}
    }
  }

  @override
  void onInit() {
    performInit();
    productNode.addListener(() {
      if (productNode.hasFocus) {
        getProductsByCompany();
      }
    });

    productKeyboardNode.addListener(() {
      if (productKeyboardNode.hasFocus) {
        getProductsByCompany();
      }
    });

    super.onInit();
  }

  @override
  void dispose() {
    productNode.dispose();
    productKeyboardNode.dispose();

    super.dispose();
  }

  void setPickedDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      pickedDateTime = dateTime;
    }
    update();
  }

  List<ProductModel>? productsList;
  List<CompanyModel>? companiesList = [];

  void getProductsByCompany() {
    productsList?.clear();
    if (selectedCompanyModel != null) {
      productsList = productDB.getProductsByCompany(selectedCompanyModel!.id);
      final data = productDB.getProductsWithoutCompanyId();
      productsList = [...productsList ?? [], ...data];
      debugPrint("Text: From Company ${productsList?.first.productName}");
      if (productsList!.isEmpty) {
        CustomUtilies.customFailureSnackBar(
          "Error",
          "There is no product in ${selectedCompanyModel!.name}",
        );
      }
    } else {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Please Select Company first",
      );
    }
    selectedProductModel = null;
    update();
  }

  void getAllCompany() {
    companiesList = companyDB.getAllCompany();
    // setSelectedCompanyModel = companiesList?[0];
    update();
  }

  bool _isDiscountPercentage = false;
  bool get isDiscountPercentage => _isDiscountPercentage;
  set isDiscountPercentage(bool val) {
    _isDiscountPercentage = val;
    update();
  }

  ProductModel? selectedProductModel;

  CompanyModel? _selectedCompanyModel;
  CompanyModel? get selectedCompanyModel => _selectedCompanyModel;
  set setSelectedCompanyModel(CompanyModel? val) {
    if (purchaseProductModelList.isEmpty) {
      _selectedCompanyModel = val;
      if (val != null) {
        getProductsByCompany();
      }
    } else {
      // CustomUtilies.customFailureSnackBar(
      //     "Error", "Remove product to change company");
    }

    update();
  }

  void addSelectedProductModel(ProductModel productModel) {
    selectedProductModel = productModel;
    update();
  }

  void addSelectedCompanyModel(CompanyModel companyModel) {
    setSelectedCompanyModel = companyModel;
    update();
  }

  void addSelectedPurchaseProductModel() {
    if (selectedCompanyModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Error!",
        "Please Select the customer First",
      );
      return;
    }
    if (qtyController.text == "" ||
        discountController.text == "" ||
        rateController.text == "" ||
        totalAmountController.text == "" ||
        taxController.text == "" ||
        taxableValueController.text == "" ||
        lorryFrightController.text == "" ||
        amountController.text == "") {
      CustomUtilies.customFailureSnackBar("Error", "Error in adding Product");
    } else {
      try {
        debugPrint(
          'qtyController.text ${categoryDB.getCategoryModelById(selectedProductModel!.categoryId)}',
        );
        // final matchedData = purchaseProductModelList
        //     .where(
        //       (element) => element.productModel.id == selectedProductModel!.id,
        //     )
        //     .toList();

        final allAmounts = calculateAmounts();

        // if (matchedData.isEmpty) {
        final purchaseProductModel = PurchaseProductModel(
          id: selectedProductModel!.id,
          categoryModel:
              categoryDB.getCategoryModelById(selectedProductModel!.categoryId),
          productModel: selectedProductModel!,
          qty: allAmounts[0],
          rate: allAmounts[1],
          amount: allAmounts[2],
          discount: allAmounts[3],
          lorryFright: allAmounts[4],
          taxableValue: allAmounts[5],
          tax: allAmounts[6],
          totalAmount: allAmounts[7],
        );
        debugPrint('qtyController $purchaseProductModel');
        purchaseProductModelList.add(purchaseProductModel);
        // } else {
        //   final index = purchaseProductModelList.indexOf(matchedData[0]);
        //   final purchaseProductModel = PurchaseProductModel(
        //     id: selectedProductModel!.id,
        //     categoryModel: categoryDB
        //         .getCategoryModelById(selectedProductModel!.categoryId),
        //     productModel: selectedProductModel!,
        //     qty: allAmounts[0],
        //     rate: allAmounts[1],
        //     amount: allAmounts[2],
        //     discount: allAmounts[3],
        //     lorryFright: allAmounts[4],
        //     taxableValue: allAmounts[5],
        //     tax: allAmounts[6],
        //     totalAmount: allAmounts[7],
        //   );
        //   debugPrint('qtyController $purchaseProductModel');
        //   purchaseProductModelList[index] = purchaseProductModel;
        // }
        clearAfterAddingAProduct();
      } catch (e) {
        CustomUtilies.customFailureSnackBar(
          "Error",
          "Error in adding Product $e",
        );
      }
      calculateGrandTotal();
    }
    update();
  }

  void onSalesModelTap(PurchaseProductModel salesProductModel) {
    selectedPurchaseProductModel = salesProductModel;
    update();
  }

  void keyboardSelectProductModel(KeyboardEventEnum keyboardEventEnum) {
    final text = productController.text;
    print(keyboardEventEnum);
    debugPrint("Text: $text ${productsList?.first.productName}");
    selectedProductModel = KeyboardUtilities.keyboardSelectProductModel(
      text,
      productsList ?? [],
      selectedProductModel,
      keyboardEventEnum,
      isSpecialSearch: true,
    );
    update();
  }

  void keyboardSelectPurchaseModel() {
    final text = companyController.text;
    debugPrint('text: $text');
    final customerList = companiesList!
        .where(
          (suggestion) =>
              suggestion.name.toLowerCase().contains(text.toLowerCase()),
        )
        .toList();

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (selectedCompanyModel == null) {
      setSelectedCompanyModel = customerList[0];
    } else {
      if (customerList.contains(selectedCompanyModel)) {
        final index = customerList.indexOf(selectedCompanyModel!);
        if (index + 1 == customerList.length) {
          setSelectedCompanyModel = customerList[0];
        } else {
          setSelectedCompanyModel = customerList[index + 1];
        }
      } else {
        setSelectedCompanyModel = customerList[0];
      }
    }
    update();
    debugPrint('selectedCompanyModel: $selectedCompanyModel');
  }

  void keyboardSelectCompanyModel(KeyboardEventEnum keyboardEventEnum) {
    final text = companyController.text;
    setSelectedCompanyModel = KeyboardUtilities.keyboardSelectCompanyModel(
      text,
      companiesList ?? [],
      selectedCompanyModel,
      keyboardEventEnum,
    );
    update();
  }

  void clearAll() {
    selectedProductModel = null;
    isUpdated = false;
    _selectedCompanyModel = null;
    purchaseProductModelList.clear();
    discountPercController.clear();
    productController.clear();
    companyController.clear();
    discountController.text = "0";
    rateController.text = "0";
    amountController.text = "0";
    lorryFrightController.text = "0";
    taxableValueController.text = "0";
    taxController.text = "0";
    totalAmountController.text = "0";
    tcsSalesController.text = "0";
    invoiceNumberController.clear();
    qtyController.text = "0";
    grandTotal = 0;
    _imagesList.clear();
    update();
  }

  void clearAfterAddingAProduct() {
    selectedProductModel = null;
    productController.clear();
    qtyController.text = "0";
    discountController.text = "0";
    discountPercController.text = "0";
    rateController.text = "0";
    amountController.text = "0";
    lorryFrightController.text = "0";
    taxableValueController.text = "0";
    taxController.text = "0";
    totalAmountController.text = "0";
    update();
  }

  void calculateDiscount() {
    try {
      final discount = double.tryParse(discountPercController.text) ?? 0;
      final amount = double.tryParse(amountController.text) ?? 0;
      if (isDiscountPercentage) {
        discountController.text = (amount * discount / 100).toStringAsFixed(2);
      } else {
        discountController.text = discount.toStringAsFixed(2);
      }
    } catch (e) {}
  }

  List<double> calculateAmounts() {
    //qty,
    // rate,
    // amount,
    // discount,
    // lorryFright,
    // taxableValue,
    // tax,
    // totalAmount
    final purchaseCalculation = PurchaseCalculation();
    double discount = 0,
        lorryFright = 0,
        taxableValue = 0,
        totalAmount = 0,
        qty = 0,
        tax = 0,
        rate = 0,
        amount = 0;

    try {
      qty = double.parse(qtyController.text);
      rate = double.parse(rateController.text);
      amount = qty * rate;
      amountController.text = "$amount";
      discount = double.tryParse(discountController.text) ?? 0;
      tax = double.parse(taxController.text);
      debugPrint("discount : $discount, Tax: $tax");
      lorryFright = double.parse(lorryFrightController.text);
    } catch (e) {}
    taxableValue = amount - discount + lorryFright;
    taxableValueController.text = taxableValue.toStringAsFixed(2);
    totalAmount =
        taxableValue + purchaseCalculation.taxAmount(taxableValue, tax);
    // totalAmount = totalAmount + (totalAmount * tcsSalesAmount);
    // print("totalAmount: $totalAmount");
    totalAmountController.text = totalAmount.toStringAsFixed(2);
    update();
    return [
      qty,
      rate,
      amount,
      discount,
      lorryFright,
      taxableValue,
      tax,
      double.tryParse(totalAmount.toStringAsFixed(2)) ?? 0,
    ];
  }

  Future<void> addPurchaseToDB() async {
    print(lorryFrightOverallController.text);
    print(lorryFrightOverallTaxController.text);
    print(lorryFrightOverallTotalController.text);
    calculateGrandTotal();

    // await paymentDB.addPaymentToDb(paymentModel);
    final List<String> updatedImagesList =
        await ImageUtilities.moveImagesToSafeDir(_imagesList);

    final purchaseModel = PurchaseModel(
      id: _billModel == null ? const Uuid().v4() : _billModel!.id,
      productList: purchaseProductModelList,
      dateTime: pickedDateTime,
      grandTotal: grandTotal,
      imagesPathList: updatedImagesList,
      createdAt: DateTime.now(),
      billNo: invoiceNumberController.text,
      companyModel: selectedCompanyModel!,
      isNormalPurchaseBill: selectedCompanyModel?.isNormalPurchaseBill ?? true,
      lorryFright: double.tryParse(lorryFrightOverallController.text) ?? 0,
      lorryFrightTax:
          double.tryParse(lorryFrightOverallTaxController.text) ?? 0,
      lorryFrightTotal:
          double.tryParse(lorryFrightOverallTotalController.text) ?? 0,
      forwardingSales: double.tryParse(forwardingSalesController.text) ?? 0,
      tcsSales: double.tryParse(tcsSalesController.text) ?? 0,
      overallDiscount: double.tryParse(overallDiscountController.text) ?? 0,
    );
    log("purchaseModel: $purchaseModel");

    try {
      if (_billModel == null) {
        await purchaseDB.addPurchaseToDb(purchaseModel);
      } else {
        await purchaseDB.updatePurchase(purchaseModel);
      }
      log("purchaseModel: $purchaseModel added to DB");
      for (final item in purchaseProductModelList) {
        final catModel = categoryDB.getCategoryModelById(item.categoryModel.id);
        await categoryDB.updateCategory(catModel.copyWith(tax: item.tax));
        final productModel = productDB.getProductModelById(item.id);
        await productDB
            .updateProduct(productModel!.copyWith(purchasePrice: item.rate));
        final stock = stocksDB.getStockModelByProductId(item.id);
        print("Purchase Item : $item");
        if (stock == null) {
          final stockModel = StockModel(
            const Uuid().v4(),
            item.productModel.id,
            item.productModel.code,
            double.parse("${item.qty.round()}"),
            DateTime.now(),
          );
          await stocksDB.addStockToDb(stockModel);
        } else {
          await stocksDB.updateStock(
            stock.copyWith(
              qty: stock.qty + int.parse("${item.qty.round()}"),
            ),
          );
        }
      }

      CustomUtilies.customSuccessSnackBar(
        _billModel == null ? "Added SuccessFull" : "Updated Successfull",
        _billModel == null
            ? "Bill Added Successfully"
            : "Bill Updated Successfully",
      );
      performInit();
      setPickedDateTime(getTodaysDate());
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error in Adding Category", "$e");
    }
    clearAll();
  }

  void calculateGrandTotal() {
    grandTotal = 0;
    late double tax = 0;
    for (final item in purchaseProductModelList) {
      grandTotal += item.totalAmount;
      tax = item.tax;
    }
    grandTotal += forwardingSales;
    grandTotal += grandTotal * tcsSalesAmount;
    final discount = double.tryParse(overallDiscountController.text) ?? 0;
    if (overallDiscountPercentage) {
      final taxableValue = getTotalPurchaseProductModel.taxableValue;
      grandTotal = taxableValue - (taxableValue * (discount / 100));
      grandTotal += (grandTotal * (tax / 100));
    } else {
      grandTotal -= discount;
    }
    grandTotal = double.parse(grandTotal.toStringAsFixed(2));
    update();
  }

  void removeAPurchaseProduct(PurchaseProductModel salesProductModel) {
    try {
      purchaseProductModelList.remove(salesProductModel);
      calculateGrandTotal();
      update();
    } catch (e) {
      CustomUtilies.customFailureSnackBar(
        "Something went wrong",
        "Failure : $e",
      );
    }
  }

  double get forwardingSales =>
      double.tryParse(forwardingSalesController.text) ?? 0;

  double get tcsSales => double.tryParse(tcsSalesController.text) ?? 0;
  double get tcsSalesAmount =>
      (double.tryParse(tcsSalesController.text) ?? 0) / 100;

  PurchaseProductModel get getTotalPurchaseProductModel {
    double qty = 0;
    double rate = 0;
    double amount = 0;
    double discount = 0;
    double lorryFright = 0;
    double tax = 0;
    double taxableValue = 0;
    double totalAmount = 0;
    for (final item in purchaseProductModelList) {
      qty += item.qty;
      rate += item.rate;
      amount += item.amount;
      discount += item.discount;
      lorryFright += item.lorryFright;
      tax += item.tax;
      taxableValue += item.taxableValue;
      totalAmount += item.totalAmount;
    }
    return PurchaseProductModel(
      id: "id",
      categoryModel: NullCheckUtilities.getDummyCategory(),
      productModel: NullCheckUtilities.getDummyProduct(),
      qty: qty,
      rate: rate,
      amount: amount,
      discount: discount,
      lorryFright: lorryFright,
      tax: tax,
      taxableValue: taxableValue,
      totalAmount: totalAmount,
    );
  }
}
