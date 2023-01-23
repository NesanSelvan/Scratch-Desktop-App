import 'dart:io';

import 'package:annai_store/controller/history/quotation/quotation.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/history/quotation.dart';
import 'package:annai_store/models/quotations/quotations.dart';
import 'package:annai_store/screens/billing/quotation/quotation.dart';
import 'package:annai_store/screens/billing/sales/sales.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/custom_button.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/full_container.dart';
import 'package:annai_store/widgets/header_text.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:qr_flutter/qr_flutter.dart';
import 'package:validators/validators.dart';

class QuotationHistory extends StatefulWidget {
  const QuotationHistory({Key? key}) : super(key: key);

  @override
  _QuotationHistoryState createState() => _QuotationHistoryState();
}

class _QuotationHistoryState extends State<QuotationHistory> {
  QuotationHistoryNotifier quotationHistoryNotifier =
      Get.put(QuotationHistoryNotifier());
  HomeController homeController = Get.put(HomeController());
  final FocusNode _focusNode = FocusNode();
  bool isA4 = false;

  Future viewQuotation(QuotationModel billModel) async {
    if (isA4) {
      await quotationHistoryNotifier.viewQuotation(billModel, homeController);
    } else {
      await quotationHistoryNotifier.viewThermal(billModel, homeController);
    }
  }

  Future printQuotation(QuotationModel billModel) async {
    if (isA4) {
      final data = await PDFGenerator.generateQuotation(billModel);
      final file = File(data);
      await PrinterUtility.normalPrint(file);
    } else {
      final data =
          await PDFGenerator.generateThermalBillForQuotation(billModel);
      final file = File(data);
      await PrinterUtility.thermalPrint(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    quotationHistoryNotifier.onInit();
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
                quotationHistoryNotifier.updateSelectedQuotationModel();
              } else if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
                quotationHistoryNotifier.updateUpSelectedQuotationModel();
              } else if (data.logicalKey == LogicalKeyboardKey.f2) {
                printQuotation(
                  quotationHistoryNotifier.selectedQuotationModel!,
                );
              } else if (data.logicalKey == LogicalKeyboardKey.f1) {
                if (quotationHistoryNotifier.selectedQuotationModel != null) {
                  viewQuotation(
                    quotationHistoryNotifier.selectedQuotationModel!,
                  );
                }
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
        body: GetBuilder<QuotationHistoryNotifier>(
          builder: (controller) {
            return FullWidthHeightContainer(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: CustomScreenUtility(context).height * 0.1,
                      child: const HeaderText(
                        header: "Quotation History Management",
                      ),
                    ),
                    // CustomButton(
                    //     icon: Icons.delete,
                    //     text: "Delete All",
                    //     onTap: () {
                    //       quotationHistoryNotifier.clearAllBills();
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
                        Container(
                          width: CustomScreenUtility(context).width /
                                  QuotationHistoryEnum.values.length -
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
                                    children: QuotationHistoryEnum.values
                                        .map(
                                          (e) => CustomTableHeaderElement(
                                            width: CustomScreenUtility(context)
                                                    .width /
                                                QuotationHistoryEnum
                                                    .values.length,
                                            text:
                                                getStrofAddSalesHistoryEnum(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              if (quotationHistoryNotifier.quotationsList ==
                                  null)
                                const CustomText("No Bills to display")
                              else if (quotationHistoryNotifier
                                  .quotationsList!.isEmpty)
                                const CustomText("No Bills to display")
                              else
                                Column(
                                  children: quotationHistoryNotifier
                                      .quotationsList!
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

  Widget buildInkWell(QuotationModel billModel) {
    return GestureDetector(
      onDoubleTap: () {
        homeController.setCurrentSelectedWidget(
          QuotationScreen(
            quotationModel: billModel,
          ),
        );
        homeController.update();
      },
      child: InkWell(
        onTap: () {
          quotationHistoryNotifier.setSelectedQuotationModel = billModel;
          debugPrint(
            "Seected Bill Model: ${quotationHistoryNotifier.selectedQuotationModel!.quotationNo}",
          );
        },
        child: Container(
          color: quotationHistoryNotifier.selectedQuotationModel!.quotationNo ==
                  billModel.quotationNo
              ? Colors.grey[300]
              : Colors.white,
          child: Row(
            children: [
              CustomTableElement(
                width: CustomScreenUtility(context).width /
                    QuotationHistoryEnum.values.length,
                text: Utility.onlyDate(billModel.dateTime),
              ),
              CustomTableElement(
                width: CustomScreenUtility(context).width /
                    QuotationHistoryEnum.values.length,
                text: billModel.quotationNo,
              ),
              CustomTableElement(
                width: CustomScreenUtility(context).width /
                    QuotationHistoryEnum.values.length,
                text: billModel.customerModel.name,
              ),
              CustomTableElement(
                width: CustomScreenUtility(context).width /
                    QuotationHistoryEnum.values.length,
                text: billModel.price.round().toString(),
              ),
              Container(
                width: CustomScreenUtility(context).width /
                        QuotationHistoryEnum.values.length -
                    20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          viewQuotation(billModel);
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
                          printQuotation(billModel);
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
      ),
    );
  }
}
