import 'dart:io';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/enum/printer/printer.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/price/price.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:annai_store/models/sewing_service/sewing_service.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/utils/keyboard/keyboard.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

class SalesBillingFourController extends GetxController {
  DateTime pickedDateTime = getTodaysDate();

  final productController = TextEditingController();
  final unitController = TextEditingController();
  final qtyController = TextEditingController();
  final priceController = TextEditingController();
  final taxController = TextEditingController();
  final rateController = TextEditingController();
  final discountController = TextEditingController();
  final noteController = TextEditingController();
  TextEditingController invoiceNumberController =
      TextEditingController();
  final supplierRefController = TextEditingController();
  final orderDateController = TextEditingController();
  final despatchDocNoController = TextEditingController();
  final despatchThroughController = TextEditingController();
  final destinationController = TextEditingController();
  final customerController = TextEditingController();
  List<SalesProductModel> salesProductModelList = [];
  SalesProductModel? selectedSalesProductModel;
  final customerFocusNode = FocusNode();
  final priceModelFocusNode = FocusNode();
  final rateFocusNode = FocusNode();
  final rateKeyboardFocusNode = FocusNode();
  final priceNode = FocusNode();
  final priceKeyboardNode = FocusNode();

  final qtyNode = FocusNode();
  final qtyKeyboardNode = FocusNode();

  final discountNode = FocusNode();
  final discountKeyboardNode = FocusNode();

  final productNode = FocusNode();
  final productKeyboardNode = FocusNode();

  bool _isProductExists = true;
  bool get isProductExists => _isProductExists;
  set setIsProductExists(bool value) {
    _isProductExists = value;
    update();
  }

  BillModel? _billModel;
  BillModel? get billModel => _billModel;

  set setBillModel(BillModel billModel) {
    _billModel = billModel;
    update();
  }

  BillModel? _oldBillModel;
  BillModel? get oldBillModel => _oldBillModel;

  set setOldBillModel(BillModel billModel) {
    _oldBillModel = billModel;
    update();
  }

  void onPriceModelArrowRight() {
    debugPrint("Movibg Right");
    if (_selectedProductModel != null) {
      if (_selectedPriceModel == null) {
        _selectedPriceModel = _selectedProductModel?.differentPriceList?.first;
      } else {
        int? index = _selectedProductModel?.differentPriceList
            ?.indexOf(_selectedPriceModel!);
        debugPrint("Index : $index");
        if (index == _selectedProductModel!.differentPriceList!.length - 1) {
          index = -1;
        }
        _selectedPriceModel =
            _selectedProductModel!.differentPriceList![(index ?? 0) + 1];
      }
    }
    priceModelFocusNode.requestFocus();
    debugPrint("Moving Right : $_selectedPriceModel");
    update();
  }

