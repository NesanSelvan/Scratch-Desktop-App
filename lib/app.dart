import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/controller/paths/paths.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/application.dart';
import 'package:annai_store/features/analytics/sales/cubit/sales_analytics_cubit.dart';
import 'package:annai_store/features/barcode_printer/cubit/barcode_printer_cubit.dart';
import 'package:annai_store/features/loader/cubit/cubit/loader_cubit.dart';
import 'package:annai_store/features/loader/cubit/loader_cubit.dart';
import 'package:annai_store/features/loader/widgets/loader.dart';
import 'package:annai_store/features/new_version/cubit/version_cubit.dart';
import 'package:annai_store/screens/auth/login.dart';
import 'package:annai_store/utils/navigation_service.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final _bloc = LoaderBloc();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BarcodePrinterCubit(),
        ),
        BlocProvider(
          create: (context) => SalesAnalyticsCubit(),
        ),
        BlocProvider(
          create: (context) => VersionCubit()..fetchLatestVersion(),
        ),
        BlocProvider(
          create: (context) => LoaderCubit(),
        ),
      ],
      child: GetMaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: Application.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          primarySwatch: kMidPrimaryColor,
        ),
        // home: const Scaffold(body: Text("Hello")),
        home: Stack(
          children: [
            RawKeyboardListener(
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
            const ApplicationLoader(),
          ],
        ),
      ),
    );
  }
}
