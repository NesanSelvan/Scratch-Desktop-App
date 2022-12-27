import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/controller/payments/receipt/receipt.dart';
import 'package:annai_store/core/constants/calculations/report.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/payments/receipt.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/screens/billing/sales/sales.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/custom_button.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/full_container.dart';
import 'package:annai_store/widgets/header_text.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class ReceiptScreen extends StatelessWidget {
  ReceiptScreen({Key? key}) : super(key: key);
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNodeCustomer = FocusNode();
  final FocusNode _focusNodeCustomer1 = FocusNode();
  final FocusNode _focusNodeBillNo = FocusNode();
  ReceiptController receiptController = Get.put(ReceiptController());
  HomeController homeController = Get.put(HomeController());

  void onBillNoControllerEditingComplete() {
    // if (receiptController.selectedBillModel != null) {
    //   debugPrint(
    //       'Selected selectedBillModel :P ${receiptController.selectedBillModel}');
    //   receiptController.salesBillNoController.text =
    //       receiptController.selectedBillModel!.billNo!;
    // }
    if (receiptController.selectedBillModel != null) {
      receiptController.salesBillNoController.text =
          receiptController.selectedBillModel!.billNo;
      receiptController.pendingAmountController.text =
          "${receiptController.selectedBillModel!.price - receiptController.selectedBillModel!.givenAmount!}";
      final customerData = receiptController.customersList
          ?.where(
            (element) =>
                element.id ==
                receiptController.selectedBillModel?.customerModel.id,
          )
          .toList();

      if (customerData!.isEmpty) {
        CustomUtilies.customFailureSnackBar(
          "Error",
          "There is no customer for this bill",
        );
        return;
      }
      receiptController.selectedCustomerModel = customerData[0];
      receiptController.customerController.text =
          receiptController.selectedCustomerModel!.name;
      receiptController.update();
    }
  }

  void onCustomerControllerComplete() {
    if (receiptController.selectedCustomerModel != null) {
      debugPrint(
        'Selected Customer :P ${receiptController.selectedCustomerModel}',
      );
      final pendingAmount = ReportCalculations.getStartBalance(
        DateTime(DateTime.now().year, 4),
        receiptController.selectedCustomerModel!.id,
      );
      receiptController.customerController.text =
          receiptController.selectedCustomerModel!.name;
      receiptController.pendingAmountController.text =
          pendingAmount.toStringAsFixed(2);
    } else {
      CustomUtilies.customFailureSnackBar(
        "Please Enter the Customer First",
        "Error",
      );
      _focusNodeCustomer1.requestFocus();
    }
    receiptController.salesBillNoController.clear();
    receiptController.setSelectedBillModel = null;
    receiptController.update();
  }

  @override
  Widget build(BuildContext context) {
    receiptController.performInit();
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
                // receiptController.updateSelectedBillModel();
              } else if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
                // receiptController.updateUpSelectedBillModel();
              } else if (data.logicalKey == LogicalKeyboardKey.f2) {
                // showPrintOptnDialog(context);
              } else if (data.logicalKey == LogicalKeyboardKey.f1) {
                // receiptController.viewBill(
                //     receiptController.selectedBillModel!, homeController);
              } else if (data.logicalKey == LogicalKeyboardKey.f3) {
                // receiptController.viewThermal(
                //     receiptController.selectedBillModel!, homeController);
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
        body: GetBuilder<ReceiptController>(
          init: ReceiptController(),
          builder: (controller) {
            return FullWidthHeightContainer(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: CustomScreenUtility(context).height * 0.1,
                      child: const HeaderText(
                        header: "Receipt Management",
                      ),
                    ),
                    // CustomButton(
                    //     icon: Icons.delete,
                    //     text: "Delete All",
                    //     onTap: () {
                    //       receiptController.clearAllBills();
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
                        // CustomButton(
                        //   buttonColor: Colors.blue[300],
                        //   icon: Icons.add,
                        //   text: "Reset",
                        //   onTap: () {
                        //     receiptDB.resetReceipts();
                        //     controller.performInit();
                        //   },
                        // ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: CustomScreenUtility(context).width * 0.25,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: controller.isA5,
                                        onChanged: (bool? val) {
                                          controller.setIsA5 = val;
                                        },
                                      ),
                                      const CustomText("A5")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: controller.isPrint,
                                        onChanged: (bool? val) {
                                          controller.setIsPrint = val;
                                        },
                                      ),
                                      const CustomText("Print")
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DateTimeInkWell(
                                onTap: () async {
                                  final dateTime = await showDatePickerDialog(
                                    context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now().subtract(
                                      const Duration(days: 365 * 5),
                                    ),
                                  );
                                  controller.setPickedDateTime(dateTime);
                                },
                                dateTime: controller.pickedDateTime,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: CustomScreenUtility(context).width *
                                        0.2,
                                    child: RawKeyboardListener(
                                      focusNode: _focusNodeBillNo,
                                      onKey: (RawKeyEvent rawKeyEvent) {
                                        final isKeyDown =
                                            Utility().isKeyDown(rawKeyEvent);
                                        switch (rawKeyEvent.data.runtimeType) {
                                          case RawKeyEventDataWindows:
                                            final data = rawKeyEvent.data
                                                as RawKeyEventDataWindows;
                                            debugPrint('${data.logicalKey}');

                                            if (!isKeyDown) {
                                              if (data.logicalKey ==
                                                  LogicalKeyboardKey
                                                      .arrowDown) {
                                                controller
                                                    .keyboardSelectBillModel();
                                              } else if (data.logicalKey ==
                                                  LogicalKeyboardKey.enter) {
                                                onBillNoControllerEditingComplete();
                                              }
                                            }
                                            break;
                                          default:
                                            throw Exception(
                                              'Unsupported platform ${rawKeyEvent.data.runtimeType}',
                                            );
                                        }
                                      },
                                      child: TypeAheadField<BillModel>(
                                        textFieldConfiguration:
                                            TextFieldConfiguration(
                                          autofocus: true,
                                          onEditingComplete: () {
                                            onBillNoControllerEditingComplete();
                                            controller.givenAmountNode
                                                .requestFocus();
                                          },
                                          controller:
                                              controller.salesBillNoController,
                                          decoration: getInputDecoration(
                                            null,
                                            controller.selectedBillModel ==
                                                        null ||
                                                    !_focusNodeBillNo.hasFocus
                                                ? "Enter Bill No"
                                                : controller
                                                    .selectedBillModel!.billNo,
                                            controller.selectedBillModel == null
                                                ? ""
                                                : controller
                                                    .selectedBillModel!.billNo,
                                          ),
                                        ),
                                        suggestionsCallback: (pattern) async {
                                          return controller.billModelList
                                              .where((suggestion) {
                                            return suggestion.billNo
                                                .toString()
                                                .contains(
                                                  pattern.toLowerCase(),
                                                );
                                          });
                                        },
                                        itemBuilder: (
                                          BuildContext context,
                                          BillModel suggestion,
                                        ) {
                                          debugPrint(
                                            'Suggestion Selected ${suggestion.billNo}',
                                          );
                                          return ListTile(
                                            title: Text(suggestion.billNo),
                                          );
                                        },
                                        onSuggestionSelected: (suggestion) {
                                          controller.setSelectedBillModel =
                                              suggestion;
                                          controller.salesBillNoController
                                              .text = suggestion.billNo;

                                          // node.nextFocus();
                                        },
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.resetInputField();
                                    },
                                    child: const CustomIcon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: RawKeyboardListener(
                                  focusNode: _focusNodeCustomer,
                                  onKey: (RawKeyEvent rawKeyEvent) {
                                    final isKeyDown =
                                        Utility().isKeyDown(rawKeyEvent);
                                    switch (rawKeyEvent.data.runtimeType) {
                                      case RawKeyEventDataWindows:
                                        final data = rawKeyEvent.data
                                            as RawKeyEventDataWindows;
                                        debugPrint('${data.logicalKey}');
                                        if (data.logicalKey ==
                                            LogicalKeyboardKey.enter) {
                                          onCustomerControllerComplete();
                                        }
                                        if (!isKeyDown) {
                                          if (data.logicalKey ==
                                              LogicalKeyboardKey.arrowDown) {
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
                                  child: TypeAheadField<CustomerModel>(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      focusNode: _focusNodeCustomer1,
                                      onEditingComplete: () {
                                        onCustomerControllerComplete();

                                        controller.paymentForNode
                                            .requestFocus();
                                      },
                                      controller: controller.customerController,
                                      decoration: getInputDecoration(
                                        null,
                                        controller.selectedCustomerModel ==
                                                    null ||
                                                !_focusNodeCustomer.hasFocus
                                            ? "Enter Customer / Phone No"
                                            : controller
                                                .selectedCustomerModel!.name,
                                        controller.selectedCustomerModel == null
                                            ? ""
                                            : controller
                                                .selectedCustomerModel!.name,
                                      ),
                                    ),
                                    suggestionsCallback: (pattern) async {
                                      return controller.customersList!
                                          .where((suggestion) {
                                        try {
                                          int.parse(pattern);
                                          return suggestion.mobileNo
                                              .toString()
                                              .contains(
                                                pattern.toLowerCase(),
                                              );
                                        } catch (e) {
                                          return suggestion.name
                                              .toLowerCase()
                                              .contains(
                                                pattern.toLowerCase(),
                                              );
                                        }
                                      });
                                    },
                                    itemBuilder: (
                                      BuildContext context,
                                      CustomerModel suggestion,
                                    ) {
                                      debugPrint(
                                        'Suggestion Selected ${suggestion.name}',
                                      );
                                      return ListTile(
                                        tileColor:
                                            controller.selectedCustomerModel ==
                                                    suggestion
                                                ? Colors.grey[300]
                                                : Colors.white,
                                        title: Text(suggestion.name),
                                      );
                                    },
                                    onSuggestionSelected: (suggestion) {
                                      controller.selectedCustomerModel =
                                          suggestion;
                                      controller.customerController.text =
                                          suggestion.name;
                                      final pendingAmount =
                                          ReportCalculations.getStartBalance(
                                        DateTime(DateTime.now().year, 4),
                                        suggestion.id,
                                      );
                                      controller.pendingAmountController.text =
                                          pendingAmount.toStringAsFixed(2);
                                      debugPrint('Selected $suggestion');
                                      // node.nextFocus();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                label: "Receipt No",
                                controller: controller.receiptNoController,
                                onEditingComplete: () {},
                                isEnabled: false,
                              ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // CustomTextField(
                              //   label: "Bill No",
                              //   controller: controller.billNoController,
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                label: "Pending Amount",
                                isEnabled: false,
                                controller: controller.pendingAmountController,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                focusNode: controller.paymentForNode,
                                label: "Payment For",
                                controller: controller.paymentForController,
                                onEditingComplete: () {
                                  controller.receivedFromNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                focusNode: controller.givenAmountNode,
                                label: "Given Amount",
                                controller: controller.givenAmountController,
                                onEditingComplete: () {
                                  controller.receivedFromNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                focusNode: controller.receivedFromNode,
                                label: "Received From",
                                controller: controller.receivedFromController,
                                onEditingComplete: () {
                                  controller.paymentMethodNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DropdownButton<String>(
                                focusNode: controller.paymentMethodNode,
                                onChanged: (data) async {
                                  controller.performInit();
                                  print(
                                    "All Customer = ${controller.customersList}",
                                  );
                                  if (data != null) {
                                    controller.setSelectedPaymentMethod(data);
                                  }

                                  controller.paymentIDNode.requestFocus();
                                },
                                value: controller.selectedPaymentMethod,
                                items: paymentMethod
                                    .map(
                                      (e) => DropdownMenuItem(
                                        onTap: () {},
                                        value: e,
                                        child: CustomText(e),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                focusNode: controller.paymentIDNode,
                                label: "Payment ID",
                                controller: controller.paymentIDController,
                                onEditingComplete: () async {
                                  await controller.addReceiptData();
                                  controller.resetInputField();
                                  _focusNodeCustomer1.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              CustomButton(
                                buttonColor: kPrimaryColor,
                                icon: Icons.add,
                                text: "Add",
                                onTap: () async {
                                  await controller.addReceiptData();
                                  controller.resetInputField();
                                  _focusNodeCustomer1.requestFocus();
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: CustomScreenUtility(context).width * 0.75,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                color: kLightPrimaryColor,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: ReceiptEnum.values
                                        .map(
                                          (e) => CustomTableHeaderElement(
                                            width: CustomScreenUtility(context)
                                                    .width *
                                                0.75 /
                                                ReceiptEnum.values.length,
                                            text: getStrofReceiptEnum(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              if (receiptController.receiptsList == null)
                                const Align(
                                  child: CustomText("No Receipts to display"),
                                )
                              else if (receiptController.receiptsList!.isEmpty)
                                const Align(
                                  child: CustomText("No Receipts to display"),
                                )
                              else
                                Column(
                                  children: receiptController.receiptsList!
                                      .map(
                                        (e) => Row(
                                          children: [
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.75 /
                                                  ReceiptEnum.values.length,
                                              text: e.receiptNo,
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.75 /
                                                  ReceiptEnum.values.length,
                                              text: e.customerModel.name,
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.75 /
                                                  ReceiptEnum.values.length,
                                              text: e.receivedFrom ?? '',
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.75 /
                                                  ReceiptEnum.values.length,
                                              text: e.paymentFor ?? '',
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.75 /
                                                  ReceiptEnum.values.length,
                                              text: "${e.givenAmount}",
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.75 /
                                                  ReceiptEnum.values.length,
                                              text: "${e.advanceAmount}",
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.75 /
                                                  ReceiptEnum.values.length,
                                              text: e.paymentMethod,
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.75 /
                                                  ReceiptEnum.values.length,
                                              text: getFormattedDate(
                                                e.createdAt,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () => controller
                                                      .printReceipt(e),
                                                  child: CustomIcon(
                                                    Icons.print,
                                                    color: Colors.blue[400],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () =>
                                                      controller.viewReceipt(e),
                                                  child: CustomIcon(
                                                    Icons.visibility,
                                                    color: Colors.blue[400],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    await controller
                                                        .deleteReceipt(e);
                                                    controller.performInit();
                                                  },
                                                  child: CustomIcon(
                                                    Icons.delete,
                                                    color: Colors.red[400],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
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
}
