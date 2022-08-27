import 'package:annai_store/models/customer/customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/bill/bill.dart';
import '../billing/sales/sales.dart';

class TodaysSalesController extends GetxController {
  List<BillModel> allBills = [];
  final customerController = TextEditingController();
  double totalAmount = 0;

  void performInit() {
    allBills = salesDB.getTodaysBill();
    for (final item in allBills) {
      totalAmount += item.price;
    }
    debugPrint("All Bills: ${allBills.length}");
    update();
  }

  @override
  void onInit() {
    performInit();
    super.onInit();
  }

  List<CustomerModel>? customersList;

  void getAllCustomers() {
    customersList = customerDB.getAllCustomer();
  }

  CustomerModel? selectedCustomerModel;

  void addSelectedCustomerModel(CustomerModel customerModel) {
    selectedCustomerModel = customerModel;
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

  void clearAll() {
    selectedCustomerModel = null;
    customerController.clear();
    update();
  }
}
