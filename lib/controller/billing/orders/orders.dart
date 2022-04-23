import 'dart:io';

import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/models/orders/order.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

// import 'package:annai_store/core/constants/calculations/calculations.dart';
// import 'package:annai_store/core/constants/constants.dart';
import '../../../enum/keyboard.dart';
import '../../../enum/printer/printer.dart';
import '../../../models/customer/customer.dart';
import '../../../models/price/price.dart';
import '../../../models/product/product.dart';
import '../../../models/unit/unit.dart';
import '../../../utils/keyboard/keyboard.dart';
import '../../../utils/pdf/pdf.dart';
import '../../../utils/printer/printer.dart';
import '../sales/sales.dart';

class OrdersController extends GetxController {
  DateTime pickedDateTime = getTodaysDate();

  final productController = TextEditingController();
  final qtyController = TextEditingController();
  final discountController = TextEditingController();
  final noteController = TextEditingController();
  final pendingAmountController = TextEditingController();
  TextEditingController invoiceNumberController =
      TextEditingController(text: "1 / 2020-2021");
  final supplierRefController = TextEditingController();
  final orderDateController = TextEditingController();
  final despatchDocNoController = TextEditingController();
  final despatchThroughController = TextEditingController();
  final unitController = TextEditingController();
  final destinationController = TextEditingController();
  final customerController = TextEditingController();
  final rateController = TextEditingController();
  final priceController = TextEditingController();
  final taxController = TextEditingController();
  List<SalesProductModel> salesProductModelList = [];
  SalesProductModel? selectedSalesProductModel;

  final priceModelFocusNode = FocusNode();
  final customerFocusNode = FocusNode();
  final priceNode = FocusNode();
  final rateKeyboardFocusNode = FocusNode();
  final priceKeyboardNode = FocusNode();
  FocusNode productNode = FocusNode();

  void performInit() {
    final list = orderDB.getAllOrder();

    invoiceNumberController = TextEditingController(
      text: getBillNo(list.map((e) => e.orderNo).toList()),
    );

    debugPrint('INIT $list');
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

  ProductModel? selectedProductModel;

  CustomerModel? selectedCustomerModel;

  void addSelectedProductModel(ProductModel? productModel) {
    selectedProductModel = productModel;
    update();
  }

  void addSelectedCustomerModel(CustomerModel customerModel) {
    selectedCustomerModel = customerModel;
    update();
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
            getPriceByCustomer(
              selectedProductModel!,
              selectedCustomerModel,
            ),
          ),
          discountPer: discount,
        );
        debugPrint('qtyController $salesProductModel');
        salesProductModelList.add(salesProductModel);
      } else {
        final index = salesProductModelList.indexOf(matchedData[0]);
        final salesProductModel = SalesProductModel(
          categoryModel:
              categoryDB.getCategoryModelById(selectedProductModel!.categoryId),
          productModel: selectedProductModel,
          qty: matchedData[0].qty! + qty,
          price: getPrice(
            qty,
            getPriceByCustomer(
              selectedProductModel!,
              selectedCustomerModel,
            ),
          ),
          discountPer: discount,
        );
        debugPrint('qtyController $salesProductModel');
        salesProductModelList[index] = salesProductModel;
      }
      selectedProductModel = null;
      productController.clear();
      qtyController.clear();
      discountController.clear();
    } catch (e) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Error in adding Product $e",
      );
    }
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
  // void keyboardSelectProductModel() {
  //   final text = productController.text;
  //   debugPrint('text: $text');
  //   final productList = productsList!
  //       .where((suggestion) =>
  //           suggestion.productName.toLowerCase().contains(text.toLowerCase()))
  //       .toList();

  //   /**
  //    * If the Selected Prdouct Model is Empty
  //    */
  //   if (selectedProductModel == null) {
  //     selectedProductModel = productList[0];
  //   } else {
  //     if (productList.contains(selectedProductModel)) {
  //       final index = productList.indexOf(selectedProductModel!);
  //       if (index + 1 == productList.length) {
  //         selectedProductModel = productList[0];
  //       } else {
  //         selectedProductModel = productList[index + 1];
  //       }
  //     } else {
  //       selectedProductModel = productList[0];
  //     }
  //   }
  //   update();
  //   debugPrint('selectedProductModel: $selectedProductModel');
  // }

  // void keyboardSelectCustomerModel() {
  //   final text = customerController.text;
  //   debugPrint('text: $text');
  //   final customerList = customersList!
  //       .where(
  //         (suggestion) =>
  //             suggestion.name.toLowerCase().contains(text.toLowerCase()),
  //       )
  //       .toList();

  //   /**
  //    * If the Selected Prdouct Model is Empty
  //    */
  //   if (selectedCustomerModel == null) {
  //     selectedCustomerModel = customerList[0];
  //   } else {
  //     if (customerList.contains(selectedCustomerModel)) {
  //       final index = customerList.indexOf(selectedCustomerModel!);
  //       if (index + 1 == customerList.length) {
  //         selectedCustomerModel = customerList[0];
  //       } else {
  //         selectedCustomerModel = customerList[index + 1];
  //       }
  //     } else {
  //       selectedCustomerModel = customerList[0];
  //     }
  //   }
  //   update();
  //   debugPrint('selectedCustomerModel: $selectedCustomerModel');
  // }

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
    selectedProductModel = null;
    selectedCustomerModel = null;
    salesProductModelList.clear();
    productController.clear();
    qtyController.clear();
    discountController.clear();
    noteController.clear();
    pendingAmountController.clear();
    supplierRefController.clear();
    orderDateController.clear();
    despatchDocNoController.clear();
    despatchThroughController.clear();
    destinationController.clear();
    customerController.clear();
    update();
  }

  Future<void> addOrderToDB(PrinterEnum? printerEnum) async {
    final orderModel = OrderModel(
      id: const Uuid().v4(),
      orderNo: invoiceNumberController.text,
      price: getGrandTotal(salesProductModelList, selectedCustomerModel),
      productList: salesProductModelList,
      customerModel: selectedCustomerModel!,
      dateTime: pickedDateTime,
      createdAt: DateTime.now(),
    );
    try {
      await orderDB.addOrderToDb(orderModel);
      if (printerEnum != null) {
        if (printerEnum == PrinterEnum.Normal) {
          final data = await PDFGenerator.generateOrder(orderModel);
          final file = File(data);
          await PrinterUtility.normalPrint(file);
        } else {
          final data =
              await PDFGenerator.generateThermalBillForOrders(orderModel);
          final file = File(data);
          await PrinterUtility.thermalPrint(file);
        }
      }
      CustomUtilies.customSuccessSnackBar(
        "Success",
        "Order Added Successfully",
      );
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
