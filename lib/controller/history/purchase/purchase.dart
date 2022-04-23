import 'package:annai_store/models/purchase/purchase.dart';
import 'package:get/get.dart';

import '../../billing/sales/sales.dart';

class PurchaseHistoryNotifier extends GetxController {
  // final purchaseDB = Database().purchaseDB;

  void performInit() {
    final allPurchase = purchaseDB.getAllPurchase();
    if (allPurchase.isNotEmpty) {
      setPurchasesModelList = allPurchase;
      setSelectedPurchaseModel = allPurchase[0];
    } else {
      setPurchasesModelList = [];
    }
  }

  @override
  void onInit() {
    performInit();
    super.onInit();
  }

  Future<void> clearAlPurchase() async {
    return purchaseDB.clearAll();
  }

  PurchaseModel? _selectedPurchaseModel;
  PurchaseModel? get selectedPurchaseModel => _selectedPurchaseModel;

  // ignore: avoid_setters_without_getters
  set setSelectedPurchaseModel(PurchaseModel quotationModel) {
    _selectedPurchaseModel = quotationModel;
    update();
  }

  List<PurchaseModel>? _quotationsList;
  List<PurchaseModel>? get quotationsList => _quotationsList;
  // ignore: avoid_setters_without_getters
  set setPurchasesModelList(List<PurchaseModel> quotationModel) {
    _quotationsList = quotationModel;
    update();
  }

  void updateSelectedPurchaseModel() {
    int index = _quotationsList!.indexOf(selectedPurchaseModel!);
    if (index == (_quotationsList!.length - 1)) {
      index = 0;
    } else {
      index++;
    }
    setSelectedPurchaseModel = _quotationsList![index];
  }

  void updateUpSelectedPurchaseModel() {
    int index = _quotationsList!.indexOf(selectedPurchaseModel!);
    if (index == 0) {
      index = _quotationsList!.length - 1;
    } else {
      index--;
    }
    setSelectedPurchaseModel = _quotationsList![index];
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

  void searchPurchase() {
    final allPurchase = purchaseDB.getAllPurchase();
    allPurchase.where((element) => element.dateTime == startDateTime);
  }

  Future<void> deletePurchase(PurchaseModel purchaseModel) async {
    // for (final item in purchaseModel.paymentModelList) {
    //   await paymentDB.deletePayment(item);
    // }
    await purchaseDB.deletePurchase(purchaseModel);
    performInit();
  }
}
