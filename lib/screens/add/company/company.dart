import 'package:annai_store/core/constants/constants.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../../controller/company/company.dart';
import '../../../enum/company.dart';
import '../../../models/company/company.dart';
import '../../../utils/utility.dart';
import '../../../widgets/custom_table.dart';
import '../../../widgets/operation_buttons.dart';
import '../../../widgets/search_by.dart';
import '../../../widgets/text_field.dart';

class AddCompanyScreen extends StatefulWidget {
  const AddCompanyScreen({Key? key}) : super(key: key);

  @override
  _AddCompanyScreenState createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  final FocusNode _focusNode = FocusNode();
  final FocusNode _mobileKeyboardFocus = FocusNode();
  final FocusNode ifscKeyboardFocus = FocusNode();
  CompanyController companyController = Get.put(CompanyController());
  @override
  Widget build(BuildContext context) {
    companyController.getAllCompany();
    final node = FocusScope.of(context);
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);
        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            if (!isKeyDown) {
              companyController.updateKeys(data.logicalKey);
              companyController.performKeyboardClickedAction();
            }
            break;
          default:
            throw Exception(
              'Unsupported platform ${rawKeyEvent.data.runtimeType}',
            );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: CustomScreenUtility(context).width,
            height: CustomScreenUtility(context).height,
            child: Column(
              children: [
                SizedBox(
                  height: CustomScreenUtility(context).height * 0.07,
                  child: const Center(
                    child: CustomText(
                      "Company Management",
                      size: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    // color: Colors.red,
                    width: CustomScreenUtility(context).width * 0.8,
                    height: CustomScreenUtility(context).height * 0.13,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SearchByText(),
                        const SizedBox(width: 20),
                        // DropdownButton<CompanyEnum>(
                        //     value: searchCompanyEnum,
                        //     onChanged: (e) {
                        //       setState(() {
                        //         searchCompanyEnum = e!;
                        //       });
                        //     },
                        //     items: CompanyEnum.values
                        //         .map((e) => DropdownMenuItem<CompanyEnum>(
                        //             value: e,
                        //             child: CustomText(
                        //               unitEnumToStr(e),
                        //               size: 12,
                        //             )))
                        //         .toList()),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 50,
                          child: CustomTextField(
                            controller: companyController.searchController,
                            label: "Search",
                            onChange: (String value) {
                              companyController.searchCompany(value);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GetBuilder<CompanyController>(
                  builder: (controller) {
                    return SizedBox(
                      height: CustomScreenUtility(context).height * 0.8,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: CustomScreenUtility(context).width * 0.2,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const CustomText(
                                          "Menu",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        IconButton(
                                          icon: const CustomIcon(
                                            Icons.refresh,
                                            color: kPrimaryColor,
                                          ),
                                          onPressed: controller.getAllCompany,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
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
                                      onEditingComplete: () => controller
                                          .mobileNoNode
                                          .requestFocus(),
                                    ),
                                    const SizedBox(height: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          // spacing: 10,
                                          // runSpacing: 10,
                                          children: controller.mobileNoList
                                              .map(
                                                (e) => Container(
                                                  width: CustomScreenUtility(
                                                        context,
                                                      ).width *
                                                      0.2 *
                                                      0.4,
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey[300]!,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      CustomText(e),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .mobileNoList
                                                              .remove(e);
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
                                          focusNode: _mobileKeyboardFocus,
                                          onKey: (RawKeyEvent rawKeyEvent) {
                                            final isKeyDown = Utility()
                                                .isKeyDown(rawKeyEvent);
                                            switch (
                                                rawKeyEvent.data.runtimeType) {
                                              case RawKeyEventDataWindows:
                                                final data = rawKeyEvent.data
                                                    as RawKeyEventDataWindows;
                                                if (isKeyDown) {
                                                  if (data.logicalKey ==
                                                          LogicalKeyboardKey
                                                              .numpadAdd ||
                                                      data.logicalKey ==
                                                          LogicalKeyboardKey
                                                              .add) {
                                                    controller.addMobileNo();
                                                  } else if (data.logicalKey ==
                                                      LogicalKeyboardKey
                                                          .enter) {
                                                    controller.addressNode
                                                        .requestFocus();
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
                                                controller.mobileNoController
                                                    .clear();
                                              }
                                            },
                                            controller:
                                                controller.mobileNoController,
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
                                        if (controller.addressController.text !=
                                            "") {
                                          controller.placeOfDispatchNode
                                              .requestFocus();
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller:
                                          controller.placeOfDispatchController,
                                      label: "Enter Place of Dispatch",
                                      focusNode: controller.placeOfDispatchNode,
                                      onEditingComplete: () =>
                                          controller.gstinNode.requestFocus(),
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: controller.gstinController,
                                      label: "Enter GSTIN",
                                      focusNode: controller.gstinNode,
                                      onEditingComplete: () {
                                        if (controller.gstinController.text !=
                                            "") {
                                          final gstinList = controller
                                              .gstinController.text
                                              .split("");
                                          if (gstinList.length == 15) {
                                            controller.panController.text =
                                                gstinList
                                                    .getRange(
                                                      2,
                                                      gstinList.length - 3,
                                                    )
                                                    .join();
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
                                            controller.setSelectedBankModel =
                                                null;
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
                                        title: CustomText(
                                          "${e.bankName} ( ${e.branch} )",
                                        ),
                                        children: <Widget>[
                                          CustomText("${e.toJson()}")
                                        ],
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
                                      controller:
                                          controller.accHolderNameController,
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
                                          focusNode: ifscKeyboardFocus,
                                          onKey:
                                              (RawKeyEvent rawKeyEvent) async {
                                            final isKeyDown = Utility()
                                                .isKeyDown(rawKeyEvent);
                                            switch (
                                                rawKeyEvent.data.runtimeType) {
                                              case RawKeyEventDataWindows:
                                                final data = rawKeyEvent.data
                                                    as RawKeyEventDataWindows;
                                                if (isKeyDown) {
                                                  if (data.logicalKey ==
                                                          LogicalKeyboardKey
                                                              .numpadAdd ||
                                                      data.logicalKey ==
                                                          LogicalKeyboardKey
                                                              .add) {
                                                    await controller.addBank();
                                                  } else if (data.logicalKey ==
                                                      LogicalKeyboardKey
                                                          .enter) {
                                                    await controller.addBank();
                                                    await controller
                                                        .addCompany();
                                                    controller.nameNode
                                                        .requestFocus();
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
                                            controller:
                                                controller.ifscCodeController,
                                            label: "Enter IFSC Code",
                                            focusNode: controller.ifscCodeNode,
                                            onChange: (String val) {
                                              if (val.contains("+")) {
                                                controller.ifscCodeController
                                                        .text =
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
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: controller.isNormalBill,
                                          onChanged: (bool? val) {
                                            print(val);
                                            controller.isNormalBill = val;
                                          },
                                        ),
                                        const SizedBox(width: 5),
                                        CustomText(
                                          "Is Normal Purchase Bill",
                                          color: Colors.grey[600],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    OperationButtons(
                                      onAdd: controller.addCompany,
                                      onClear: () async {
                                        controller.clearTextField();
                                        controller
                                            .setSelectedCompanyModel(null);
                                        // final pdf = await rootBundle.load(
                                        //     'assets/pdf/Agnel-Selvan.pdf');
                                        // await Printing.layoutPdf(
                                        //     onLayout: (_) =>
                                        //         pdf.buffer.asUint8List());
                                      },
                                      onDelete: controller.deleteCompany,
                                      onUpdate: controller.updateCompany,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[10],
                              width: CustomScreenUtility(context).width * 0.77,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        color: kLightPrimaryColor,
                                        child: Row(
                                          children: CompanyEnum.values
                                              .map(
                                                (e) => CustomTableHeaderElement(
                                                  width: CustomScreenUtility(
                                                        context,
                                                      ).width *
                                                      0.77 /
                                                      CompanyEnum.values.length,
                                                  text: companyEnumToStr(e),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                      GetBuilder<CompanyController>(
                                        builder: (controller) {
                                          return Column(
                                            children: controller
                                                    .companyModelList.isEmpty
                                                ? [
                                                    const CustomText(
                                                      "No Company Record Exists",
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      size: 14,
                                                    )
                                                  ]
                                                : controller
                                                        .searchedCompanyModel
                                                        .isNotEmpty
                                                    ? controller
                                                        .searchedCompanyModel
                                                        .map(
                                                          (e) => buildInkWell(
                                                            e,
                                                            controller,
                                                          ),
                                                        )
                                                        .toList()
                                                    : controller
                                                        .companyModelList
                                                        .map(
                                                          (e) => buildInkWell(
                                                            e,
                                                            controller,
                                                          ),
                                                        )
                                                        .toList(),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInkWell(CompanyModel e, CompanyController controller) {
    return InkWell(
      onTap: () {
        controller.onCompanyTap(e);
      },
      child: Container(
        color: controller.selectedCompanyModel == e
            ? Colors.grey[300]
            : controller.companyModelList.indexOf(e) % 2 == 0
                ? Colors.white
                : Colors.grey[200],
        child: Row(
          children: [
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CompanyEnum.values.length,
              text: e.name.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CompanyEnum.values.length,
              text: e.mobileNoList,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CompanyEnum.values.length,
              text: e.address.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CompanyEnum.values.length,
              text: e.placeOfDispatch.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CompanyEnum.values.length,
              text: e.pan.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CompanyEnum.values.length,
              text: e.gstin.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CompanyEnum.values.length,
              // text: validate,
              text: getFormattedDateTime(e.createdAt),
            ),
          ],
        ),
      ),
    );
  }
}
