import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../controller/history/sales/sales.dart';
import '../../controller/home/home.dart';
import '../../controller/todays/sales.dart';
import '../../models/bill/bill.dart';
import '../../utils/utility.dart';
import '../../widgets/add_inkwell.dart';
import '../../widgets/custom_table.dart';
import '../../widgets/full_container.dart';
import '../../widgets/header_text.dart';
import '../../widgets/text_field.dart';
import '../add/customer/customer.dart';
import '../billing/sales/sales.dart';

// ignore: must_be_immutable
class TodaysSaleScreen extends StatelessWidget {
  TodaysSaleScreen({Key? key}) : super(key: key);
  SalesHistoryNotifier salesHistoryNotifier = Get.put(SalesHistoryNotifier());
  HomeController homeController = Get.put(HomeController());
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focus2Node = FocusNode();

  final columnList = [
    "Bill No",
    "Customer Name",
    "No of Items",
    "Total Amount",
    "Given Amount"
  ];

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);

        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            // debugPrint('Hostory Keyboard: ${data.logicalKey}');

            if (!isKeyDown) {}
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
          child: Column(
            children: [
              const HeaderText(
                header: "Todays Sales Management",
              ),
              const SizedBox(height: 10),
              Scrollable(
                viewportBuilder:
                    (BuildContext context, ViewportOffset position) {
                  return GetBuilder<TodaysSalesController>(
                    init: TodaysSalesController(),
                    builder: (controller) {
                      return Expanded(
                        child: Container(
                          width: CustomScreenUtility(context).width,
                          color: Colors.grey[100],
                          child: Container(
                            width: CustomScreenUtility(context).width,
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    DateTimeInkWell(
                                      onTap: () {},
                                      dateTime: DateTime.now(),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: CustomScreenUtility(context)
                                                  .width *
                                              0.2,
                                          child: RawKeyboardListener(
                                            focusNode: _focus2Node,
                                            onKey: (RawKeyEvent rawKeyEvent) {
                                              final isKeyDown = Utility()
                                                  .isKeyDown(rawKeyEvent);
                                              switch (rawKeyEvent
                                                  .data.runtimeType) {
                                                case RawKeyEventDataWindows:
                                                  final data = rawKeyEvent.data
                                                      as RawKeyEventDataWindows;
                                                  debugPrint(
                                                    '${data.logicalKey}',
                                                  );
                                                  if (data.logicalKey ==
                                                      LogicalKeyboardKey
                                                          .enter) {
                                                    if (controller
                                                            .selectedCustomerModel !=
                                                        null) {
                                                      debugPrint(
                                                        'Selected Customer :P ${controller.selectedCustomerModel}',
                                                      );
                                                      controller
                                                              .customerController
                                                              .text =
                                                          controller
                                                              .selectedCustomerModel!
                                                              .name;
                                                    } else {
                                                      CustomUtilies
                                                          .customFailureSnackBar(
                                                        "Please Enter the Customer First",
                                                        "Error",
                                                      );
                                                    }
                                                  }
                                                  if (!isKeyDown) {
                                                    if (data.logicalKey ==
                                                        LogicalKeyboardKey
                                                            .arrowDown) {
                                                      controller
                                                          .keyboardSelectCustomerModel();
                                                    }
                                                  }
                                                  break;
                                                default:
                                                  throw Exception(
                                                    'Unsupported platform ${rawKeyEvent.data.runtimeType}',
                                                  );
                                              }
                                            },
                                            child:
                                                TypeAheadField<CustomerModel>(
                                              textFieldConfiguration:
                                                  TextFieldConfiguration(
                                                onEditingComplete: () {
                                                  if (controller
                                                          .selectedCustomerModel !=
                                                      null) {
                                                    controller
                                                            .customerController
                                                            .text =
                                                        controller
                                                            .selectedCustomerModel!
                                                            .name;
                                                  }
                                                },
                                                controller: controller
                                                    .customerController,
                                                decoration: getInputDecoration(
                                                  null,
                                                  "Enter Customer",
                                                  controller.selectedCustomerModel ==
                                                          null
                                                      ? ""
                                                      : controller
                                                          .selectedCustomerModel!
                                                          .name,
                                                ),
                                              ),
                                              suggestionsCallback:
                                                  (pattern) async {
                                                return controller.customersList!
                                                    .where(
                                                  (suggestion) => suggestion
                                                      .name
                                                      .toLowerCase()
                                                      .contains(
                                                        pattern.toLowerCase(),
                                                      ),
                                                );
                                              },
                                              itemBuilder: (BuildContext
                                                      context,
                                                  CustomerModel suggestion) {
                                                debugPrint(
                                                  'Suggestion Selected ${controller.selectedCustomerModel}',
                                                );
                                                return ListTile(
                                                  tileColor: controller
                                                              .selectedCustomerModel ==
                                                          suggestion
                                                      ? Colors.grey[300]
                                                      : Colors.white,
                                                  title: Text(suggestion.name),
                                                );
                                              },
                                              onSuggestionSelected:
                                                  (suggestion) {
                                                controller
                                                        .selectedCustomerModel =
                                                    suggestion;
                                                controller.customerController
                                                    .text = suggestion.name;
                                                debugPrint(
                                                  'Selected $suggestion',
                                                );
                                                // node.nextFocus();
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        AddInkWell(
                                          onPressed: () {
                                            homeController
                                                .setCurrentSelectedWidget(
                                              const AddCustomerScreen(),
                                            );
                                          },
                                          size: CustomScreenUtility(context)
                                                  .width *
                                              0.02,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          "Total Amount",
                                          color: Colors.grey[500],
                                        ),
                                        CustomText(
                                          "${controller.totalAmount}",
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  color: kLightPrimaryColor,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: columnList
                                          .map(
                                            (e) => CustomTableHeaderElement(
                                              width:
                                                  CustomScreenUtility(context)
                                                          .width *
                                                      0.95 /
                                                      columnList.length,
                                              text: e,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: controller.allBills
                                      .map(
                                        (e) => buildInkWell(
                                            e, controller, context),
                                      )
                                      .toList(),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInkWell(
      BillModel e, TodaysSalesController controller, BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: CustomScreenUtility(context).width * 0.95,
        color: controller.allBills.indexOf(e) % 2 == 0
            ? Colors.white
            : Colors.grey[300],
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTableElement(
              width:
                  CustomScreenUtility(context).width * 0.95 / columnList.length,
              text: e.billNo,
            ),
            CustomTableElement(
              width:
                  CustomScreenUtility(context).width * 0.95 / columnList.length,
              text: e.customerModel.name,
            ),
            CustomTableElement(
              width:
                  CustomScreenUtility(context).width * 0.95 / columnList.length,
              text: "${e.productList!.length}",
            ),
            CustomTableElement(
              width:
                  CustomScreenUtility(context).width * 0.95 / columnList.length,
              text: "${e.price}",
            ),
            CustomTableElement(
              width:
                  CustomScreenUtility(context).width * 0.95 / columnList.length,
              text: e.givenAmount.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
