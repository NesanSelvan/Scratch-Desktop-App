import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/application.dart';
import 'package:annai_store/features/new_version/widgets/button/button.dart';
import 'package:annai_store/utils/sales_end/sales_end.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  LoginController loginController = Get.put(LoginController());
  final homeController = Get.put(HomeController());
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode1 = FocusNode();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("App Life cycle Status : $state");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    Database().storage.setItem("sales", []);
    debugPrint("All Bills List ${salesDB.getAllBill()}");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          key: _scaffoldKey,
          body: Stack(
            children: [
              Align(
                child: Container(
                  width: CustomScreenUtility(context).width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    CustomText(
                                      "Login",
                                      size: 28,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(height: 10),
                                    CustomText(
                                      "Version: ${Application.version()}",
                                      size: 12,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                const AppUpdateButton(),
                              ],
                            ),
                            const SizedBox(height: 50),
                            RawKeyboardListener(
                              focusNode: _focusNode1,
                              onKey: (RawKeyEvent rawKeyEvent) {
                                final isKeyDown =
                                    Utility().isKeyDown(rawKeyEvent);

                                switch (rawKeyEvent.data.runtimeType) {
                                  case RawKeyEventDataWindows:
                                    final data = rawKeyEvent.data
                                        as RawKeyEventDataWindows;
                                    debugPrint(
                                      'Hostory Keyboard: ${data.logicalKey}',
                                    );

                                    if (!isKeyDown) {
                                      if (data.logicalKey ==
                                          LogicalKeyboardKey.enter) {
                                        controller.passwordNode.requestFocus();
                                      }
                                    }
                                    break;
                                  default:
                                    break;
                                }
                              },
                              child: CustomTextField(
                                focusNode: controller.usernameNode,
                                controller: controller.usernameController,
                                label: "Username",
                                onEditingComplete: () {},
                                autofocus: true,
                              ),
                            ),
                            const SizedBox(height: 20),
                            RawKeyboardListener(
                              focusNode: _focusNode,
                              onKey: (RawKeyEvent rawKeyEvent) {
                                final isKeyDown =
                                    Utility().isKeyDown(rawKeyEvent);

                                switch (rawKeyEvent.data.runtimeType) {
                                  case RawKeyEventDataWindows:
                                    final data = rawKeyEvent.data
                                        as RawKeyEventDataWindows;
                                    debugPrint(
                                      'Hostory Keyboard: ${data.logicalKey}',
                                    );

                                    if (!isKeyDown) {
                                      if (data.logicalKey ==
                                          LogicalKeyboardKey.enter) {
                                        controller.handleLogin(
                                          homeController,
                                          context,
                                        );
                                      }
                                    }
                                    break;
                                  default:
                                    break;
                                }
                              },
                              child: CustomTextField(
                                focusNode: controller.passwordNode,
                                controller: controller.passwordController,
                                label: "Password",
                                isObscure: true,
                                onEditingComplete: () {},
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextButton(
                              "Login",
                              onPressed: () async {
                                // controller.handleLogin(homeController, context);
                                SalesEnd.init();
                              },
                              backgoundColor: kPrimaryColor,
                              textColor: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (controller.isDownloading)
                DownloadLoadingWidget(
                  progress: controller.downloadProgress,
                )
              else
                Container(),
            ],
          ),
        );
      },
    );
  }
}

class DownloadLoadingWidget extends StatelessWidget {
  final double progress;
  const DownloadLoadingWidget({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CustomScreenUtility(context).width,
      height: CustomScreenUtility(context).height,
      color: Colors.grey.withOpacity(0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          CustomText(
            "$progress %",
            color: Colors.grey[800],
            size: 16,
          )
        ],
      ),
    );
  }
}
