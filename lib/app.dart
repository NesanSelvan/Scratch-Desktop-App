import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/controller/paths/paths.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/application.dart';
import 'package:annai_store/screens/auth/login.dart';
import 'package:annai_store/utils/navigation_service.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> with WidgetsBindingObserver {
  LoginController loginController = Get.put(LoginController());
  PathController pathController = Get.put(PathController());
  final FocusNode _focusNode = FocusNode();
  bool isLoading = true;

  Future<void> performInit() async {
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    performInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  AppLifecycleState? _notification;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("App Life cycle Status : $state");
    setState(() {
      _notification = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    Utility().performActivityWhenAppOpens();
    Database().initialize();
    pathController.addIfNotExists();
    return GetMaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: Application.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: kMidPrimaryColor,
      ),
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
