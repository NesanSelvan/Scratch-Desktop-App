import 'dart:io';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/history/estimate/estimate.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/history/sales.dart';
import 'package:annai_store/models/estimate/estimate.dart';
import 'package:annai_store/screens/billing/sales/sales.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/custom_button.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/full_container.dart';
import 'package:annai_store/widgets/header_text.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class EstimateHistory extends StatefulWidget {
  const EstimateHistory({Key? key}) : super(key: key);

  @override
  _EstimateHistoryState createState() => _EstimateHistoryState();
}

class _EstimateHistoryState extends State<EstimateHistory> {
  EstimateHistoryNotifier estimateHistoryNotifier =
      Get.put(EstimateHistoryNotifier());
  HomeController homeController = Get.put(HomeController());
  final FocusNode _focusNode = FocusNode();
  final FocusNode _startfocusNode = FocusNode();
  final FocusNode _startKeyboardfocusNode = FocusNode();
  final FocusNode _endKeyboardfocusNode = FocusNode();
  final FocusNode _endfocusNode = FocusNode();
  bool isA4 = false;

  Future viewEstimate(EstimateModel billModel) async {
    debugPrint("Estimate Bill View");
    if (isA4) {
      await estimateHistoryNotifier.viewEstimate(billModel);
    } else {
      await estimateHistoryNotifier.viewThermal(billModel);
    }
  }

