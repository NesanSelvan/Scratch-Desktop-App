import 'dart:developer';

import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/controller/server/server.dart';
import 'package:annai_store/controller/statements/statements.dart';
import 'package:annai_store/features/barcode_printer/cubit/barcode_printer_cubit.dart';
import 'package:annai_store/features/barcode_printer/screens/widgets/barcode.dart';
import 'package:annai_store/features/loader/widgets/loader.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    Utility().updateMenubar(context, homeController, statementController);
    ScreenUtil.init(
      context,
    );
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<HomeController>(
            builder: (controller) {
              return homeController.currentSelectedWidget!;
            },
          ),
          const ApplicationLoader(),
        ],
      ),
    );
  }
}
