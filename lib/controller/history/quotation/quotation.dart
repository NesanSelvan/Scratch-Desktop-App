import 'package:annai_store/models/quotations/quotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/pdf/pdf.dart';
import '../../billing/sales/sales.dart';
import '../../home/home.dart';

class QuotationHistoryNotifier extends GetxController {
  // final quotationDB = Database().quotationDB;

  void performInit() {
    final allQuotations = quotationDB.getAllQuotation();
    if (allQuotations.isNotEmpty) {
      setQuotationsModelList = allQuotations;
      setSelectedQuotationModel = allQuotations[0];
    }
  }

  @override
  void onInit() {
    performInit();
    super.onInit();
  }

  Future<void> clearAllQuotations() async {
    return quotationDB.clearAll();
  }

  QuotationModel? _selectedQuotationModel;
  QuotationModel? get selectedQuotationModel => _selectedQuotationModel;

  // ignore: avoid_setters_without_getters
  set setSelectedQuotationModel(QuotationModel quotationModel) {
    _selectedQuotationModel = quotationModel;
    update();
  }

  List<QuotationModel>? _quotationsList;
  List<QuotationModel>? get quotationsList => _quotationsList;
  // ignore: avoid_setters_without_getters
  set setQuotationsModelList(List<QuotationModel> quotationModel) {
    _quotationsList = quotationModel;
    update();
  }

  void updateSelectedQuotationModel() {
    int index = _quotationsList!.indexOf(selectedQuotationModel!);
    if (index == (_quotationsList!.length - 1)) {
      index = 0;
    } else {
      index++;
    }
    setSelectedQuotationModel = _quotationsList![index];
    debugPrint("Selected Quotation NO: ${selectedQuotationModel!.quotationNo}");
  }

  void updateUpSelectedQuotationModel() {
    int index = _quotationsList!.indexOf(selectedQuotationModel!);
    if (index == 0) {
      index = _quotationsList!.length - 1;
    } else {
      index--;
    }
    setSelectedQuotationModel = _quotationsList![index];
    debugPrint("Selected Quotation NO: ${selectedQuotationModel!.quotationNo}");
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

  void searchQuotation() {
    final allQuotation = quotationDB.getAllQuotation();
    allQuotation.where((element) => element.dateTime == startDateTime);
  }

  Future<void> viewQuotation(
      QuotationModel quotationModel, HomeController homeController) async {
    final data = await PDFGenerator.generateQuotation(quotationModel);
    PDFGenerator.openPdf(data);
    // homeController.setCurrentSelectedWidget(PdfViewer(filePath: data));
    debugPrint(data);
  }

  Future<void> viewThermal(
      QuotationModel billModel, HomeController homeController) async {
    final data = await PDFGenerator.generateThermalBillForQuotation(billModel);
    PDFGenerator.openPdf(data);
    debugPrint(data);
  }
}
