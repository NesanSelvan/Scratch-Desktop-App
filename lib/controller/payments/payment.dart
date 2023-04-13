import 'dart:io';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/core/constants/calculations/payments/payment.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/payment/payment.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:annai_store/utils/keyboard/keyboard.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

class PaymentController extends GetxController {
  // PaymentModel
  // final receiptDB = Database().receiptDB;
  TextEditingController paymentNoController = TextEditingController();
  // final billNoController = TextEditingController();
  final givenAmountController = TextEditingController();
  final paymentIDController = TextEditingController();
  final pendingAmountController = TextEditingController();
  final purchaseBillNoController = TextEditingController();
  final companyController = TextEditingController();
  final companyPendingAmountController = TextEditingController();
  final totalAmountController = TextEditingController();

  final FocusNode givenAmountNode = FocusNode();
  final FocusNode paymentIDNode = FocusNode();
  final FocusNode pendingAmountNode = FocusNode();
  final FocusNode totalAmountNode = FocusNode();
  final FocusNode purchaseBillNode = FocusNode();
  final FocusNode companyNode = FocusNode();
  final FocusNode companyKeyboardNode = FocusNode();
  final FocusNode purchaseBillKeyboardNode = FocusNode();
  final FocusNode paymentMethodNode = FocusNode();

  DateTime pickedDateTime = getTodaysDate();

