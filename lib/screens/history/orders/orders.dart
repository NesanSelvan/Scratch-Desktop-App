import 'dart:io';

import 'package:annai_store/controller/history/order/order.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/history/sales.dart';
import 'package:annai_store/models/orders/order.dart';
import 'package:annai_store/screens/billing/sales/sales.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/custom_button.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/full_container.dart';
import 'package:annai_store/widgets/header_text.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  OrderHistoryNotifier orderHistoryNotifier = Get.put(OrderHistoryNotifier());
  HomeController homeController = Get.put(HomeController());
  final FocusNode _focusNode = FocusNode();
  bool isA4 = false;

  Future viewOrderBill(OrderModel billModel) async {
    if (isA4) {
      await orderHistoryNotifier.viewOrder(billModel);
    } else {
      await orderHistoryNotifier.viewThermal(billModel);
    }
  }

  Future printOrderBill(OrderModel billModel) async {
    if (isA4) {
      final data = await PDFGenerator.generateOrder(billModel);
      final file = File(data);
      await PrinterUtility.normalPrint(file);
    } else {
      final data = await PDFGenerator.generateThermalBillForOrders(billModel);
      final file = File(data);
      await PrinterUtility.thermalPrint(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    orderHistoryNotifier.onInit();
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
                orderHistoryNotifier.updateSelectedOrderModel();
              } else if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
                orderHistoryNotifier.updateUpSelectedOrderModel();
              } else if (data.logicalKey == LogicalKeyboardKey.f2) {
                printOrderBill(orderHistoryNotifier.selectedOrderModel!);
              } else if (data.logicalKey == LogicalKeyboardKey.f1) {
                viewOrderBill(orderHistoryNotifier.selectedOrderModel!);
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
        body: GetBuilder<OrderHistoryNotifier>(
          builder: (controller) {
            return FullWidthHeightContainer(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: CustomScreenUtility(context).height * 0.1,
                      child: const HeaderText(
                        header: "Order History Management",
                      ),
                    ),
                    // CustomButton(
                    //     icon: Icons.delete,
                    //     text: "Delete All",
                    //     onTap: () {
                    //       OrderHistoryNotifier.clearAllBills();
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
                                  SalesHistoryEnum.values.length -
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
                                    children: SalesHistoryEnum.values
                                        .map(
                                          (e) => CustomTableHeaderElement(
                                            width: CustomScreenUtility(context)
                                                    .width /
                                                SalesHistoryEnum.values.length,
                                            text:
                                                getStrofAddSalesHistoryEnum(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              if (orderHistoryNotifier.OrdersList == null)
                                const CustomText("No Bills to display")
                              else if (orderHistoryNotifier.OrdersList!.isEmpty)
                                const CustomText("No Bills to display")
                              else
                                Column(
                                  children: orderHistoryNotifier.OrdersList!
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

  Widget buildInkWell(OrderModel billModel) {
    return InkWell(
      onTap: () {
        orderHistoryNotifier.setSelectedOrderModel = billModel;
        debugPrint(
          "Seected Bill Model: ${orderHistoryNotifier.selectedOrderModel!.orderNo}",
        );
      },
      child: Container(
        color: orderHistoryNotifier.selectedOrderModel!.orderNo ==
                billModel.orderNo
            ? Colors.grey[300]
            : Colors.white,
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
              text: billModel.orderNo,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  SalesHistoryEnum.values.length,
              text: billModel.customerModel.name,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  SalesHistoryEnum.values.length,
              text: billModel.price.toString(),
            ),
            Container(
              width: CustomScreenUtility(context).width /
                      SalesHistoryEnum.values.length -
                  20,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await viewOrderBill(billModel);
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
                        await printOrderBill(billModel);
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
