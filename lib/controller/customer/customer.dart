import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../models/failure/failure.dart';

class CustomerController extends GetxController {
  final customerDB = Database().customerDB;
  List<CustomerModel> customerModelList =
      Database().customerDB.getAllCustomer();
  final nameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final gstinController = TextEditingController();
  final searchController = TextEditingController();
  String selectedState = stateList[23];
  String selectedCustomerType = customerType[1];

  final mobileNode = FocusNode();
  final mobileKeyboardNode = FocusNode();
  final emailNode = FocusNode();
  final emailKeyboardNode = FocusNode();
  final addressNode = FocusNode();
  final addressKeyboardNode = FocusNode();
  final pincodeNode = FocusNode();
  final pincodeKeyboardNode = FocusNode();
  final gstinNode = FocusNode();
  final gstinKeyboardNode = FocusNode();
  final stateNode = FocusNode();
  final stateKeyboardNode = FocusNode();
  final customerTypeNode = FocusNode();
  final customerTypeKeyboardNode = FocusNode();
  final FocusNode firstNode = FocusNode();
  final FocusNode firstKeyboardNode = FocusNode();

  @override
  void onInit() {
    Database().initialize();
    getAllCustomer();
    super.onInit();
  }

  void getAllCustomer() {
    Database().initialize();
    customerModelList = Database().customerDB.getAllCustomer();
    try {
      update();
    } catch (e) {}
  }

  void checkCustomerExists() {
    final isExists = customerDB.checkCustomerExists(nameController.text);
    if (isExists) {
      CustomUtilies.customFailureSnackBar("Error", "Customer already Exists");
      firstNode.requestFocus();
    } else {
      nameController.text = nameController.text.capitalize.toString();
      mobileNode.requestFocus();
    }
  }

  Future<void> addCustomer() async {
    try {
      await customerDB.addCustomerToDb(
        CustomerModel(
          id: const Uuid().v1(),
          email: emailController.text,
          name: nameController.text,
          address: addressController.text,
          pincode: pincodeController.text == ""
              ? 0
              : int.parse(pincodeController.text),
          state: selectedState,
          type: selectedCustomerType,
          isPending: false,
          mobileNo: mobileNoController.text == ""
              ? 0
              : int.parse(mobileNoController.text),
          gstin: gstinController.text,
          createdAt: DateTime.now(),
        ),
      );
      clearTextField();
      getAllCustomer();
      CustomUtilies.customSuccessSnackBar("Succss", "Added Succssfully");
    } catch (e) {
      debugPrint('Error : $e');
      CustomUtilies.customFailureSnackBar("Error in Adding Customer", "$e");
    }
  }

  CustomerModel? selectedCustomerModel;

  void setSelectedCustomerModel(CustomerModel? customerModel) {
    selectedCustomerModel = customerModel;
    update();
  }

  Failure? failure;