  void setPickedDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      pickedDateTime = dateTime;
    }
    update();
  }

  String selectedPaymentMethod = paymentMethod[0];

  void setSelectedPaymentMethod(String data) {
    selectedPaymentMethod = data;
    update();
  }

  List<PurchaseModel> _purchaseBillList = [];
  List<PurchaseModel> get purchaseBillList => _purchaseBillList;

  set setPurchaseModelList(List<PurchaseModel> datas) {
    _purchaseBillList = datas;
    update();
  }

  PurchaseModel? _selectedPurchaseBill;
  PurchaseModel? get selectedPurchaseBill => _selectedPurchaseBill;

  set setSelectedPurchaseBillModel(PurchaseModel? billModel) {
    totalAmountController.clear();
    pendingAmountController.clear();
    setSelectedPaymentModel = null;
    _selectedPurchaseBill = billModel;
    if (billModel != null) {
      totalAmountController.text = _selectedPurchaseBill!.grandTotal.toString();
      pendingAmountController.text = PaymentCalculation.getPendingAmount(
        _selectedPurchaseBill!.id,
        _selectedPaymentModel,
      ).toStringAsFixed(2);
    }
    update();
  }

  List<CompanyModel> _allCompaniesModel = [];
  List<CompanyModel> get allCompaniesModel => _allCompaniesModel;

  set setCompanyModelList(List<CompanyModel> datas) {
    _allCompaniesModel = datas;
    update();
  }

  CompanyModel? _selectedCompanyModel;
  CompanyModel? get selectedCompanyModel => _selectedCompanyModel;

  void setSelectedCompanyModel(CompanyModel? companyModel) {
    _selectedCompanyModel = companyModel;
    update();
  }

  set selectedCompanyModel(CompanyModel? billModel) {
    _selectedCompanyModel = billModel;
    if (_selectedCompanyModel != null) {
      companyController.text = "${_selectedCompanyModel?.name}";
      final pendingAmount = purchaseDB
          .getPendingAmountByCompany(_selectedCompanyModel!.id)
          .toStringAsFixed(2);
      print("_pendingAmount: $pendingAmount");
      companyPendingAmountController.text = pendingAmount;
    } else {
      companyController.text = "";
      companyPendingAmountController.text = "0";
    }
    getAllPurchaseBillsByComanyId();
    update();
  }

  void keyboardSelectCompanyModel(KeyboardEventEnum keyboardEventEnum) {
    final text = companyController.text;
    setSelectedCompanyModel(
      KeyboardUtilities.keyboardSelectCompanyModel(
        text,
        allCompaniesModel,
        selectedCompanyModel,
        keyboardEventEnum,
      ),
    );
    update();
  }

  void onPaymentTap(PaymentModel paymentModel) {
    setSelectedPaymentModel = paymentModel;
    update();
  }

  void getAllPurchaseBillsByComanyId() {
    setPurchaseModelList = [];
    if (_selectedCompanyModel != null) {
      setPurchaseModelList =
          purchaseDB.getPurchaseBillByCompanyId(_selectedCompanyModel!.id);
    }
    update();
  }

  void performInit() {
    setCompanyModelList = companyDB.getAllCompany();
    final allPayments = paymentDB.getAllPayment();
    debugPrint("All Payments : $allPayments");

    setReceiptsModelList = allPayments;
    // if (allPayments.isNotEmpty) {
    //   setSelectedPaymentModel = allPayments[0];
    // }

    paymentNoController = TextEditingController(
      text: getBillNo(allPayments.map((e) => e.paymentNo).toList()),
    );

    update();
  }

  void keyboardSelectPurchaseBillModel(KeyboardEventEnum keyboardEventEnum) {
    setSelectedPurchaseBillModel =
        KeyboardUtilities.keyboardSelectPurchaseModel(
      purchaseBillNoController.text,
      _purchaseBillList,
      selectedPurchaseBill,
      keyboardEventEnum,
    );

    update();
  }

  @override
  void onInit() {
    super.onInit();
    performInit();
  }

  void resetInputField() {
    purchaseBillNoController.clear();
    totalAmountController.clear();
    pendingAmountController.clear();
    givenAmountController.clear();
    paymentIDController.clear();
    setSelectedPurchaseBillModel = null;

    setSelectedPaymentModel = null;
    selectedCompanyModel = null;

    update();
  }

  PaymentModel? _selectedPaymentModel;
  PaymentModel? get selectedPaymentModel => _selectedPaymentModel;

  // ignore: avoid_setters_without_getters
  set setSelectedPaymentModel(PaymentModel? paymentModel) {
    _selectedPaymentModel = paymentModel;
    if (paymentModel != null) {
      final pur = purchaseDB.getPurchaseModelById(paymentModel.purchaseId);
      if (pur != null) {
        purchaseBillNoController.text = pur.billNo;
        totalAmountController.text = pur.grandTotal.toString();
      }
      givenAmountController.text = paymentModel.givenAmount.toString();
      setSelectedPaymentMethod(paymentModel.paymentMethod);
      paymentIDController.text = paymentModel.paymentID;
      pendingAmountController.text = PaymentCalculation.getPendingAmount(
        paymentModel.purchaseId,
        _selectedPaymentModel,
      ).toStringAsFixed(2);
    }

    update();
  }

  List<PaymentModel>? _paymentList;
  List<PaymentModel>? get paymentList => _paymentList;

  set setReceiptsModelList(List<PaymentModel> paymentModel) {
    _paymentList = paymentModel;
    update();
  }

  void updateSelectedPaymentModel() {
    int index = _paymentList!.indexOf(selectedPaymentModel!);
    if (index == (_paymentList!.length - 1)) {
      index = 0;
    } else {
      index++;
    }
    setSelectedPaymentModel = _paymentList![index];
    debugPrint("Selected Receipt NO: ${selectedPaymentModel!.paymentNo}");
  }

  void updateUpSelectedReceiptModel() {
    int index = _paymentList!.indexOf(selectedPaymentModel!);
    if (index == 0) {
      index = _paymentList!.length - 1;
    } else {
      index--;
    }
    setSelectedPaymentModel = _paymentList![index];
    debugPrint("Selected Receipt NO: ${selectedPaymentModel!.paymentNo}");
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

  Future<void> deletePaymentById(PaymentModel paymentModel) async {
    await paymentDB.deletePayment(paymentModel);
  }

  Future<void> addPaymentData(BuildContext context) async {
    // if (_selectedPurchaseBill != null) {
    try {
      final givenAmount = double.parse(givenAmountController.text);

      final pm = PaymentModel(
        id: const Uuid().v4(),
        paymentNo: paymentNoController.text,
        givenAmount: givenAmount,
        paymentMethod: selectedPaymentMethod,
        purchaseId: _selectedPurchaseBill?.id ?? "",
        paymentID: paymentIDController.text,
        createdAt: pickedDateTime,
        purchaseModel: _selectedPurchaseBill,
        companyModel: _selectedCompanyModel,
      );
      await paymentDB.addPaymentToDb(pm);
      if (_selectedPurchaseBill != null) {
        await purchaseDB.updatePurchase(
          _selectedPurchaseBill!.copyWith(
            paymentsIdList: [..._selectedPurchaseBill!.paymentsIdList, pm.id],
          ),
        );
      }
      performInit();
      setPickedDateTime(getTodaysDate());
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "$e");
    }
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("Please Select a Purchase Bill"),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    // }
  }

  Future<void> printPayment(PaymentModel e) async {
    final data = await PDFGenerator.generateA5PaymentModel(e);
    await PrinterUtility.normalA5Print(File(data));
  }

  // Future<void> deleteReceipt(ReceiptModel paymentModel) async {
  //   await receiptDB.deleteReceipt(paymentModel);
  // }
}
