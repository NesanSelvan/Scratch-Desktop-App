import 'dart:async';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/billing/sales/sales_four.dart';
import 'package:annai_store/controller/billing/sales/sales_one.dart';
import 'package:annai_store/controller/billing/sales/sales_three.dart';
import 'package:annai_store/controller/billing/sales/sales_two.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/printer/printer.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/screens/billing/sales/components/sales_button.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/full_container.dart';
import 'package:annai_store/widgets/header_text.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class SalesScreen extends StatefulWidget {
  BillModel? billModel;
  SalesScreen({super.key, this.billModel});

  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  SalesBillingController salesBillingController =
      Get.put(SalesBillingController());
  SalesBillingOneController salesBillingOneController =
      Get.put(SalesBillingOneController());
  SalesBillingTwoController salesBillingTwoController =
      Get.put(SalesBillingTwoController());
  SalesBillingThreeController salesBillingThreeController =
      Get.put(SalesBillingThreeController());
  SalesBillingFourController salesBillingFourController =
      Get.put(SalesBillingFourController());
  final FocusNode _focusNode = FocusNode();

  Future normalPrint() async {
    debugPrint('Adding... ');
    if (salesBillingController.salesCurrentScreen == 1) {
      await salesBillingOneController.addBillToDB(
        salesBillingController,
        PrinterEnum.Normal,
      );
    } else if (salesBillingController.salesCurrentScreen == 2) {
      await salesBillingTwoController.addBillToDB(
        salesBillingController,
        PrinterEnum.Normal,
      );
    } else if (salesBillingController.salesCurrentScreen == 3) {
      await salesBillingThreeController.addBillToDB(
        salesBillingController,
        PrinterEnum.Normal,
      );
    } else {
      await salesBillingFourController.addBillToDB(
        salesBillingController,
        PrinterEnum.Normal,
      );
    }
  }

  Future thermalPrint() async {
    if (salesBillingController.salesCurrentScreen == 1) {
      await salesBillingOneController.addBillToDB(
        salesBillingController,
        PrinterEnum.Thermal,
      );
    } else if (salesBillingController.salesCurrentScreen == 2) {
      await salesBillingTwoController.addBillToDB(
        salesBillingController,
        PrinterEnum.Thermal,
      );
    } else if (salesBillingController.salesCurrentScreen == 3) {
      await salesBillingThreeController.addBillToDB(
        salesBillingController,
        PrinterEnum.Thermal,
      );
    } else {
      await salesBillingFourController.addBillToDB(
        salesBillingController,
        PrinterEnum.Thermal,
      );
    }
  }

  Future addBill() async {
    if (salesBillingController.salesCurrentScreen == 1) {
      await salesBillingOneController.addBillToDB(
        salesBillingController,
        PrinterEnum.None,
      );
    } else if (salesBillingController.salesCurrentScreen == 2) {
      await salesBillingTwoController.addBillToDB(
        salesBillingController,
        PrinterEnum.None,
      );
    } else if (salesBillingController.salesCurrentScreen == 3) {
      await salesBillingThreeController.addBillToDB(
        salesBillingController,
        PrinterEnum.None,
      );
    } else {
      await salesBillingFourController.addBillToDB(
        salesBillingController,
        PrinterEnum.None,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (widget.billModel != null) {
        salesBillingOneController.setBillModel = widget.billModel!;
        salesBillingOneController.performInit();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final c = FocusScope.of(context);
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) async {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);

        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            debugPrint('Hostory Keyboard: ${data.logicalKey}');

            if (!isKeyDown) {
              if (data.logicalKey == LogicalKeyboardKey.f1) {
                debugPrint("Cliecked F1");
                salesBillingController.updateCurrentSalesWidgetToNext();
              } else if (data.logicalKey == LogicalKeyboardKey.f2) {
                await normalPrint();
              } else if (data.logicalKey == LogicalKeyboardKey.f3) {
                await thermalPrint();
              } else if (data.logicalKey == LogicalKeyboardKey.f4) {
                await addBill();
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
        backgroundColor: Colors.white,
        body: FullWidthHeightContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderText(
                  header: "Sales Bill Management",
                ),
                const SizedBox(height: 10),
                Align(
                  child: Container(
                    // color: Colors.red,
                    width: CustomScreenUtility(context).width * 0.98,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GetBuilder<SalesBillingController>(
                              builder: (controller) {
                                return Row(
                                  children: [1, 2, 3, 4]
                                      .map(
                                        (e) => CustomTextButton(
                                          "F1.$e",
                                          onPressed: () {
                                            controller
                                                .updateCurrentSalesWidget(e);
                                          },
                                          backgoundColor:
                                              controller.salesCurrentScreen == e
                                                  ? kPrimaryColor
                                                  : Colors.white,
                                          textColor:
                                              controller.salesCurrentScreen != e
                                                  ? kPrimaryColor
                                                  : Colors.white,
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(width: 5),
                            SalesButton(
                              text: "Send SMS",
                              onPressed: () async {
                                // SearchUtility.customSearch(
                                //     "Ag", customerDB.getAllCustomer());
                                // salesBillingController.onInit();
                              },
                            ),
                            const SizedBox(width: 5),
                            SalesButton(
                              text: "F2.Print",
                              onPressed: normalPrint,
                            ),
                            const SizedBox(width: 5),
                            SalesButton(
                              text: "F3.Thermal",
                              onPressed: thermalPrint,
                            ),
                            const SizedBox(width: 5),
                            SalesButton(
                              text: "F4.Add",
                              onPressed: addBill,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GetBuilder<SalesBillingController>(
                  builder: (controller) {
                    return controller.currentSalesWidget;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSuggestionContainer(
    Function(ProductModel) onSelected,
    Iterable<ProductModel> options,
    BuildContext context,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: Container(
          width: CustomScreenUtility(context).width * 0.2,
          height: 200.0,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final ProductModel option = options.elementAt(index);
              return InkWell(
                onTap: () {
                  onSelected(option);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomText(option.productName),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DateTimeInkWell extends StatelessWidget {
  const DateTimeInkWell({
    super.key,
    required this.onTap,
    required this.dateTime,
  });
  final VoidCallback onTap;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: CustomText(getFormattedDate(dateTime)),
          ),
          const SizedBox(width: 10),
          const CustomIcon(
            Icons.calendar_today,
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }
}