  void performInit() {
    rateFocusNode.addListener(() {
      if (rateFocusNode.hasFocus) {
        rateController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: rateController.text.length,
        );
      }
    });
    priceNode.addListener(() {
      if (priceNode.hasFocus) {
        priceController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: priceController.text.length,
        );
      }
    });
    qtyNode.addListener(() {
      if (qtyNode.hasFocus) {
        qtyController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: qtyController.text.length,
        );
      }
    });
    discountNode.addListener(() {
      if (discountNode.hasFocus) {
        discountController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: discountController.text.length,
        );
      }
    });
    productNode.addListener(() {
      if (productNode.hasFocus) {
        productController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: productController.text.length,
        );
      }
    });
    customerFocusNode.addListener(() {
      if (customerFocusNode.hasFocus) {
        customerController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: customerController.text.length,
        );
      }
    });
    if (_billModel == null) {
      final list = salesDB.getAllBill();
      // debugPrint(
      //     "BillNO List: ${getBillNo(list.map((e) => e.billNo).toList())}");
      invoiceNumberController.text =
          getSalesBillNo(list.map((e) => e.billNo).toList());
    } else {
      setAllFieldForSelectedBill();
    }

    getSewingServiceInvoiceNo();

    update();
  }

  void setAllFieldForSelectedBill() {
    customerFocusNode.unfocus();
    selectedCustomerModel = _billModel!.customerModel;
    customerController.text = _billModel!.customerModel.name;

    noteController.text = _billModel!.note ?? "";
    invoiceNumberController.text = _billModel!.billNo;

    salesProductModelList = _billModel!.productList!;

    supplierRefController.text = _billModel!.supplierRef ?? "";
    orderDateController.text = _billModel!.buyerOrderDate == null
        ? ""
        : getFormattedDate(_billModel!.buyerOrderDate!);
    despatchDocNoController.text = _billModel!.dispatchDocumentNo ?? "";
    destinationController.text = _billModel!.destination ?? "";
    pickedDateTime = _billModel!.dateTime;
    update();
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
                  .getCategoryModelById(_selectedProductModel!.categoryId)
                  .tax,
            ))
        .toStringAsFixed(2);
  }

  ProductModel? _selectedProductModel;
  ProductModel? get selectedProductModel => _selectedProductModel;

  set addSelectedProductModel(ProductModel? productModel) {
    debugPrint("Add Product IS Been Called");
    _selectedProductModel = productModel;
    setSelectedPriceModel = null;
    if (productModel != null) {
      taxController.text = categoryDB
          .getCategoryModelById(productModel.categoryId)
          .tax
          .toString();
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

    update();
  }

  CustomerModel? selectedCustomerModel;

  void addSelectedCustomerModel(CustomerModel? customerModel) {
    if (salesProductModelList.isEmpty) {
      selectedCustomerModel = customerModel;
    } else {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Please Don't change Customer Name once the product are Added",
      );
    }
    update();
  }

  bool _isProfit = true;
  bool get isProfit => _isProfit;
  set setIsProfit(bool val) {
    _isProfit = val;
    update();
  }

  void onDiscountChange(String val) {
    try {
      final double discount = val == "" ? 0 : double.parse(val);
      final qty = double.parse(qtyController.text);
      final rate = double.parse(rateController.text);
      final price = getPrice(qty, rate);
      final salesProductModel = SalesProductModel(
        categoryModel:
            categoryDB.getCategoryModelById(selectedProductModel!.categoryId),
        productModel: selectedProductModel,
        priceModel: selectedPriceModel,
        qty: qty,
        price: price,
        rate: rate,
        discountPer: discount,
      );
      debugPrint("Sales: $salesProductModel");
      final amount = getTotalAmount(salesProductModel, selectedCustomerModel);
      final singlePriceAmount = amount / qty;
      debugPrint("Purchase : ${selectedProductModel!.purchasePrice}");
      debugPrint("Single Price : $singlePriceAmount");
      if (selectedProductModel!.purchasePrice >= singlePriceAmount) {
        debugPrint("No Profit");
        setIsProfit = false;
      } else {
        debugPrint("Profit");
        setIsProfit = true;
      }
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "Error : $e");
    }
  }

  void addSelectedSalesProductModel() {
    if (selectedCustomerModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Error!",
        "Please Select the customer First",
      );
      return;
    }

    print("Sales Price : ${_selectedProductModel!.sellingPrice}");
    for (final item in salesProductModelList) {
      print("Sales Price : ${item.price! / item.qty!}");
    }
    try {
      debugPrint(
        'qtyController.text ${categoryDB.getCategoryModelById(_selectedProductModel!.categoryId)}',
      );
      final qty = double.parse(qtyController.text);
      final rate = double.parse(rateController.text);
      double discount = 0;
      try {
        discount = double.parse(discountController.text);
      } catch (e) {
        discount = 0;
      }
      final matchedData = salesProductModelList
          .where(
            (element) =>
                element.productModel!.id == _selectedProductModel!.id &&
                element.priceModel?.unitModel.id ==
                    selectedPriceModel?.unitModel.id &&
                _selectedProductModel!.sellingPrice ==
                    (element.price! / element.qty!),
          )
          .toList();

      if (matchedData.isEmpty) {
        // final salesProductModel = SalesProductModel(
        //     categoryModel: categoryDB
        //         .getCategoryModelById(_selectedProductModel!.categoryId),
        //     productModel: _selectedProductModel,
        //     qty: qty,
        //     price: getPrice(
        //         qty,
        //         getPriceByCustomer(
        //             _selectedProductModel!, selectedCustomerModel)),
        //     discountPer: discount);
        final salesProductModel = SalesProductModel(
          categoryModel: categoryDB
              .getCategoryModelById(_selectedProductModel!.categoryId),
          productModel: _selectedProductModel,
          priceModel: selectedPriceModel,
          qty: qty,
          rate: rate,
          price: getPrice(qty, rate),
          discountPer: discount,
        );
        debugPrint('qtyController $salesProductModel');
        salesProductModelList.add(salesProductModel);
      } else {
        final index = salesProductModelList.indexOf(matchedData[0]);

        final salesProductModel = SalesProductModel(
          categoryModel: categoryDB
              .getCategoryModelById(_selectedProductModel!.categoryId),
          productModel: _selectedProductModel,
          qty: salesProductModelList[index].qty! + qty,
          rate: rate,
          priceModel: selectedPriceModel,
          price: getPrice(qty, rate),
          discountPer: discount,
        );

        debugPrint('qtyController $salesProductModel');
        salesProductModelList[index] = salesProductModel;
      }
      addSelectedProductModel = null;
      productController.clear();
      qtyController.clear();
      discountController.clear();
      rateController.clear();
    } catch (e) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Error in adding Product $e",
      );
    }
    update();
  }

  void updateTextFieldOnSalesProductSelected() {
    if (selectedSalesProductModel != null) {
      _selectedProductModel = selectedSalesProductModel?.productModel;
      setSelectedPriceModel = selectedSalesProductModel?.priceModel;
      productController.text = _selectedProductModel!.productName;
      discountController.text = selectedSalesProductModel?.discountPer == null
          ? ""
          : "${selectedSalesProductModel?.discountPer}";
      qtyController.text = "${selectedSalesProductModel!.qty ?? 1}";
    }
  }

  void onSalesModelTap(SalesProductModel salesProductModel) {
    selectedSalesProductModel = salesProductModel;
    updateTextFieldOnSalesProductSelected();
    update();
  }

  void keyboardSelectProductModel(KeyboardEventEnum keyboardEventEnum) {
    final text = productController.text;
    addSelectedProductModel = KeyboardUtilities.keyboardSelectProductModel(
      text,
      productsList ?? [],
      selectedProductModel,
      keyboardEventEnum,
      isSpecialSearch: true,
    );
    update();
    debugPrint('_selectedProductModel: $_selectedProductModel');
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

  void keyboardSelectCustomerModel(KeyboardEventEnum keyboardEventEnum) {
    final text = customerController.text;
    addSelectedCustomerModel(
      KeyboardUtilities.keyboardSelectCustomerModel(
        text,
        customersList ?? [],
        selectedCustomerModel,
        keyboardEventEnum,
      ),
    );
    update();
    debugPrint('selectedCustomerModel: $selectedCustomerModel');
  }

  void clearTFS() {
    _selectedProductModel = null;
    _selectedPriceModel = null;
    productController.clear();
    rateController.clear();
    qtyController.clear();
    discountController.clear();
    taxController.clear();
    unitController.clear();
    _selectedUnitModel = null;
  }

  void clearAll() {
    _billModel = null;
    _selectedProductModel?.differentPriceList?.clear();
    _selectedProductModel = null;
    selectedCustomerModel = null;
    _selectedPriceModel = null;

    salesProductModelList.clear();
    productController.clear();
    rateController.clear();
    qtyController.clear();
    discountController.clear();
    noteController.clear();
    supplierRefController.clear();
    orderDateController.clear();
    despatchDocNoController.clear();
    despatchThroughController.clear();
    destinationController.clear();
    customerController.clear();
    priceController.clear();
    taxController.clear();
    customerFocusNode.requestFocus();
    debugPrint("Selected Product :$_selectedProductModel");
    update();
  }

  Future<void> addBillToDB(
    SalesBillingController salesBillingController,
    PrinterEnum printerEnum,
  ) async {
    debugPrint("destinationController.text: ${destinationController.text}");
    if (productsList!.isNotEmpty) {
      // if(salesBillingController)
      if (_billModel == null) {
        await salesBillingController.addBillToDB(
          invoiceNumberController.text,
          selectedCustomerModel,
          salesProductModelList,
          noteController.text,
          supplierRefController.text,
          orderDateController.text,
          despatchDocNoController.text,
          destinationController.text,
          performInit,
          clearAll,
          pickedDateTime,
          printerEnum,
        );
      } else {
        if (salesProductModelList.isEmpty) {
          CustomUtilies.customFailureSnackBar(
            "Error",
            "Please add some Product",
          );
          return;
        }
        await salesBillingController.updateBill(
          _billModel!.copyWith(
            customerModel: selectedCustomerModel ?? _billModel!.customerModel,
            borrowId: "",
            dateTime: pickedDateTime,
            price:
                getGrandTotal(salesProductModelList, _billModel!.customerModel),
            productList: salesProductModelList,
            note: noteController.text,
            supplierRef: supplierRefController.text,
            buyerOrderNo: orderDateController.text,
            dispatchDocumentNo: despatchDocNoController.text,
            dispatchThrough: despatchThroughController.text,
            destination: destinationController.text,
          ),
        );
        CustomUtilies.customSuccessSnackBar(
          "Success",
          "Bill Updated Successfully",
        );
        clearAll();
        performInit();
      }
      setPickedDateTime(getTodaysDate());
    } else {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Please Select products to put bill",
      );
    }
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

  // Sewing Service

  FocusNode sewingServiceInvoiceNoNode = FocusNode();
  FocusNode sewingServiceInvoiceNoKeyboardNode = FocusNode();
  TextEditingController sewingServiceInvoiceNoController =
      TextEditingController();

  void getSewingServiceInvoiceNo() {
    final list = sewingServiceDB.getAllSewingService();
    sewingServiceInvoiceNoController.text =
        getBillNo(list.map((e) => e.billNo).toList());
  }

  Future<void> addSewingServiceToDB() async {
    final sewingService = SewingService(
      id: const Uuid().v4(),
      billNo: sewingServiceInvoiceNoController.text,
      customerModel: null,
      dateTime: DateTime.now(),
    );
    final path =
        await PDFGenerator.generateThermalBillForSewingService(sewingService);
    final file = File(path);
    await PrinterUtility.thermalPrint(file);
    final customerpath =
        await PDFGenerator.generateThermalBillForSewingServiceForCustomer(
      sewingService,
    );
    final tfile = File(customerpath);
    await PrinterUtility.thermalPrint(tfile);
    // PDFGenerator.openPdf(path);
    await sewingServiceDB.addSewingServiceToDb(sewingService);
    performInit();
  }
}
