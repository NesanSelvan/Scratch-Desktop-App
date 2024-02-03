import 'dart:async';

import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/application.dart';
import 'package:annai_store/features/analytics/sales/cubit/sales_analytics_cubit.dart';
import 'package:annai_store/features/barcode_printer/cubit/barcode_printer_cubit.dart';
import 'package:annai_store/features/loader/cubit/cubit/loader_cubit.dart';
import 'package:annai_store/features/loader/cubit/loader_cubit.dart';
import 'package:annai_store/features/loader/widgets/loader.dart';
import 'package:annai_store/features/new_version/cubit/version_cubit.dart';
import 'package:annai_store/features/upload_file/presentation/manager/upload_file_cubit.dart';
import 'package:annai_store/screens/auth/login.dart';
import 'package:annai_store/sl.dart';
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
  final FocusNode _focusNode = FocusNode();
  bool isLoading = true;
  final _bloc = LoaderBloc();

  @override
  Future<void> onWindowClose() async {
    sl<UploadFileCubit>().uploadDBFile();
    final bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      Timer(const Duration(milliseconds: 1500), () async {
        await windowManager.destroy();
      });
    }
  }

  @override
  void onWindowFocus() {
    print("onWindowFocus");
  }

  @override
  void onWindowMinimize() {}

  Future<void> performInit() async {
    isLoading = false;
    await windowManager.setPreventClose(true);

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
        BlocProvider(
          create: (context) => sl<UploadFileCubit>(),
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
