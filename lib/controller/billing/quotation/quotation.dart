import 'dart:io';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/enum/printer/printer.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/price/price.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/quotations/quotations.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/utils/keyboard/keyboard.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

class QuotationController extends GetxController {
  DateTime pickedDateTime = getTodaysDate();

  final productController = TextEditingController();
  final qtyController = TextEditingController();
  final discountController = TextEditingController();
  final noteController = TextEditingController();
  final pendingAmountController = TextEditingController();
  TextEditingController invoiceNumberController =
      TextEditingController(text: "1 / 2020-2021");
  final customerController = TextEditingController();
  final unitController = TextEditingController();
  final rateController = TextEditingController();
  final priceController = TextEditingController();
  final taxController = TextEditingController();
  List<SalesProductModel> salesProductModelList = [];
  SalesProductModel? selectedSalesProductModel;

  FocusNode productNode = FocusNode();
  final priceModelFocusNode = FocusNode();
  final customerFocusNode = FocusNode();
  final priceNode = FocusNode();
  final rateKeyboardFocusNode = FocusNode();
  final priceKeyboardNode = FocusNode();

  void performInit() {
    if (quotationModel == null) {
      final list = quotationDB.getAllQuotation();

      invoiceNumberController = TextEditingController(
        text: getBillNo(list.map((e) => e.quotationNo).toList()),
      );
    } else {
      setAllFieldForSelectedBill();
    }
    update();
  }

  bool isUpdated = false;
  void setAllFieldForSelectedBill() {
//     customerFocusNode.unfocus();
    if (!isUpdated) {
      selectedCustomerModel = _quotationModel!.customerModel;
      customerController.text = _quotationModel!.customerModel.name;

      noteController.text = _quotationModel!.note ?? "";
      invoiceNumberController.text = _quotationModel!.quotationNo;

      salesProductModelList = _quotationModel!.productList;

      pickedDateTime = _quotationModel!.dateTime;
      isUpdated = true;
      try {
        update();
      } catch (e) {}
    }
  }

  @override
  void onInit() {
    performInit();
    super.onInit();
  }

