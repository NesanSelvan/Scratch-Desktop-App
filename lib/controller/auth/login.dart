import 'dart:convert';
import 'dart:io';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/enum/application.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/models/persons/employee/employee.dart';
import 'package:annai_store/screens/home/home.dart';
import 'package:annai_store/utils/file/file.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:custom/ftn.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final usernameNode = FocusNode();
  final passwordNode = FocusNode();
  double downloadProgress = 0;
  bool isDownloading = false;
  EmployeeModel? currentEmployee;

  Future<void> openExeFile(String filePath) async {
    await Process.start(filePath, ["-t", "-l", "1000"]).then((value) {});
  }

  Future<double> getCurrentVersion() async {
    try {
      final strData = await Utility().checkCurrentVersion();
      final jsonData = jsonDecode(strData) as Map<String, dynamic>;
      debugPrint("Latest Version: ${jsonData['version']}");
      return double.parse("${jsonData['version']}");
    } catch (e) {
      return 0;
    }
  }

  Future<void> downloadNewVersion() async {
    isDownloading = true;
    update();
    final dio = Dio();
    final fileDownloadPath =
        "${(await getApplicationDocumentsDirectory()).path}/${FileUtility.getAppsFileName()}.exe";
    await dio.download(
      "https://github.com/AgnelSelvan/AgnelSelvan.github.io/raw/main/${FileUtility.getAppsFileName()}/${FileUtility.getGithubExeName()}.exe",
      fileDownloadPath,
      onReceiveProgress: (received, total) {
        final progress = (received / total) * 100;
        debugPrint('Rec: $received , Total: $total, $progress%');
        downloadProgress = double.parse(progress.toStringAsFixed(0));
        update();
      },
    );
    await openExeFile(fileDownloadPath);
    isDownloading = false;
    update();
  }

  void handleLogin(HomeController homeController, BuildContext context) {
    final emp = employeeDB.getEmployeeByName(usernameController.text);
    if (emp == null) {
      updateIsAuthenticated(false);
      CustomUtilies.customFailureSnackBar("Error", "No Such Employee");
    } else {
      if (emp.password == passwordController.text) {
        updateIsAuthenticated(true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        // homeController.setCurrentSelectedWidget(const HomeScreen());
        // homeController.listSelectedWidget.add(const HomeScreen());
        // homeController.update();
        currentEmployee = emp;
      } else {
        CustomUtilies.customFailureSnackBar("Error", "Password is incorrect");
      }
      return;
    }
    if (usernameController.text.toLowerCase() == "admin" &&
        passwordController.text.toLowerCase() == "admin") {
      updateIsAuthenticated(true);
      currentEmployee = EmployeeModel(
        id: "id",
        name: Application.appName,
        email: "annai.charlinf@gmail.com",
        address: "address",
        pincode: 627117,
        state: "state",
        type: getStrFromPersonEnum(PersonEnum.SuperAdmin),
        mobileNo: 1234567890,
        password: "admin",
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      // homeController.setCurrentSelectedWidget(const HomeScreen());
      // homeController.listSelectedWidget.add(const HomeScreen());
      // homeController.update();
      update();
    } else if (usernameController.text.toLowerCase() == "super" &&
        passwordController.text.toLowerCase() == "super") {
      updateIsAuthenticated(true);
      currentEmployee = EmployeeModel(
        id: "id",
        name: Application.appName,
        email: "annai.charlinf@gmail.com",
        address: "address",
        pincode: 627117,
        state: "state",
        type: getStrFromPersonEnum(PersonEnum.SoftwareOwner),
        mobileNo: 1234567890,
        password: "super",
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      // homeController.setCurrentSelectedWidget(const HomeScreen());
      // homeController.listSelectedWidget.add(const HomeScreen());
      // homeController.update();
      update();
    } else {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Username and password is wrong",
      );
    }
  }

  bool isAuthenticated = false;

  // ignore: avoid_positional_boolean_parameters
  void updateIsAuthenticated(bool val) {
    isAuthenticated = val;
    if (!val) {
      currentEmployee = null;
    }
    update();
  }
}
