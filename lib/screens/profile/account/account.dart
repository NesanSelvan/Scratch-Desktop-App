import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/controller/personal_company/personal_company.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/hive_db.dart';
import 'package:annai_store/enum/application.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/features/new_version/widgets/button/button.dart';
import 'package:annai_store/screens/auth/login.dart';
import 'package:annai_store/utils/sales_end/sales_end.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final loginController = Get.put(LoginController());
  final containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return loginController.currentEmployee == null
        ? Container()
        : GetBuilder<LoginController>(
            builder: (controller) {
              return Stack(
                children: [
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomText(loginController.currentEmployee!.name),
                          CustomText(
                            "Current Version : ${Application.version()}",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const AppUpdateButton(),
                              CustomTextButton(
                                "Create New Data",
                                onPressed: () async {
                                  final loginController =
                                      Get.put(LoginController());
                                  final empType = getPersonEnumFromStr(
                                    loginController.currentEmployee!.type,
                                  );
                                  await Utility.showDeleteionDialog(
                                    "Your data will be deleted and will create new data.",
                                    onYesTap: () async {
                                      if (empType == PersonEnum.SoftwareOwner) {
                                        SalesEnd.createNewDBFile(
                                          DateTime.now(),
                                        );
                                      } else {
                                        CustomUtilies.customFailureSnackBar(
                                          "You cannot delete",
                                          "Please contact the administrator",
                                        );
                                      }
                                    },
                                  );
                                },
                                backgoundColor: Colors.red,
                                textColor: Colors.white,
                              ),
                              if (getPersonEnumFromStr(
                                    loginController.currentEmployee!.type,
                                  ) ==
                                  PersonEnum.SoftwareOwner)
                                CustomTextButton(
                                  "Migrate DB to Hive",
                                  onPressed: () async {
                                    await AppHiveDB.instance.migrateDBToHive();
                                    CustomUtilies.customSuccessSnackBar(
                                      "Successfull",
                                      "Migrated Succesfully",
                                    );
                                  },
                                )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MyPersonalCompanyDetails()
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
              );
            },
          );
  }
}

