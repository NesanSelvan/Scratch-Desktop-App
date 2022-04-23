import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/auth/login.dart';
import '../../controller/billing/sales/sales.dart';
import '../../controller/home/home.dart';
import '../../enum/application.dart';
import '../../utils/sales_end/sales_end.dart';
import '../../utils/utility.dart';
import '../../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  final homeController = Get.put(HomeController());
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode1 = FocusNode();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> handleVersion() async {
    try {
      loginController.updateIsAuthenticated(false);
      final version = await loginController.getCurrentVersion();
      if (Application.version() < double.parse("$version")) {
        // ignore: deprecated_member_use
        // _scaffoldKey.currentState!.showSnackBar(
        //     const SnackBar(content: CustomText("New update has been found")));

        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 30),
            content: CustomText("New version $version update has been found"),
            backgroundColor: Colors.green[400],
            action: SnackBarAction(
              label: "View",
              onPressed: () async {
                await Utility().showUpdateDialog(context, loginController);
              },
              textColor: Colors.white,
            ),
          ),
        );
      }
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "$e");
    }
  }

  @override
  void initState() {
    super.initState();
    Database().storage.setItem("sales", []);
    debugPrint("All Bills List ${salesDB.getAllBill()}");
    // handleVersion();
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
                                    throw Exception(
                                      'Unsupported platform ${rawKeyEvent.data.runtimeType}',
                                    );
                                }
                              },
                              child: CustomTextField(
                                focusNode: controller.usernameNode,
                                controller: controller.usernameController,
                                label: "Username",
                                onEditingComplete: () {},
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
                                    throw Exception(
                                      'Unsupported platform ${rawKeyEvent.data.runtimeType}',
                                    );
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
    Key? key,
    required this.progress,
  }) : super(key: key);

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
