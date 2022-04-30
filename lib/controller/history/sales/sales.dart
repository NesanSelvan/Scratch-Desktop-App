import 'dart:developer';

import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/bill/bill.dart';
import '../../../utils/pdf/pdf.dart';
import '../../billing/sales/sales.dart';
import '../../home/home.dart';

class SalesHistoryNotifier extends GetxController {
  // final salesDB = Database().salesDB;

  void performInit() {
    final allBills = salesDB.getAllBill();
    log("Value: ${salesDB.getAllBill().length}");
    setBillsModelList = allBills;
    update();
    // setSelectedBillModel = allBills[0];
    // if (allBills.isNotEmpty) {}
  }

  @override
  void onInit() {
    performInit();
    super.onInit();
  }

  Future<void> clearAllBills() async {
    return salesDB.clearAll();
  }

  BillModel? _selectedBillModel;
  BillModel? get selectedBillModel => _selectedBillModel;

  // ignore: avoid_setters_without_getters
  set setSelectedBillModel(BillModel billModel) {
    _selectedBillModel = billModel;
    update();
  }

  List<BillModel>? _billsList;
  List<BillModel>? get billsList => _billsList;
  // ignore: avoid_setters_without_getters
  set setBillsModelList(List<BillModel> billModel) {
    _billsList = billModel;
    update();
  }

  void updateSelectedBillModel() {
    int index = _billsList!.indexOf(selectedBillModel!);
    if (index == (_billsList!.length - 1)) {
      index = 0;
    } else {
      index++;
    }
    setSelectedBillModel = _billsList![index];
    debugPrint("Selected Bill NO: ${selectedBillModel!.billNo}");
  }

  Future<void> fixBillNo() async {
    await salesDB.fixBillNo();
    CustomUtilies.customSuccessSnackBar("Update Success", "");
    performInit();
    update();
  }

  Future<void> clearGivenAmount() async {
    await salesDB.clearGivenAmount();
    CustomUtilies.customSuccessSnackBar("Update Success", "");
    performInit();
    update();
  }

  void updateUpSelectedBillModel() {
    int index = _billsList!.indexOf(selectedBillModel!);
    if (index == 0) {
      index = _billsList!.length - 1;
    } else {
      index--;
    }
    setSelectedBillModel = _billsList![index];
    debugPrint("Selected Bill NO: ${selectedBillModel!.billNo}");
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

  void searchBill() {
    final allBill = salesDB.getAllBill();
    allBill.where((element) => element.dateTime == startDateTime);
  }

  Future<void> viewBill(BillModel billModel, HomeController homeController,
      String? upiString) async {
    final data = await PDFGenerator.generateBill(billModel, upiString);
    debugPrint(data);
    try {
      PDFGenerator.openPdf(data);
    } catch (e) {}
    // homeController.setCurrentSelectedWidget(PdfViewer(filePath: data));
    debugPrint(data);
  }

  Future<void> viewThermal(BillModel billModel, HomeController homeController,
      String? upiString) async {
    final data =
        await PDFGenerator.generateThermalBillForSales(billModel, upiString);
    PDFGenerator.openPdf(data);
    // homeController.setCurrentSelectedWidget(PdfViewer(filePath: data));
    // CustomUtilies.navigatePage(
    //     context, PdfViewer(filePath: data));
    debugPrint(data);
  }
}
