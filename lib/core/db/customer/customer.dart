import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/billing/sales/sales.dart';
import '../../../models/customer/customer.dart';
import '../../../models/failure/failure.dart';

class CustomerDB {
  final storage = Database().storage;
  List<CustomerModel> getAllCustomer() {
    try {
      final data = Database().storage.getItem('customers');
      // debugPrint('Customer Item: $data');

      final List<CustomerModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          // debugPrint('CustomerModel Item: $item');
          datas.add(CustomerModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Customer Fetcjing Error: $e');
      return [];
    }
  }

  bool checkCustomerExists(String name) {
    final customers = customerDB.getAllCustomer();
    for (final customer in customers) {
      if (customer.name.trim().toLowerCase() == name.trim().toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  Future<void> clearAll() async {
    final loginController = Get.put(LoginController());
    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    await Utility.showDeleteionDialog(
        "All your customers record will get cleared", onYesTap: () async {
      if (empType == PersonEnum.SoftwareOwner)
        await Database().storage.setItem("customers", []);
      else
        CustomUtilies.customFailureSnackBar(
            "You cannot delete", "Please contact the administrator");
    });
  }

  Future<void> addCustomerToDb(CustomerModel customerModel) async {
    try {
      final customerModelList = getAllCustomer();
      final matchedCustomer = customerModelList
          .where((element) => element.name == customerModel.name)
          .toList();
      if (matchedCustomer.isNotEmpty) {
        throw Failure(
          "Customer with same Name ${customerModel.name} Already Exists !",
        );
      }
      final datas = [...getAllCustomer(), customerModel];
      await updateCustomerToDB(datas);
    } catch (e) {
      throw Failure("$e");
    }
  }

  Future<void> updateCustomerToDB(List<CustomerModel> customerModelList) async {
    final customerModelListMap = getCustomerListJson(customerModelList);
    await storage.setItem("customers", customerModelListMap);
  }

  Future<void> deleteCustomer(CustomerModel customerModel) async {
    final datas = getAllCustomer();
    datas.remove(customerModel);
    updateCustomerToDB(datas);
  }

  Future<void> updateCustomer(CustomerModel customerModel) async {
    final customerList = getAllCustomer();
    final datas = customerList
        .where((element) => element.id == customerModel.id)
        .toList();
    if (datas.isNotEmpty) {
      final index = customerList.indexOf(datas[0]);
      customerList[index] = customerModel;
      await updateCustomerToDB(customerList);
    }
  }

  CustomerModel getCustomerModelById(String id) {
    final cust = getAllCustomer().where((element) => element.id == id).toList();
    if (cust.isEmpty) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Customer not exists, So you cannot update bill",
      );
    }
    return cust.first;
  }

  // Future<void> resetCustomer() async {
  //   await storage.setItem("customers", []);
  // }
}
