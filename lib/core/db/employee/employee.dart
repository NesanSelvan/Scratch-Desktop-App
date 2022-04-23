import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';

import '../../../models/failure/failure.dart';
import '../../../models/persons/employee/employee.dart';

class EmployeeDB {
  final storage = Database().storage;
  List<EmployeeModel> getAllEmployee() {
    try {
      final data = Database().storage.getItem('employees');
      // debugPrint('Employee Item: $data');

      final List<EmployeeModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          // debugPrint('EmployeeModel Item: $item');
          datas.add(EmployeeModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Employee Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> clearAll() async {
    await Database().storage.setItem("employees", []);
  }

  Future<void> addEmployeeToDb(EmployeeModel employeeModel) async {
    try {
      final empModelList = getAllEmployee();
      final matchedEmployee = empModelList
          .where((element) => element.name == employeeModel.name)
          .toList();
      if (matchedEmployee.isNotEmpty) {
        throw Failure(
          "Employee with same Name ${employeeModel.name} Already Exists !",
        );
      }
      final datas = [...getAllEmployee(), employeeModel];
      await updateEmployeeToDB(datas);
    } catch (e) {
      throw Failure("$e");
    }
  }

  Future<void> updateEmployeeToDB(List<EmployeeModel> empModelList) async {
    debugPrint("Before Update : $empModelList");
    final employeeModelListMap = getEmployeeListJson(empModelList);
    await storage.setItem("employees", employeeModelListMap);
  }

  Future<void> deleteEmployee(EmployeeModel employeeModel) async {
    final datas = getAllEmployee();
    datas.remove(employeeModel);
    // await storage.setItem("employees", []);
    await updateEmployeeToDB(datas);
  }

  Future<void> updateEmployee(EmployeeModel employeeModel) async {
    final employeeList = getAllEmployee();
    final datas = employeeList
        .where((element) => element.id == employeeModel.id)
        .toList();
    final index = employeeList.indexOf(datas[0]);
    employeeList[index] = employeeModel;
    updateEmployeeToDB(employeeList);
  }

  EmployeeModel getEmployeeModelById(String id) {
    return getAllEmployee().where((element) => element.id == id).toList().first;
  }

  Future<void> resetEmployee() async {
    await storage.setItem("employees", []);
  }

  EmployeeModel? getEmployeeByName(String name) {
    try {
      return getAllEmployee()
          .where((element) => element.name == name)
          .toList()
          .first;
    } catch (e) {
      return null;
    }
  }
}
