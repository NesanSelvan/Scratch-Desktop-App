import 'dart:developer';

import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SalesHistoryNotifier extends GetxController {
  // final salesDB = Database().salesDB;
  TextEditingController searchController = TextEditingController();

  void search() {
    final search = searchController.text;
    final allBills = salesDB
        .getAllBill()
        .where(
          (element) =>
              element.customerModel.name
                  .toString()
                  .toLowerCase()
                  .contains(search.toLowerCase()) ||
              element.billNo.contains(search),
        )
        .toList();
    log("Value: ${salesDB.getAllBill().length}");
    setBillsModelList = allBills;
    update();
  }

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
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
      "Sales Bill will get cleared",
      onYesTap: () async {
        if (empType == PersonEnum.SoftwareOwner) {
          await salesDB.clearAll();
        } else {
          CustomUtilies.customFailureSnackBar(
            "You cannot delete",
            "Please contact the administrator",
          );
        }
      },
    );
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

  Future<void> viewBill(
    BillModel billModel,
    HomeController homeController,
    String? upiString,
  ) async {
    final data = await PDFGenerator.generateBillBuffer(billModel, upiString);

    try {
      PDFGenerator.openBufferPdf(
        data,
        "sales_${billModel.billNo.replaceAll(' / ', '-')}",
      );
    } catch (e) {}
    // homeController.setCurrentSelectedWidget(PdfViewer(filePath: data));
  }

  Future<void> viewThermal(
    BillModel billModel,
    HomeController homeController,
    String? upiString,
  ) async {
    final data = await PDFGenerator.generateThermalBillForSalesBuffer(
      billModel,
      upiString,
    );
    PDFGenerator.openBufferPdf(
      data,
      "sales_${billModel.billNo.replaceAll(' / ', '-')}",
    );
    // homeController.setCurrentSelectedWidget(PdfViewer(filePath: data));
    // CustomUtilies.navigatePage(
    //     context, PdfViewer(filePath: data));
  }
}