  void setPickedDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      pickedDateTime = dateTime;
    }
    update();
  }

  List<ProductModel>? productsList;
  List<CustomerModel>? customersList;

  void getAllProducts() {
    productsList = productDB.getAllProduct();
  }

  void getAllCustomers() {
    customersList = customerDB.getAllCustomer();
  }

  CustomerModel? selectedCustomerModel;
  ProductModel? _selectedProductModel;
  ProductModel? get selectedProductModel => _selectedProductModel;
  void addSelectedProductModel(ProductModel? productModel) {
    if (productModel == null) {
      _selectedProductModel = null;
      update();
      return;
    }
    debugPrint("Add Product IS Been Called");
    _selectedProductModel = productModel;
    setSelectedPriceModel = null;
    taxController.text =
        categoryDB.getCategoryModelById(productModel.categoryId).tax.toString();
    final List<PriceModel> list = productModel.differentPriceList ?? [];
    final unit = Database().getUnitModelById(productModel.unitId);
    if (unit != null) {
      list.add(
        PriceModel(
          id: const Uuid().v1(),
          code: productModel.code,
          unitModel: unit,
          mrp: productModel.sellingPrice,
          unitQty: double.parse("${productModel.unitQty}"),
          retail: productModel.retail,
          wholesale: productModel.wholesale,
          createdAt: DateTime.now(),
        ),
      );
    }
    _selectedProductModel = productModel.copyWith(differentPriceList: list);
    if (productModel.differentPriceList!.isNotEmpty) {
      for (final item in productModel.differentPriceList ?? <PriceModel>[]) {
        debugPrint("Price Item : $item");
        if (item.code != null) {
          if (item.code!.contains(productController.text)) {
            setSelectedPriceModel = item;
            return;
          }
        }
      }
      setSelectedPriceModel = productModel.differentPriceList!.first;
    }
  }

  void addSelectedCustomerModel(CustomerModel customerModel) {
    selectedCustomerModel = customerModel;
    update();
  }

  PriceModel? _selectedPriceModel;
  PriceModel? get selectedPriceModel => _selectedPriceModel;
  set setSelectedPriceModel(PriceModel? val) {
    _selectedPriceModel = val;
    if (val != null) {
      if (selectedCustomerModel!.type == customerType[0]) {
        rateController.text = "${val.mrp}";
      } else if (selectedCustomerModel!.type == customerType[1]) {
        rateController.text = "${val.retail}";
      }
      //Wholesale
      else {
        rateController.text = "${val.wholesale}";
      }
      try {
        priceController.text = getPriceForPriceController();
      } catch (e) {}
    } else {
      rateController.text = "";
    }
    update();
  }

  String getPriceForPriceController() {
    return (double.parse(rateController.text) +
            calculateTax(
              double.parse(rateController.text),
              categoryDB
                  .getCategoryModelById(selectedProductModel!.categoryId)
                  .tax,
            ))
        .toStringAsFixed(2);
  }

  void addSelectedSalesProductModel() {
    if (selectedCustomerModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Error!",
        "Please Select the customer First",
      );
      return;
    }

    try {
      debugPrint(
        'qtyController.text ${categoryDB.getCategoryModelById(selectedProductModel!.categoryId)}',
      );
      final qty = double.parse(qtyController.text);
      double discount = 0;
      try {
        discount = double.parse(discountController.text);
      } catch (e) {
        discount = 0;
      }
      final matchedData = salesProductModelList
          .where(
            (element) => element.productModel!.id == selectedProductModel!.id,
          )
          .toList();
      if (matchedData.isEmpty) {
        final salesProductModel = SalesProductModel(
          categoryModel:
              categoryDB.getCategoryModelById(selectedProductModel!.categoryId),
          productModel: selectedProductModel,
          qty: qty,
          rate: double.tryParse(rateController.text) ?? 0,
          price: getPrice(
            qty,
            double.tryParse(rateController.text) ?? 0,
          ),
          discountPer: discount,
          qtyMathEqn: qtyController.text,
        );
        debugPrint('qtyController $salesProductModel');
        salesProductModelList = [...salesProductModelList, salesProductModel];
      } else {
        final index = salesProductModelList.indexOf(matchedData[0]);
        final salesProductModel = SalesProductModel(
          categoryModel:
              categoryDB.getCategoryModelById(selectedProductModel!.categoryId),
          productModel: selectedProductModel,
          qty: matchedData[0].qty! + qty,
          price: getPrice(
            qty,
            double.tryParse(rateController.text) ?? 0,
          ),
          discountPer: discount,
          qtyMathEqn: qtyController.text,
        );
        debugPrint('qtyController $salesProductModel');
        salesProductModelList[index] = salesProductModel;
      }
      addSelectedProductModel(null);
      productController.clear();
      qtyController.clear();
      discountController.clear();
      productController.clear();
      taxController.clear();
      priceController.clear();
      rateController.clear();
    } catch (e) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Error in adding Product $e",
      );
    }
    update();
  }

  UnitModel? _selectedUnitModel;
  UnitModel? get selectedUnitModel => _selectedUnitModel;
  set setUnitModel(UnitModel? value) {
    _selectedUnitModel = value;
    update();
  }

  void keyboardSelectUnitModel(KeyboardEventEnum keyboardEventEnum) {
    final text = unitController.text;
    setUnitModel = KeyboardUtilities.keyboardSelectUnitModel(
      text,
      Database().getAllUnits(),
      selectedUnitModel,
      keyboardEventEnum,
    );
    update();
  }

  void onSalesModelTap(SalesProductModel salesProductModel) {
    selectedSalesProductModel = salesProductModel;
    update();
  }

  void keyboardSelectProductModel(KeyboardEventEnum keyboardEventEnum) {
    final text = productController.text;
    addSelectedProductModel(
      KeyboardUtilities.keyboardSelectProductModel(
        text,
        productsList ?? [],
        selectedProductModel,
        keyboardEventEnum,
        isSpecialSearch: true,
      ),
    );
    update();
    debugPrint('selectedProductModel: $selectedProductModel');
  }

  void keyboardSelectCustomerModel(KeyboardEventEnum keyboardEventEnum) {
    final text = customerController.text;
    selectedCustomerModel = KeyboardUtilities.keyboardSelectCustomerModel(
      text,
      customersList ?? [],
      selectedCustomerModel,
      keyboardEventEnum,
    );
    update();
    debugPrint('selectedCustomerModel: $selectedCustomerModel');
  }

  void clearAll() {
    _quotationModel = null;
    isUpdated = false;
    addSelectedProductModel(null);
    selectedCustomerModel = null;
    salesProductModelList = [];
    salesProductModelList.clear();
    productController.clear();
    qtyController.clear();
    discountController.clear();
    noteController.clear();
    pendingAmountController.clear();
    customerController.clear();
    update();
  }

  QuotationModel? _quotationModel;
  QuotationModel? get quotationModel => _quotationModel;

  set quotationModel(QuotationModel? quotationModel) {
    _quotationModel = quotationModel;
    setAllFieldForSelectedBill();

    update();
  }

  Future<void> addQuotationToDB(PrinterEnum? printerEnum) async {
    final quotationModel = QuotationModel(
      id: const Uuid().v4(),
      quotationNo: invoiceNumberController.text,
      price: getGrandTotal(salesProductModelList, selectedCustomerModel),
      productList: salesProductModelList,
      customerModel: selectedCustomerModel!,
      dateTime: pickedDateTime,
      createdAt: DateTime.now(),
    );
    try {
      if (_quotationModel == null) {
        await quotationDB.addQuotationToDb(quotationModel);
        if (printerEnum != null) {
          if (printerEnum == PrinterEnum.Normal) {
            final data = await PDFGenerator.generateQuotation(quotationModel);
            final file = File(data);
            await PrinterUtility.normalPrint(file);
          } else {
            final data = await PDFGenerator.generateThermalBillForQuotation(
              quotationModel,
            );
            final file = File(data);
            await PrinterUtility.thermalPrint(file);
          }
        }
        CustomUtilies.customSuccessSnackBar(
          "Success",
          "Quotation Added Successfully",
        );
      } else {
        if (salesProductModelList.isEmpty) {
          CustomUtilies.customFailureSnackBar(
            "Error",
            "Please add some Product",
          );
          return;
        }
        final seleCust =
            selectedCustomerModel ?? _quotationModel!.customerModel;
        await quotationDB.updateQuotation(
          _quotationModel!.copyWith(
            customerModel: seleCust,
            dateTime: pickedDateTime,
            price: getGrandTotal(salesProductModelList, seleCust),
            productList: salesProductModelList,
            note: noteController.text,
          ),
        );
        CustomUtilies.customSuccessSnackBar(
          "Success",
          "Quotation Updated Successfully",
        );
        clearAll();
        performInit();
      }
      performInit();
      setPickedDateTime(getTodaysDate());
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error in Adding Category", "$e");
    }
    clearAll();
  }

  void removeASalesProduct(SalesProductModel salesProductModel) {
    try {
      salesProductModelList.remove(salesProductModel);
      update();
    } catch (e) {
      CustomUtilies.customFailureSnackBar(
        "Something went wrong",
        "Failure : $e",
      );
    }
  }
}
