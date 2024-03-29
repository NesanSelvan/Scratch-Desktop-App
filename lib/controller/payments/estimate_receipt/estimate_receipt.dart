import 'dart:developer';
import 'dart:io';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/estimate/estimate.dart';
import 'package:annai_store/models/receipts/receipt.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

class EstimateReceiptController extends GetxController {
  // final estimateReceiptDB = Database().estimateReceiptDB;
  TextEditingController receiptNoController = TextEditingController();
  // final billNoController = TextEditingController();
  final givenAmountController = TextEditingController();
  final paymentIDController = TextEditingController();
  final pendingAmountController = TextEditingController();
  final customerController = TextEditingController();
  final salesBillNoController = TextEditingController();
  final receivedFromController = TextEditingController();
  final paymentForController = TextEditingController();

  final FocusNode givenAmountNode = FocusNode();
  final FocusNode paymentMethodNode = FocusNode();
  final FocusNode paymentIDNode = FocusNode();
  final FocusNode receivedFromNode = FocusNode();
  final FocusNode paymentForNode = FocusNode();
  final FocusNode isA4Node = FocusNode();
  final FocusNode isPrintIDNode = FocusNode();

  bool _isA5 = false;
  bool _isPrint = false;

  bool get isA5 => _isA5;
  bool get isPrint => _isPrint;

  set setIsA5(bool? value) {
    if (value == null) {
      return;
    }
    _isA5 = value;
    update();
  }

  set setIsPrint(bool? value) {
    if (value == null) {
      return;
    }
    _isPrint = value;
    update();
  }

  DateTime pickedDateTime = getTodaysDate();