class MyPersonalCompanyDetails extends StatelessWidget {
  const MyPersonalCompanyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CustomScreenUtility(context).width * 0.4,
      child: GetBuilder<PersonalCompany>(
        init: PersonalCompany(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  focusNode: controller.nameNode,
                  controller: controller.nameController,
                  autofocus: true,
                  label: "Enter Name",
                  textInputType: TextInputType.number,
                  onEditingComplete: () {
                    controller.emailNode.requestFocus();
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.emailController,
                  label: "Enter Email",
                  focusNode: controller.emailNode,
                  onEditingComplete: () =>
                      controller.mobileNoNode.requestFocus(),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      // spacing: 10,
                      // runSpacing: 10,
                      children: controller.mobileNoList
                          .map(
                            (e) => Container(
                              width: CustomScreenUtility(context).width *
                                  0.2 *
                                  0.4,
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(e),
                                  InkWell(
                                    onTap: () {
                                      controller.mobileNoList.remove(e);
                                      controller.update();
                                    },
                                    child: const CustomIcon(
                                      Icons.delete,
                                      size: 12,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RawKeyboardListener(
                      focusNode: controller.mobileKeyboardFocus,
                      onKey: (RawKeyEvent rawKeyEvent) {
                        final isKeyDown = Utility().isKeyDown(rawKeyEvent);
                        switch (rawKeyEvent.data.runtimeType) {
                          case RawKeyEventDataWindows:
                            final data =
                                rawKeyEvent.data as RawKeyEventDataWindows;
                            if (isKeyDown) {
                              if (data.logicalKey ==
                                      LogicalKeyboardKey.numpadAdd ||
                                  data.logicalKey == LogicalKeyboardKey.add) {
                                controller.addMobileNo();
                              } else if (data.logicalKey ==
                                  LogicalKeyboardKey.enter) {
                                controller.addressNode.requestFocus();
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
                        focusNode: controller.mobileNoNode,
                        onChange: (String val) {
                          if (val == "+") {
                            controller.mobileNoController.clear();
                          }
                        },
                        controller: controller.mobileNoController,
                        label: "Enter Mobile Number",
                      ),
                    ),
                    CustomText(
                      "Click + to add more number",
                      size: 6,
                      color: Colors.grey[500],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.addressController,
                  label: "Enter Address",
                  focusNode: controller.addressNode,
                  onEditingComplete: () {
                    if (controller.addressController.text != "") {
                      controller.placeOfDispatchNode.requestFocus();
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.placeOfDispatchController,
                  label: "Enter Place of Dispatch",
                  focusNode: controller.placeOfDispatchNode,
                  onEditingComplete: () => controller.gstinNode.requestFocus(),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.gstinController,
                  label: "Enter GSTIN",
                  focusNode: controller.gstinNode,
                  onEditingComplete: () {
                    if (controller.gstinController.text != "") {
                      final gstinList =
                          controller.gstinController.text.split("");
                      if (gstinList.length == 15) {
                        controller.panController.text =
                            gstinList.getRange(2, gstinList.length - 3).join();
                      }
                    }
                    controller.panNode.requestFocus();
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.panController,
                  label: "Enter PAN",
                  focusNode: controller.panNode,
                  onEditingComplete: () {
                    controller.licNode.requestFocus();
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.licNoController,
                  label: "Enter CIN / LIC No",
                  focusNode: controller.licNode,
                  onEditingComplete: () {
                    controller.webNode.requestFocus();
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.websiteController,
                  label: "Enter Website",
                  focusNode: controller.webNode,
                  onEditingComplete: () {
                    controller.bankNameNode.requestFocus();
                  },
                ),
                const SizedBox(height: 20),
                ...controller.bankModelList.map((e) {
                  return ExpansionTile(
                    onExpansionChanged: (bool val) {
                      if (val) {
                        controller.setSelectedBankModel = e;
                      } else {
                        controller.setSelectedBankModel = null;
                      }
                    },
                    trailing: InkWell(
                      onTap: () {
                        controller.bankModelList.remove(e);
                        controller.update();
                      },
                      child: const CustomIcon(
                        Icons.delete,
                        color: Colors.red,
                        size: 12,
                      ),
                    ),
                    title: CustomText("${e.bankName} ( ${e.branch} )"),
                    children: <Widget>[CustomText("${e.toJson()}")],
                  );
                }).toList(),
                const SizedBox(height: 20),
                if (controller.selectedBankModel == null)
                  Container()
                else
                  CustomTextButton(
                    "Update Bank",
                    onPressed: controller.updateBank,
                    backgoundColor: kPrimaryColor,
                    textColor: Colors.white,
                  ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.bankNameController,
                  label: "Enter Bank Name",
                  onChange: (String val) {
                    if (val == "+") {
                      controller.bankNameController.clear();
                    }
                  },
                  focusNode: controller.bankNameNode,
                  onEditingComplete: () {
                    controller.branchNode.requestFocus();
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.branchController,
                  label: "Enter Bank Branch",
                  focusNode: controller.branchNode,
                  onEditingComplete: () {
                    controller.accNoNode.requestFocus();
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.accNoController,
                  label: "Enter Account No",
                  focusNode: controller.accNoNode,
                  onEditingComplete: () {
                    controller.accHolderNode.requestFocus();
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.accHolderNameController,
                  label: "Enter Account Holder Name",
                  focusNode: controller.accHolderNode,
                  onEditingComplete: () {
                    controller.ifscCodeNode.requestFocus();
                  },
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    RawKeyboardListener(
                      focusNode: controller.ifscKeyboardFocus,
                      onKey: (RawKeyEvent rawKeyEvent) async {
                        final isKeyDown = Utility().isKeyDown(rawKeyEvent);
                        switch (rawKeyEvent.data.runtimeType) {
                          case RawKeyEventDataWindows:
                            final data =
                                rawKeyEvent.data as RawKeyEventDataWindows;
                            if (isKeyDown) {
                              if (data.logicalKey ==
                                      LogicalKeyboardKey.numpadAdd ||
                                  data.logicalKey == LogicalKeyboardKey.add) {
                                await controller.addBank();
                              } else if (data.logicalKey ==
                                  LogicalKeyboardKey.enter) {
                                await controller.addBank();
                                await controller.addCompany();
                                controller.nameNode.requestFocus();
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
                        controller: controller.ifscCodeController,
                        label: "Enter IFSC Code",
                        focusNode: controller.ifscCodeNode,
                        onChange: (String val) {
                          if (val.contains("+")) {
                            controller.ifscCodeController.text =
                                val.replaceAll("+", "");
                          }
                        },
                      ),
                    ),
                    CustomText(
                      "Click + to add more bank account else click ENTER",
                      size: 6,
                      color: Colors.grey[500],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextButton(
                  "Update",
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