  Future showExportDialog(BuildContext context) async {
    _startfocusNode.requestFocus();
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const CustomText("Select Estimate number"),
          contentPadding: const EdgeInsets.all(10),
          children: [
            GetBuilder<EstimateHistoryNotifier>(
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: controller.isSelectAllEstimate,
                          onChanged: (bool? val) {
                            controller.setIsSelectAllEstimate = val;
                          },
                        ),
                        const CustomText("Select All Estimate")
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (!controller.isSelectAllEstimate)
                      Column(
                        children: [
                          RawKeyboardListener(
                            focusNode: _startKeyboardfocusNode,
                            onKey: (RawKeyEvent rawKeyEvent) {
                              final isKeyDown =
                                  Utility().isKeyDown(rawKeyEvent);

                              switch (rawKeyEvent.data.runtimeType) {
                                case RawKeyEventDataWindows:
                                  final data = rawKeyEvent.data
                                      as RawKeyEventDataWindows;
                                  debugPrint('Sales One: ${data.logicalKey}');

                                  if (!isKeyDown) {
                                    if (data.logicalKey ==
                                        LogicalKeyboardKey.arrowDown) {
                                      controller
                                          .keyboardSelectStartEstimateModel();
                                    }
                                  }
                                  break;
                                default:
                                  throw Exception(
                                    'Unsupported platform ${rawKeyEvent.data.runtimeType}',
                                  );
                              }
                            },
                            child: TypeAheadField<EstimateModel>(
                              textFieldConfiguration: TextFieldConfiguration(
                                focusNode: _startfocusNode,
                                controller: controller.startController,
                                onEditingComplete: () {
                                  if (controller.startSelectedEstimateModel !=
                                      null) {
                                    controller.startController.text = controller
                                        .startSelectedEstimateModel!.estimateNo;
                                    _endfocusNode.requestFocus();
                                  }
                                },
                                decoration: getInputDecoration(
                                  null,
                                  controller.startSelectedEstimateModel ==
                                              null ||
                                          !_startfocusNode.hasFocus
                                      ? "Enter Start Estimate No"
                                      : controller.startSelectedEstimateModel!
                                          .estimateNo,
                                  controller.startSelectedEstimateModel == null
                                      ? ""
                                      : controller.startSelectedEstimateModel!
                                          .estimateNo,
                                ),
                              ),
                              suggestionsCallback: (pattern) async {
                                return controller.estimatesList!
                                    .where((element) => element.billId == "")
                                    .where(
                                      (suggestion) => suggestion.estimateNo
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()),
                                    );
                              },
                              itemBuilder: (context, EstimateModel suggestion) {
                                return ListTile(
                                  tileColor:
                                      controller.startSelectedEstimateModel ==
                                              suggestion
                                          ? Colors.grey[300]
                                          : Colors.white,
                                  title: Text(suggestion.estimateNo),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                if (controller.startSelectedEstimateModel !=
                                    null) {
                                  controller.startController.text = controller
                                      .startSelectedEstimateModel!.estimateNo;
                                  _endfocusNode.requestFocus();
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          RawKeyboardListener(
                            focusNode: _endKeyboardfocusNode,
                            onKey: (RawKeyEvent rawKeyEvent) {
                              final isKeyDown =
                                  Utility().isKeyDown(rawKeyEvent);

                              switch (rawKeyEvent.data.runtimeType) {
                                case RawKeyEventDataWindows:
                                  final data = rawKeyEvent.data
                                      as RawKeyEventDataWindows;
                                  debugPrint('Sales One: ${data.logicalKey}');

                                  if (!isKeyDown) {
                                    if (data.logicalKey ==
                                        LogicalKeyboardKey.arrowDown) {
                                      controller
                                          .keyboardSelectEndEstimateModel();
                                    }
                                  }
                                  break;
                                default:
                                  throw Exception(
                                    'Unsupported platform ${rawKeyEvent.data.runtimeType}',
                                  );
                              }
                            },
                            child: TypeAheadField<EstimateModel>(
                              textFieldConfiguration: TextFieldConfiguration(
                                focusNode: _endfocusNode,
                                controller: controller.endController,
                                onEditingComplete: () async {
                                  if (controller.endSelectedEstimateModel !=
                                      null) {
                                    controller.endController.text = controller
                                        .endSelectedEstimateModel!.estimateNo;

                                    await controller.convertToBill();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }
                                },
                                decoration: getInputDecoration(
                                  null,
                                  controller.endSelectedEstimateModel == null ||
                                          !_endfocusNode.hasFocus
                                      ? "Enter End Estimate No"
                                      : controller
                                          .endSelectedEstimateModel!.estimateNo,
                                  controller.endSelectedEstimateModel == null
                                      ? ""
                                      : controller
                                          .endSelectedEstimateModel!.estimateNo,
                                ),
                              ),
                              suggestionsCallback: (pattern) async {
                                return controller.estimatesList!
                                    .where((element) => element.billId == "")
                                    .where(
                                      (element) =>
                                          int.parse(
                                            element.estimateNo
                                                .split("/")
                                                .first
                                                .trim(),
                                          ) >
                                          int.parse(
                                            controller.startController.text
                                                .split("/")
                                                .first
                                                .trim(),
                                          ),
                                    )
                                    .where((suggestion) {
                                  return suggestion.estimateNo
                                      .toLowerCase()
                                      .contains(pattern.toLowerCase());
                                });
                              },
                              itemBuilder: (context, EstimateModel suggestion) {
                                return ListTile(
                                  tileColor:
                                      controller.endSelectedEstimateModel ==
                                              suggestion
                                          ? Colors.grey[300]
                                          : Colors.white,
                                  title: Text(suggestion.estimateNo),
                                );
                              },
                              onSuggestionSelected: (suggestion) async {
                                if (controller.endSelectedEstimateModel !=
                                    null) {
                                  controller.endController.text = controller
                                      .endSelectedEstimateModel!.estimateNo;
                                  await controller.convertToBill();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 30),
                    CustomTextButton(
                      "Convert Now",
                      backgoundColor: kPrimaryColor,
                      textColor: Colors.white,
                      onPressed: () async {
                        await controller.convertToBill();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            )
          ],
        );
      },
    );
  }

  Future printEstimate(EstimateModel billModel) async {
    if (isA4) {
      final data = await PDFGenerator.generateEstimate(billModel);
      final file = File(data);
      await PrinterUtility.normalPrint(file);
    } else {
      final data = await PDFGenerator.generateThermalBillForEstimate(billModel);
      final file = File(data);
      await PrinterUtility.thermalPrint(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    estimateHistoryNotifier.onInit();
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);

        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            debugPrint('History Keyboard: ${data.logicalKey}');

            if (!isKeyDown) {
              if (data.logicalKey == LogicalKeyboardKey.arrowDown) {
                estimateHistoryNotifier.updateSelectedEstimateModel();
              } else if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
                estimateHistoryNotifier.updateUpSelectedEstimateModel();
              } else if (data.logicalKey == LogicalKeyboardKey.f2) {
                printEstimate(estimateHistoryNotifier.selectedEstimateModel!);
              } else if (data.logicalKey == LogicalKeyboardKey.f1) {
                viewEstimate(estimateHistoryNotifier.selectedEstimateModel!);
              } else if (data.logicalKey == LogicalKeyboardKey.f4) {
                setState(() {
                  isA4 = !isA4;
                });
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
        body: GetBuilder<EstimateHistoryNotifier>(
          builder: (controller) {
            return FullWidthHeightContainer(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: CustomScreenUtility(context).height * 0.1,
                      child: const HeaderText(
                        header: "Estimate History Management",
                      ),
                    ),
                    // CustomButton(
                    //     icon: Icons.delete,
                    //     text: "Delete All",
                    //     onTap: () {
                    //       EstimateHistoryNotifier.clearAllBills();
                    //     }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText("Start"),
                            DateTimeInkWell(
                              onTap: () async {
                                final dateTime = await showDatePickerDialog(
                                  context,
                                  initialDate: controller.startDateTime,
                                );
                                controller.setPickedStartDateTime(dateTime);
                              },
                              dateTime: controller.startDateTime,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText("End"),
                            DateTimeInkWell(
                              onTap: () async {
                                final dateTime = await showDatePickerDialog(
                                  context,
                                  initialDate: controller.endDateTime,
                                );
                                controller.setPickedEndDateTime(dateTime);
                              },
                              dateTime: controller.endDateTime,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        CustomButton(
                          buttonColor: Colors.green[400],
                          icon: Icons.search,
                          text: "Search",
                          onTap: () {},
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        CustomButton(
                          buttonColor: Colors.yellow[600],
                          icon: Icons.search,
                          text: "Show all",
                          onTap: () {},
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        CustomButton(
                          buttonColor: Colors.red[600],
                          icon: Icons.one_x_mobiledata_sharp,
                          text: "Convert to Bill",
                          onTap: () async {
                            await showExportDialog(context);
                          },
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: CustomScreenUtility(context).width /
                                  EstimateHistoryEnum.values.length -
                              10,
                          alignment: Alignment.centerLeft,
                          // color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isA4,
                                  onChanged: (bool? val) {
                                    if (val != null) {
                                      setState(() {
                                        isA4 = val;
                                      });
                                    }
                                  },
                                ),
                                const CustomText("F4.A4")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          width: CustomScreenUtility(context).width,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                color: kLightPrimaryColor,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: EstimateHistoryEnum.values
                                        .map(
                                          (e) => CustomTableHeaderElement(
                                            width: CustomScreenUtility(context)
                                                    .width /
                                                EstimateHistoryEnum
                                                    .values.length,
                                            text:
                                                getStrofAddEstimateHistoryEnum(
                                              e,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              if (estimateHistoryNotifier.estimatesList == null)
                                const CustomText("No Estimate Bill to display")
                              else if (estimateHistoryNotifier
                                  .estimatesList!.isEmpty)
                                const CustomText("No Estimate Bill to display")
                              else
                                Column(
                                  children: estimateHistoryNotifier
                                      .estimatesList!
                                      .map((e) => buildInkWell(e))
                                      .toList(),
                                )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildInkWell(EstimateModel billModel) {
    return InkWell(
      onTap: () {
        estimateHistoryNotifier.setSelectedEstimateModel = billModel;
        debugPrint(
          "Seected Bill Model: ${estimateHistoryNotifier.selectedEstimateModel!.estimateNo}",
        );
      },
      child: Container(
        color: estimateHistoryNotifier.selectedEstimateModel?.estimateNo ==
                billModel.estimateNo
            ? kSelectedColor
            : Colors.white,
        child: Row(
          children: [
            InkWell(
              onTap: () async {
                print("Hello");
                final dateTime = await showDatePickerDialog(
                  context,
                  initialDate: billModel.dateTime,
                  firstDate: DateTime.now().subtract(
                    const Duration(
                      days: 365 * 5,
                    ),
                  ),
                  lastDate: DateTime.now().add(
                    const Duration(
                      days: 365 * 5,
                    ),
                  ),
                );
                if (dateTime != null) {
                  estimateHistoryNotifier.updateDateOfPurchaseBill(
                    dateTime,
                    billModel,
                  );
                }
              },
              child: CustomTableElement(
                width: CustomScreenUtility(context).width /
                    EstimateHistoryEnum.values.length,
                text: Utility.onlyDate(billModel.dateTime),
              ),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  EstimateHistoryEnum.values.length,
              text: billModel.estimateNo,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  EstimateHistoryEnum.values.length,
              text: billModel.customerModel.name,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  EstimateHistoryEnum.values.length,
              text: billModel.price.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  EstimateHistoryEnum.values.length,
              text: billModel.billId == "" || billModel.billId == null
                  ? ""
                  : salesDB.getBillModelById(billModel.billId!).billNo,
            ),
            Container(
              width: CustomScreenUtility(context).width /
                      EstimateHistoryEnum.values.length -
                  20,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        viewEstimate(billModel);
                      },
                      child: Column(
                        children: [
                          CustomIcon(
                            Icons.remove_red_eye,
                            color: Colors.red[400],
                            size: 16,
                          ),
                          CustomText(
                            "F1.View",
                            size: 8,
                            color: Colors.grey[600],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () async {
                        await printEstimate(billModel);
                      },
                      child: Column(
                        children: [
                          CustomIcon(
                            Icons.print,
                            size: 16,
                            color: Colors.green[400],
                          ),
                          CustomText(
                            "F2.Print",
                            size: 8,
                            color: Colors.grey[600],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
