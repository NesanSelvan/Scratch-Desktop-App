import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../enum/person/person.dart';
import '../../models/failure/failure.dart';
import '../../models/persons/employee/employee.dart';

class EmployeeController extends GetxController {
  final employeeDB = Database().employeeDB;
  List<EmployeeModel> employeeModelList =
      Database().employeeDB.getAllEmployee();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final searchController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedState = stateList[0];

  PersonEnum selectedPersonEnum = PersonEnum.Employee;
  void setSelectedPersonEnum(PersonEnum personEnum) {
    selectedPersonEnum = personEnum;
    update();
  }

  @override
  void onInit() {
    Database().initialize();
    getAllEmployee();
    super.onInit();
  }

  void getAllEmployee() {
    Database().initialize();
    employeeModelList = Database().employeeDB.getAllEmployee();
    debugPrint("employeeModelList : $employeeModelList");
    update();
  }

  Future<void> addEmployee() async {
    try {
      await employeeDB.addEmployeeToDb(
        EmployeeModel(
          id: const Uuid().v1(),
          name: nameController.text,
          email: emailController.text,
          address: addressController.text,
          pincode: int.parse(pincodeController.text),
          state: selectedState,
          password: passwordController.text,
          type: getStrFromPersonEnum(selectedPersonEnum),
          mobileNo: int.parse(mobileNoController.text),
          createdAt: DateTime.now(),
        ),
      );
      clearTextField();
      getAllEmployee();
    } catch (e) {
      debugPrint('Error : $e');
      CustomUtilies.customFailureSnackBar("Error in Adding Employee", "$e");
    }
  }

  EmployeeModel? selectedEmployeeModel;

  void setSelectedEmployeeModel(EmployeeModel? employeeModel) {
    selectedEmployeeModel = employeeModel;
    update();
  }

  Failure? failure;

  Future<void> deleteEmployee() async {
    if (selectedEmployeeModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Delete Unsuccessfull",
        "Please Select a Employee to Delete",
      );
    } else {
      if (await deleteSelectedEmployee()) {
        CustomUtilies.customSuccessSnackBar(
          "Delete SuccessFull",
          "Employee Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Delete Unsuccessfull", "$failure");
      }
    }
  }

  Future<bool> deleteSelectedEmployee() async {
    try {
      await employeeDB.deleteEmployee(selectedEmployeeModel!);
      getAllEmployee();
      selectedEmployeeModel = null;
      clearTextField();
      return true;
    } catch (e) {
      failure = Failure("$e");
      update();
      return false;
    }
  }

  Future<void> updateEmployee() async {
    if (selectedEmployeeModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Update Unsuccessfull",
        "Please Select a Employee to Update",
      );
    } else {
      debugPrint("Selected Person Enum : $selectedPersonEnum");
      if (await updateSelectedEmployee(
        EmployeeModel(
          id: selectedEmployeeModel!.id,
          name: nameController.text,
          password: passwordController.text,
          address: addressController.text,
          pincode: int.parse(pincodeController.text),
          state: selectedState,
          email: emailController.text,
          type: getStrFromPersonEnum(selectedPersonEnum),
          mobileNo: int.parse(mobileNoController.text),
          createdAt: DateTime.now(),
        ),
      )) {
        CustomUtilies.customSuccessSnackBar(
          "Update SuccessFull",
          "Employee Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Update Unsuccessfull", "$failure");
      }
      clearTextField();
    }
  }

  Future<bool> updateSelectedEmployee(EmployeeModel employeeModel) async {
    try {
      final datas = employeeModelList
          .where((element) => element.id == employeeModel.id)
          .toList();
      if (datas.isEmpty) {
        failure = Failure("No Employee Match");
        update();
        return false;
      }
      debugPrint("Updated Employee : $employeeModel");
      await employeeDB.updateEmployee(employeeModel);
      getAllEmployee();
      selectedEmployeeModel = null;
      return true;
    } catch (e) {
      failure = Failure("$e");
      return false;
    }
  }

  List<EmployeeModel> searchedEmployeeModel = [];

  void searchEmployee(String text) {
    searchedEmployeeModel.clear();
    final datas = employeeModelList.where((element) {
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
              .contains(text.toLowerCase());
    }).toList();
    searchedEmployeeModel = datas;
    update();
  }

  void setState(String state) {
    selectedState = state;
    debugPrint('State $state');
    update();
  }

  void clearTextField() {
    nameController.clear();
    passwordController.clear();
    mobileNoController.clear();
    addressController.clear();
    selectedState = stateList[0];
    pincodeController.clear();
    emailController.clear();
    update();
  }

  void onEmployeeTap(EmployeeModel e) {
    setSelectedEmployeeModel(e);
    nameController.text = e.name;
    passwordController.text = e.password;
    mobileNoController.text = "${e.mobileNo}";
    addressController.text = e.address;
    pincodeController.text = e.pincode.toString();
    selectedState = e.state;
    emailController.text = e.email;
    selectedPersonEnum = getPersonEnumFromStr(e.type);
    update();
  }

  void handleKeyDown() {
    if (selectedEmployeeModel == null) {
      onEmployeeTap(employeeModelList.first);
    } else {
      if (selectedEmployeeModel == employeeModelList.last) {
        onEmployeeTap(employeeModelList.first);
      } else {
        onEmployeeTap(
          employeeModelList[
              employeeModelList.indexOf(selectedEmployeeModel!) + 1],
        );
      }
    }
  }

  void handleKeyUp() {
    if (selectedEmployeeModel == null) {
      onEmployeeTap(employeeModelList.first);
    } else {
      if (selectedEmployeeModel == employeeModelList.first) {
        onEmployeeTap(employeeModelList.last);
      } else {
        onEmployeeTap(
          employeeModelList[
              employeeModelList.indexOf(selectedEmployeeModel!) - 1],
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
      // deleteEmployee();
      CustomUtilies.customSnackBar(
        "You cannot delete a Employee",
        Colors.yellow,
        Colors.white,
        "You can Hide a Employee",
        const Icon(Icons.delete),
      );
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyC)) {
      clearTextField();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyU)) {
      updateEmployee();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyR)) {
      getAllEmployee();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyA)) {
      addEmployee();
    }
    clickedKeys.clear();
  }
}
