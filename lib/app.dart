import 'dart:io';

import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/controller/paths/paths.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/application.dart';
import 'package:annai_store/screens/auth/login.dart';
import 'package:annai_store/utils/encrypt.dart';
import 'package:annai_store/utils/file/file.dart';
import 'package:annai_store/utils/folder/folder.dart';
import 'package:annai_store/utils/navigation_service.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> with WindowListener {
  LoginController loginController = Get.put(LoginController());
  PathController pathController = Get.put(PathController());
  final FocusNode _focusNode = FocusNode();
  bool isLoading = true;

  @override
  void onWindowClose() {
    // final allData = File(FileUtility.getFullDBFilePath());
    // print(allData.path);
    // final data = allData.readAsStringSync();
    // final val = EncryptData.encryptAES(data);
    // allData.writeAsStringSync(val);
  }

  @override
  void onWindowFocus() {
    print("onWindowFocus");
  }

  @override
  void onWindowMinimize() {}

  Future<void> performInit() async {
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
    performInit();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utility().performActivityWhenAppOpens();
    Database.instance.initialize();
    pathController.addIfNotExists();
    return GetMaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: Application.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: kMidPrimaryColor,
      ),
      // home: const Scaffold(body: Text("Hello")),
      home: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: (RawKeyEvent rawKeyEvent) {
          // Utility().onKeyEvent(rawKeyEvent, context);
        },
        child: GetBuilder<LoginController>(
          builder: (controller) {
            // return controller.isAuthenticated
            //     ? const HomeScreen()
            //     : const
            return isLoading
                ? const CircularProgressIndicator()
                : const LoginScreen();
          },
        ),
      ),
    );
  }
}