  void setPickedDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      pickedDateTime = dateTime;
    }
    update();
  }

  String selectedPaymentMethod = paymentMethod[0];

  CustomerModel? selectedCustomerModel;

  void setSelectedPaymentMethod(String data) {
    selectedPaymentMethod = data;
    update();
  }

  List<EstimateModel> _billModelList = [];
  List<EstimateModel> get billModelList => _billModelList;

  set setBillModelList(List<EstimateModel> datas) {
    _billModelList = datas;
    update();
  }

  EstimateModel? _selectedBillModel;
  EstimateModel? get selectedBillModel => _selectedBillModel;

  set setSelectedBillModel(EstimateModel? billModel) {
    _selectedBillModel = billModel;

    update();
  }

  void getAllBills() {
    setBillModelList = estimateDB.getAllEstimate();
  }

  void performInit() {
    final allReceipts = estimateReceiptDB.getAllReceipt();
    log("Receipt----- ");
    log("${allReceipts.length}");
    setReceiptsModelList = allReceipts;
    if (allReceipts.isNotEmpty) {
      setSelectedReceiptModel = allReceipts[0];
    }
    final allCustomers = customerDB.getAllCustomer();
    setCustomersModelList = allCustomers;
    receiptNoController = TextEditingController(
      text: getBillNo(allReceipts.map((e) => e.receiptNo).toList()),
    );
    getAllBills();
    update();
  }

  void keyboardSelectCustomerModel() {
    final text = customerController.text;
    debugPrint('text: $text');
    final customerList = customersList!
        .where(
          (suggestion) =>
              suggestion.name.toLowerCase().contains(text.toLowerCase()),
        )
        .toList();

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (selectedCustomerModel == null) {
      selectedCustomerModel = customerList[0];
    } else {
      if (customerList.contains(selectedCustomerModel)) {
        final index = customerList.indexOf(selectedCustomerModel!);
        if (index + 1 == customerList.length) {
          selectedCustomerModel = customerList[0];
        } else {
          selectedCustomerModel = customerList[index + 1];
        }
      } else {
        selectedCustomerModel = customerList[0];
      }
    }
    update();
    debugPrint('selectedCustomerModel: $selectedCustomerModel');
  }

  void keyboardSelectBillModel() {
    final text = salesBillNoController.text;
    debugPrint('text: $text');
    final billList = billModelList
        .where((suggestion) => suggestion.estimateNo.contains(text))
        .toList();

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (_selectedBillModel == null) {
      _selectedBillModel = billList[0];
    } else {
      if (billList.contains(_selectedBillModel)) {
        final index = billList.indexOf(_selectedBillModel!);
        if (index + 1 == billList.length) {
          _selectedBillModel = billList[0];
        } else {
          _selectedBillModel = billList[index + 1];
        }
      } else {
        _selectedBillModel = billList[0];
      }
    }
    log("Customer ${_selectedBillModel?.customerModel}");
    if (_selectedBillModel?.customerModel.id != null) {
      selectedCustomerModel = _selectedBillModel?.customerModel;
    }
    update();
    debugPrint('selectedCustomerModel: $selectedCustomerModel');
  }

  @override
  void onInit() {
    super.onInit();
    performInit();
  }

  void resetInputField() {
    selectedCustomerModel = null;
    setSelectedBillModel = null;
    givenAmountController.clear();
    paymentForController.clear();
    receivedFromController.clear();
    pendingAmountController.clear();
    customerController.clear();
    paymentIDController.clear();
    salesBillNoController.clear();
    performInit();
    update();
  }

  Future clearAllReceipts() async {
    return estimateReceiptDB.clearAll();
  }

  ReceiptModel? _selectedReceiptModel;
  ReceiptModel? get selectedReceiptModel => _selectedReceiptModel;

  // ignore: avoid_setters_without_getters
  set setSelectedReceiptModel(ReceiptModel receiptModel) {
    _selectedReceiptModel = receiptModel;
    update();
  }

  List<ReceiptModel>? _receiptsList;
  List<ReceiptModel>? get receiptsList => _receiptsList;
  // ignore: avoid_setters_without_getters
  set setReceiptsModelList(List<ReceiptModel> receiptModel) {
    _receiptsList = receiptModel;
    update();
  }

  List<CustomerModel>? _customersList;
  List<CustomerModel>? get customersList => _customersList;
  // ignore: avoid_setters_without_getters
  set setCustomersModelList(List<CustomerModel> receiptModel) {
    _customersList = receiptModel;
    update();
  }

  void updateSelectedReceiptModel() {
    int index = _receiptsList!.indexOf(selectedReceiptModel!);
    if (index == (_receiptsList!.length - 1)) {
      index = 0;
    } else {
      index++;
    }
    setSelectedReceiptModel = _receiptsList![index];
    debugPrint("Selected Receipt NO: ${selectedReceiptModel!.receiptNo}");
  }

  void updateUpSelectedReceiptModel() {
    int index = _receiptsList!.indexOf(selectedReceiptModel!);
    if (index == 0) {
      index = _receiptsList!.length - 1;
    } else {
      index--;
    }
    setSelectedReceiptModel = _receiptsList![index];
    debugPrint("Selected Receipt NO: ${selectedReceiptModel!.receiptNo}");
  }

  DateTime startDateTime = DateTime.now();
  DateTime endDateTime = DateTime.now().add(const Duration(days: 2));

  void setPickedStartDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      startDateTime = dateTime;
    }
    update();
  }

  void setPickedEndDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      endDateTime = dateTime;
    }
    update();
  }

  void searchReceipt() {
    final allReceipt = estimateReceiptDB.getAllReceipt();
    allReceipt.where((element) => element.createdAt == startDateTime);
  }

  Future<void> addReceiptData() async {
    log(
      "billNoController.text : ${salesBillNoController.text} ${pendingAmountController.text}",
    );
    try {
      final pendingAmount = double.parse(pendingAmountController.text);
      final givenAmount = double.parse(givenAmountController.text);
      double advanceAmount = 0;
      if (pendingAmount - givenAmount < 0) {
        advanceAmount = givenAmount - pendingAmount;
      }
      final rm = ReceiptModel(
        id: const Uuid().v4(),
        receiptNo: receiptNoController.text,
        givenAmount: givenAmount,
        billNo: salesBillNoController.text,
        pendingAmount: pendingAmount,
        paymentMethod: selectedPaymentMethod,
        advanceAmount: advanceAmount,
        paymentFor: paymentForController.text,
        receivedFrom: receivedFromController.text == ""
            ? selectedCustomerModel!.name
            : receivedFromController.text,
        customerModel: selectedCustomerModel!,
        paymentId: paymentIDController.text,
        createdAt: pickedDateTime,
      );
      await estimateReceiptDB.addReceiptToDb(rm);
      await customerDB.updateCustomer(
        selectedCustomerModel!.copyWith(
          pendingAmount: selectedCustomerModel!.pendingAmount -
              double.parse(givenAmountController.text),
        ),
      );
      if (salesBillNoController.text != "") {
        debugPrint("selectedBillModel : $selectedBillModel");
        if (selectedBillModel != null) {
          final billModel = selectedBillModel?.copyWith(
            givenAmount: selectedBillModel!.givenAmount! + givenAmount,
          );
          debugPrint("Updated Bill Model : $billModel");
          estimateDB.updateEstimate(billModel!);
        }
      }
      // if (isPrint) {
      //   await printReceipt(rm);
      // } else {
      //   await viewReceipt(rm);
      // }
      performInit();
      setPickedDateTime(getTodaysDate());
    } catch (e, s) {
      print(s);
      CustomUtilies.customFailureSnackBar("Error", "$e");
    }
  }

  Future viewReceipt(ReceiptModel e) async {
    if (isA5) {
      final data = await PDFGenerator.generateA5ReceiptBuffer(e);

      PDFGenerator.openBufferPdf(
        data,
        "receipt_${e.receiptNo.replaceAll('/', '-').replaceAll(" ", "-")}",
      );
    } else {
      final data = await PDFGenerator.generateThermalReceiptBuffer(e);

      PDFGenerator.openBufferPdf(
        data,
        "receipt_${e.receiptNo.replaceAll('/', '-').replaceAll(" ", "-")}",
      );
    }
  }

  Future printReceipt(ReceiptModel receiptModel) async {
    if (_isA5) {
      final data = await PDFGenerator.generateA5Receipt(receiptModel);
      await PrinterUtility.normalA5Print(File(data));
    } else {
      final data = await PDFGenerator.generateThermalReceipt(receiptModel);

      // PDFGenerator.openPdf(data);
      // debugPrint(data);
      PrinterUtility.thermalPrint(File(data));
    }
  }

  Future<void> deleteReceipt(ReceiptModel receiptModel) async {
    await estimateReceiptDB.deleteReceipt(receiptModel);
  }
}
