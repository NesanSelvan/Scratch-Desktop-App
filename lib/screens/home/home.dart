import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/home/home.dart';
import '../../controller/server/server.dart';
import '../../controller/statements/statements.dart';
import '../../utils/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  StatementController statementController = Get.put(StatementController());
  ServerController serverController = Get.put(ServerController());

  @override
  void initState() {
    super.initState();
    // serverController.startServer();
  }

  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    Utility().updateMenubar(context, homeController, statementController);
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
    );
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);
        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            homeController.updateKeys(data.logicalKey);
            if (!isKeyDown) {
              debugPrint("Home Screen Key Press: ${data.logicalKey}");
              if (data.logicalKey == LogicalKeyboardKey.f11) {
                homeController.backKeyPressed();
              } else if (data.logicalKey == LogicalKeyboardKey.altLeft) {
                // debugPrint("Focusing Menu");
                homeController.focusMenu();
              }
            }
            break;
          default:
            throw Exception(
              'Unsupported platform ${rawKeyEvent.data.runtimeType}',
            );
        }
      },
      child: Scaffold(
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return homeController.currentSelectedWidget!;
          },
        ),
      ),
    );
  }
}
