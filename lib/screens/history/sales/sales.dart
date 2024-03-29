import 'dart:io';

import 'package:annai_store/controller/history/sales/sales.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/history/sales.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/screens/billing/sales/sales.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:annai_store/utils/upi.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/custom_button.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/full_container.dart';
import 'package:annai_store/widgets/header_text.dart';
import 'package:annai_store/widgets/print_optn.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class SalesHistory extends StatefulWidget {
  const SalesHistory({super.key});

  @override
  _SalesHistoryState createState() => _SalesHistoryState();
}

class _SalesHistoryState extends State<SalesHistory> {
  SalesHistoryNotifier salesHistoryNotifier = Get.put(SalesHistoryNotifier());
  HomeController homeController = Get.put(HomeController());
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    salesHistoryNotifier.onInit();
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) async {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);

        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            debugPrint('History Keyboard: ${data.logicalKey}');

            if (!isKeyDown) {
              if (data.logicalKey == LogicalKeyboardKey.arrowDown) {
                salesHistoryNotifier.updateSelectedBillModel();
              } else if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
                salesHistoryNotifier.updateUpSelectedBillModel();
              } else if (data.logicalKey == LogicalKeyboardKey.f2) {
                showPrintOptnDialog(context);
              } else if (data.logicalKey == LogicalKeyboardKey.f1) {
                salesHistoryNotifier.viewBill(
                  salesHistoryNotifier.selectedBillModel!,
                  homeController,
                  UPIDetails(salesHistoryNotifier.selectedBillModel!.price)
                      .toStr(),
                );
              } else if (data.logicalKey == LogicalKeyboardKey.f3) {
                salesHistoryNotifier.viewThermal(
                  salesHistoryNotifier.selectedBillModel!,
                  homeController,
                  UPIDetails(salesHistoryNotifier.selectedBillModel!.price)
                      .toStr(),
                );
              } else if (data.logicalKey == LogicalKeyboardKey.f4) {
                setState(() {
                  isA4.value = !isA4.value;
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
        body: GetBuilder<SalesHistoryNotifier>(
          builder: (controller) {
            return FullWidthHeightContainer(
              child: ListView(
                children: [
                  Container(
                    height: CustomScreenUtility(context).height * 0.1,
                    child: const HeaderText(
                      header: "Sales History Management",
                    ),
                  ),
                  // CustomButton(
                  //     icon: Icons.delete,
                  //     text: "Delete All",
                  //     onTap: () {
                  //       salesHistoryNotifier.clearAllBills();
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
                      SizedBox(
                        width: 140,
                        child: CustomTextField(
                          controller: controller.searchController,
                          label: "Search By Customer and Bill",
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      CustomButton(
                        buttonColor: Colors.green[400],
                        icon: Icons.search,
                        text: "Search",
                        onTap: () {
                          controller.search();
                        },
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      CustomButton(
                        buttonColor: Colors.yellow[600],
                        icon: Icons.search,
                        text: "Show all",
                        onTap: () {
                          controller.performInit();
                        },
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        width: CustomScreenUtility(context).width /
                                SalesHistoryEnum.values.length -
                            10,
                        alignment: Alignment.centerLeft,
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: isA4,
                                  builder: (context, value, _) {
                                    return Checkbox(
                                      value: value,
                                      onChanged: (bool? val) {
                                        if (val != null) {
                                          isA4.value = val;
                                        }
                                      },
                                    );
                                  }),
                              // ValueBuilder(
                              //   builder: (context) {
                              //     return Checkbox(
                              //       value: isA4,
                              //       onChanged: (bool? val) {
                              //         if (val != null) {
                              //           setState(() {
                              //             isA4 = val;
                              //           });
                              //         }
                              //       },
                              //     );
                              //   },
                              // ),
                              const CustomText("F4.A4")
                            ],
                          ),
                        ),
                      ),
                      // CustomTextButton(
                      //   "Fix Bill No",
                      //   onPressed: () {
                      //     controller.fixBillNo();
                      //   },
                      // ),
                      // CustomTextButton(
                      //   "Clear Given Amount",
                      //   backgoundColor: Colors.red,
                      //   textColor: Colors.white,
                      //   onPressed: () {
                      //     controller.clearGivenAmount();
                      //   },
                      // ),
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
                                  children: SalesHistoryEnum.values
                                      .map(
                                        (e) => CustomTableHeaderElement(
                                          width: CustomScreenUtility(context)
                                                  .width /
                                              SalesHistoryEnum.values.length,
                                          text: getStrofAddSalesHistoryEnum(e),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            if (salesHistoryNotifier.billsList == null)
                              const CustomText("No Bills to display")
                            else if (salesHistoryNotifier.billsList!.isEmpty)
                              const CustomText("No Bills to display")
                            else
                              FullWidthHeightContainer(
                                child: ListView.builder(
                                  itemCount:
                                      salesHistoryNotifier.billsList!.length,
                                  itemBuilder: (context, index) {
                                    final bill =
                                        salesHistoryNotifier.billsList![index];
                                    return buildInkWell(bill);
                                  },
                                ),
                              ),
                            // Column(
                            //   children: salesHistoryNotifier.billsList!
                            //       .map((e) => buildInkWell(e))
                            //       .toList(),
                            // )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  ValueNotifier<bool> isA4 = ValueNotifier(false);
  Widget buildInkWell(BillModel billModel) {
    return InkWell(
      onDoubleTap: () {
        // debugPrint("Double Tap");
        // if (billModel.isA4Printed ?? false) {
        //   CustomUtilies.customFailureSnackBar("Error", "You cannot edit Bill");
        // } else {
        homeController.setCurrentSelectedWidget(
          SalesScreen(
            billModel: billModel,
          ),
        );
        homeController.update();
        // }
      },
      onTap: () {
        salesHistoryNotifier.setSelectedBillModel = billModel;
      },
      child: ExpansionTile(
        title: Container(
          color:
              salesHistoryNotifier.selectedBillModel?.billNo == billModel.billNo
                  ? Colors.grey[300]
                  : Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomTableElement(
                  width: CustomScreenUtility(context).width /
                      SalesHistoryEnum.values.length,
                  text: Utility.onlyDate(billModel.dateTime),
                ),
                CustomTableElement(
                  width: CustomScreenUtility(context).width /
                      SalesHistoryEnum.values.length,
                  text: "",
                ),
                CustomTableElement(
                  width: CustomScreenUtility(context).width /
                      SalesHistoryEnum.values.length,
                  text: billModel.billNo,
                ),
                CustomTableElement(
                  width: CustomScreenUtility(context).width /
                      SalesHistoryEnum.values.length,
                  text: billModel.customerModel.name,
                ),
                CustomTableElement(
                  width: CustomScreenUtility(context).width /
                      SalesHistoryEnum.values.length,
                  text: billModel.billNo == "2865 / 2022 - 2023"
                      ? billModel.price.toStringAsFixed(2)
                      : billModel.price.round().toStringAsFixed(2),
                ),
                CustomTableElement(
                  width: CustomScreenUtility(context).width /
                      (SalesHistoryEnum.values.length + 2),
                  text: (billModel.price - billModel.givenAmount!)
                      .round()
                      .toStringAsFixed(2),
                ),
                Container(
                  width: CustomScreenUtility(context).width /
                          SalesHistoryEnum.values.length -
                      30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // if (billModel.isA4Printed ?? false)
                          //   Container()
                          // else
                          //   InkWell(
                          //     onTap: () async {
                          //       await salesDB.deleteBill(billModel);
                          //       salesHistoryNotifier.performInit();
                          //     },
                          //     child: Column(
                          //       children: [
                          //         CustomIcon(
                          //           Icons.delete,
                          //           color: Colors.red[400],
                          //           size: 16,
                          //         ),
                          //         CustomText(
                          //           "Delete",
                          //           size: 8,
                          //           color: Colors.grey[600],
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          InkWell(
                            onTap: () async {
                              if (isA4.value) {
                                await salesHistoryNotifier.viewBill(
                                  billModel,
                                  homeController,
                                  UPIDetails(billModel.price).toStr(),
                                );
                              } else {
                                await salesHistoryNotifier.viewThermal(
                                  billModel,
                                  homeController,
                                  UPIDetails(billModel.price).toStr(),
                                );
                              }
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
                              if (isA4.value) {
                                final data = await PDFGenerator.generateBill(
                                  billModel,
                                  UPIDetails(billModel.price).toStr(),
                                );
                                final file = File(data);
                                await PrinterUtility.normalPrint(file);
                              } else {
                                final data = await PDFGenerator
                                    .generateThermalBillForSales(
                                  billModel,
                                  UPIDetails(billModel.price).toStr(),
                                );
                                final file = File(data);
                                await PrinterUtility.thermalPrint(file);
                              }
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