  Future<void> deleteCustomer() async {
    if (selectedCustomerModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Delete Unsuccessfull",
        "Please Select a Customer to Delete",
      );
    } else {
      if (await deleteSelectedCustomer()) {
        CustomUtilies.customSuccessSnackBar(
          "Delete SuccessFull",
          "Customer Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Delete Unsuccessfull", "$failure");
      }
    }
  }

  Future<bool> deleteSelectedCustomer() async {
    try {
      await customerDB.deleteCustomer(selectedCustomerModel!);
      getAllCustomer();
      selectedCustomerModel = null;
      clearTextField();
      return true;
    } catch (e) {
      failure = Failure("$e");
      update();
      return false;
    }
  }

  Future<void> updateCustomer() async {
    if (selectedCustomerModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Update Unsuccessfull",
        "Please Select a Customer to Update",
      );
    } else {
      if (await updateSelectedCustomer(
        CustomerModel(
          id: selectedCustomerModel!.id,
          name: nameController.text,
          email: emailController.text,
          address: addressController.text,
          pincode: int.parse(pincodeController.text),
          state: selectedState,
          type: selectedCustomerType,
          isPending: false,
          mobileNo: int.parse(mobileNoController.text),
          gstin: gstinController.text,
          createdAt: DateTime.now(),
        ),
      )) {
        CustomUtilies.customSuccessSnackBar(
          "Update SuccessFull",
          "Customer Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Update Unsuccessfull", "$failure");
      }
      clearTextField();
    }
  }

  Future<bool> updateSelectedCustomer(CustomerModel customerModel) async {
    try {
      final datas = customerModelList
          .where((element) => element.id == customerModel.id)
          .toList();
      if (datas.isEmpty) {
        failure = Failure("No Customer Match");
        update();
        return false;
      }
      await customerDB.updateCustomer(customerModel);
      getAllCustomer();
      selectedCustomerModel = null;
      return true;
    } catch (e) {
      failure = Failure("$e");
      return false;
    }
  }

  List<CustomerModel> searchedCustomerModel = [];

  void searchCustomer(String text) {
    searchedCustomerModel.clear();
    final datas = customerModelList.where((element) {
      return element.name
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          element.address
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          element.pincode
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          element.state.toString().toLowerCase().contains(text.toLowerCase()) ||
          element.type.toString().toLowerCase().contains(text.toLowerCase()) ||
          element.mobileNo
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          element.gstin.toString().toLowerCase().contains(text.toLowerCase());
    }).toList();
    searchedCustomerModel = datas;
    update();
  }

  void setState(String state) {
    selectedState = state;
    debugPrint('State $state');
    update();
  }

  void setCustomerType(String type) {
    selectedCustomerType = type;
    update();
  }

  void clearTextField() {
    nameController.clear();
    mobileNoController.clear();
    addressController.clear();
    emailController.clear();
    selectedState = stateList[23];
    pincodeController.clear();
    gstinController.clear();
    selectedCustomerType = customerType[1];
    update();
  }

  void onCustomerTap(CustomerModel e) {
    setSelectedCustomerModel(e);
    nameController.text = e.name;
    mobileNoController.text = "${e.mobileNo}";
    addressController.text = e.address;
    emailController.text = e.email ?? "";
    pincodeController.text = e.pincode.toString();
    gstinController.text = e.gstin ?? "";
    selectedState = e.state;
    selectedCustomerType = e.type;
    update();
  }

  void handleKeyDown() {
    if (selectedCustomerModel == null) {
      onCustomerTap(customerModelList.first);
    } else {
      if (selectedCustomerModel == customerModelList.last) {
        onCustomerTap(customerModelList.first);
      } else {
        onCustomerTap(
          customerModelList[
              customerModelList.indexOf(selectedCustomerModel!) + 1],
        );
      }
    }
  }

  void handleKeyUp() {
    if (selectedCustomerModel == null) {
      onCustomerTap(customerModelList.first);
    } else {
      if (selectedCustomerModel == customerModelList.first) {
        onCustomerTap(customerModelList.last);
      } else {
        onCustomerTap(
          customerModelList[
              customerModelList.indexOf(selectedCustomerModel!) - 1],
        );
      }
    }
  }

  List<LogicalKeyboardKey> clickedKeys = [];

  void updateKeys(LogicalKeyboardKey logicalKeyboardKey) {
    if (!clickedKeys.contains(logicalKeyboardKey)) {
      clickedKeys.add(logicalKeyboardKey);
    }
  }

  void performKeyboardClickedAction() {
    if (clickedKeys[0] == LogicalKeyboardKey.arrowDown) {
      handleKeyDown();
    } else if (clickedKeys[0] == LogicalKeyboardKey.arrowUp) {
      debugPrint('Up key ');
      handleKeyUp();
    } else if (clickedKeys[0] == LogicalKeyboardKey.delete) {
      // deleteCustomer();
      CustomUtilies.customSnackBar(
        "You cannot delete a Customer",
        Colors.yellow,
        Colors.white,
        "You can Hide a Customer",
        const Icon(Icons.delete),
      );
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyC)) {
      clearTextField();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyU)) {
      updateCustomer();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyR)) {
      getAllCustomer();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyA)) {
      addCustomer();
    }
    clickedKeys.clear();
  }
}
