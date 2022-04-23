import 'dart:io';

import 'package:annai_store/core/constants/constants.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

import '../../../models/bill/bill.dart';
import '../../../models/customer/customer.dart';
import '../../../models/receipts/receipt.dart';
import '../../../utils/pdf/pdf.dart';
import '../../../utils/printer/printer.dart';
import '../../billing/sales/sales.dart';

class ReceiptController extends GetxController {
  // final receiptDB = Database().receiptDB;
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

  List<BillModel> _billModelList = [];
  List<BillModel> get billModelList => _billModelList;

  set setBillModelList(List<BillModel> datas) {
    _billModelList = datas;
    update();
  }

  BillModel? _selectedBillModel;
  BillModel? get selectedBillModel => _selectedBillModel;

  set setSelectedBillModel(BillModel? billModel) {
    _selectedBillModel = billModel;
    update();
  }

  void getAllBills() {
    setBillModelList = salesDB.getAllBill();
  }

  void performInit() {
    final allReceipts = receiptDB.getAllReceipt();
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
        .where((suggestion) => suggestion.billNo.contains(text))
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
    return receiptDB.clearAll();
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
    final allReceipt = receiptDB.getAllReceipt();
    allReceipt.where((element) => element.createdAt == startDateTime);
  }

  Future<void> addReceiptData() async {
    debugPrint("billNoController.text : ${salesBillNoController.text}");
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
      await receiptDB.addReceiptToDb(rm);
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
          salesDB.updateBill(billModel!);
        }
      }
      if (isPrint) {
        await printReceipt(rm);
      } else {
        await viewReceipt(rm);
      }
      performInit();
      setPickedDateTime(getTodaysDate());
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "$e");
    }
  }

  Future viewReceipt(ReceiptModel e) async {
    if (isA5) {
      final data = await PDFGenerator.generateA5Receipt(e);
      debugPrint(data);
      PDFGenerator.openPdf(data);
      debugPrint(data);
    } else {
      final data = await PDFGenerator.generateThermalReceipt(e);
      debugPrint(data);
      PDFGenerator.openPdf(data);
      debugPrint(data);
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
    await receiptDB.deleteReceipt(receiptModel);
  }
}
