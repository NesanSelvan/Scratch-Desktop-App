import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/models/estimate/estimate.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../enum/printer/printer.dart';
import '../../../utils/pdf/pdf.dart';
import '../../billing/sales/sales.dart';

class EstimateHistoryNotifier extends GetxController {
  // final estimateDB = Database().estimateDB;
  final startController = TextEditingController();
  final endController = TextEditingController();

  EstimateModel? _startSelectedEstimateModel;
  EstimateModel? get startSelectedEstimateModel => _startSelectedEstimateModel;
  set setStartSelectedEstimateModel(EstimateModel? estimateModel) {
    _startSelectedEstimateModel = estimateModel;
    update();
  }

  EstimateModel? _endSelectedEstimateModel;
  EstimateModel? get endSelectedEstimateModel => _endSelectedEstimateModel;
  set setEndSelectedEstimateModel(EstimateModel? estimateModel) {
    _endSelectedEstimateModel = estimateModel;
    update();
  }

  bool _isSelectAllEstimate = false;
  bool get isSelectAllEstimate => _isSelectAllEstimate;
  set setIsSelectAllEstimate(bool? val) {
    if (val != null) {
      _isSelectAllEstimate = val;
    }
    update();
  }

  Future addAndUpdateEstimate(EstimateModel estimate,
      SalesBillingController salesBillingController) async {
    if (estimate.billId == null || estimate.billId == "") {
      final billId = const Uuid().v4();
      await salesBillingController.addBillToDB(
        getBillNo(salesDB.getAllBill().map((e) => e.billNo).toList()),
        estimate.customerModel,
        estimate.productList,
        "",
        "",
        "",
        "",
        "",
        () {},
        () {},
        estimate.createdAt,
        PrinterEnum.None,
        billID: billId,
      );
      await estimateDB.updateEstimate(estimate.copyWith(billId: billId));
      // await estimateDB.deleteEstimate(estimate);
    }
  }

  Future convertToBill() async {
    final salesBillingController = SalesBillingController();
    if (estimatesList == null) {
      performInit();
    }
    if (isSelectAllEstimate) {
      for (final estimate in estimatesList!) {
        await addAndUpdateEstimate(estimate, salesBillingController);
      }
    } else {
      if (startController.text == "" || endController.text == "") {
        CustomUtilies.customFailureSnackBar(
          "Error",
          "Please select Start date and End Date",
        );
        return;
      }
      final estList = estimatesList!
          .where(
            (element) =>
                getNoFromBillNo(element.estimateNo) >=
                    getNoFromBillNo(startController.text) &&
                getNoFromBillNo(element.estimateNo) <=
                    getNoFromBillNo(endController.text),
          )
          .toList();
      for (final estimate in estList) {
        await addAndUpdateEstimate(estimate, salesBillingController);
      }
      startController.clear();
      endController.clear();
      setStartSelectedEstimateModel = null;
      setEndSelectedEstimateModel = null;
    }

    setSelectedEstimateModel = null;
    estimatesList?.clear();
    update();
    performInit();
    CustomUtilies.customSuccessSnackBar(
      "Success",
      "Estimate Converted to bill",
    );
  }

  void performInit() {
    final allestimates = estimateDB.getAllEstimate();
    if (allestimates.isNotEmpty) {
      setEstimatesModelList = allestimates;
      setSelectedEstimateModel = allestimates[0];
    }

    update();
  }

  void keyboardSelectStartEstimateModel() {
    final text = startController.text;
    debugPrint('text: $text');
    final estList = estimatesList!
        .where((element) => element.billId == "")
        .where(
          (suggestion) =>
              suggestion.estimateNo.toLowerCase().contains(text.toLowerCase()),
        )
        .toList();

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (startSelectedEstimateModel == null) {
      setStartSelectedEstimateModel = estList[0];
    } else {
      if (estList.contains(startSelectedEstimateModel)) {
        final index = estList.indexOf(startSelectedEstimateModel!);
        if (index + 1 == estList.length) {
          setStartSelectedEstimateModel = estList[0];
        } else {
          setStartSelectedEstimateModel = estList[index + 1];
        }
      } else {
        setStartSelectedEstimateModel = estList[0];
      }
    }
    update();
    debugPrint('startSelectedEstimateModel: $startSelectedEstimateModel');
  }

  void keyboardSelectEndEstimateModel() {
    final text = endController.text;
    debugPrint('text: $text');
    final estList = estimatesList!
        .where((element) => element.billId == "")
        .where(
          (element) =>
              int.parse(element.estimateNo.split("/").first.trim()) >
              int.parse(
                startController.text.contains("/")
                    ? startController.text.split("/").first.trim()
                    : "0",
              ),
        )
        .where(
          (suggestion) =>
              suggestion.estimateNo.toLowerCase().contains(text.toLowerCase()),
        )
        .toList();

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (_endSelectedEstimateModel == null) {
      setEndSelectedEstimateModel = estList[0];
    } else {
      if (estList.contains(_endSelectedEstimateModel)) {
        final index = estList.indexOf(_endSelectedEstimateModel!);
        if (index + 1 == estList.length) {
          setEndSelectedEstimateModel = estList[0];
        } else {
          setEndSelectedEstimateModel = estList[index + 1];
        }
      } else {
        setEndSelectedEstimateModel = estList[0];
      }
    }
    update();
    debugPrint('_endSelectedEstimateModel: $_endSelectedEstimateModel');
  }

  @override
  void onInit() {
    performInit();
    super.onInit();
  }

  Future clearAllestimates() {
    return estimateDB.clearAll();
  }

  EstimateModel? _selectedEstimateModel;
  EstimateModel? get selectedEstimateModel => _selectedEstimateModel;

  // ignore: avoid_setters_without_getters
  set setSelectedEstimateModel(EstimateModel? estimateModel) {
    _selectedEstimateModel = estimateModel;

    update();
  }

  List<EstimateModel>? _estimatesList;
  List<EstimateModel>? get estimatesList => _estimatesList;
  // ignore: avoid_setters_without_getters
  set setEstimatesModelList(List<EstimateModel> estimateModel) {
    _estimatesList = estimateModel;
    update();
  }

  void updateSelectedEstimateModel() {
    int index = _estimatesList!.indexOf(selectedEstimateModel!);
    if (index == (_estimatesList!.length - 1)) {
      index = 0;
    } else {
      index++;
    }
    setSelectedEstimateModel = _estimatesList![index];
    debugPrint("Selected Estimate NO: ${selectedEstimateModel!.estimateNo}");
  }

  void updateUpSelectedEstimateModel() {
    int index = _estimatesList!.indexOf(selectedEstimateModel!);
    if (index == 0) {
      index = _estimatesList!.length - 1;
    } else {
      index--;
    }
    setSelectedEstimateModel = _estimatesList![index];
    debugPrint("Selected Estimate NO: ${selectedEstimateModel!.estimateNo}");
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

  void searchEstimate() {
    final allEstimate = estimateDB.getAllEstimate();
    allEstimate.where((element) => element.dateTime == startDateTime);
  }

  Future<void> viewEstimate(EstimateModel estimateModel) async {
    final data = await PDFGenerator.generateEstimate(estimateModel);
    PDFGenerator.openPdf(data);
    // homeController.setCurrentSelectedWidget(PdfViewer(filePath: data));
    // CustomUtilies.navigatePage(
    //     context, PdfViewer(filePath: data));
    debugPrint(data);
  }

  Future<void> viewThermal(EstimateModel billModel) async {
    final data = await PDFGenerator.generateThermalBillForEstimate(billModel);
    PDFGenerator.openPdf(data);
    debugPrint(data);
  }
}
