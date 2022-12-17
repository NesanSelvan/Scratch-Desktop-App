import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/controller/payments/payment.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/enum/payments/receipt.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:annai_store/screens/billing/sales/sales.dart';
import 'package:annai_store/utils/null/null.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/custom_button.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/custom_typeahead.dart';
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
class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  final FocusNode _focusNode = FocusNode();

  PaymentController paymentController = Get.put(PaymentController());
  HomeController homeController = Get.put(HomeController());

  void onBillNoControllerEditingComplete() {
    if (paymentController.selectedPurchaseBill != null) {
      paymentController.purchaseBillNoController.text =
          paymentController.selectedPurchaseBill!.billNo;
      paymentController.givenAmountNode.requestFocus();
      // paymentController.pendingAmountController.text =
      //     "${paymentController.selectedPurchaseBill!.price - paymentController.selectedPurchaseBill!.givenAmount!}";
      paymentController.update();
    } else if (paymentController.purchaseBillNoController.text == "") {
      paymentController.givenAmountNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    paymentController.performInit();
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
                // paymentController.updateSelectedBillModel();
              } else if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
                // paymentController.updateUpSelectedBillModel();
              } else if (data.logicalKey == LogicalKeyboardKey.f2) {
                // showPrintOptnDialog(context);
              } else if (data.logicalKey == LogicalKeyboardKey.f1) {
                // paymentController.viewBill(
                //     paymentController.selectedPurchaseBill!, homeController);
              } else if (data.logicalKey == LogicalKeyboardKey.f3) {
                // paymentController.viewThermal(
                //     paymentController.selectedPurchaseBill!, homeController);
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
        body: GetBuilder<PaymentController>(
          init: PaymentController(),
          builder: (controller) {
            final buildBillNo = Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: CustomScreenUtility(context).width * 0.2,
                  child: RawKeyboardListener(
                    focusNode: controller.purchaseBillKeyboardNode,
                    onKey: (RawKeyEvent rawKeyEvent) {
                      final isKeyDown = Utility().isKeyDown(rawKeyEvent);
                      switch (rawKeyEvent.data.runtimeType) {
                        case RawKeyEventDataWindows:
                          final data =
                              rawKeyEvent.data as RawKeyEventDataWindows;
                          debugPrint('${data.logicalKey}');

                          if (!isKeyDown) {
                            if (data.logicalKey ==
                                LogicalKeyboardKey.arrowDown) {
                              controller.keyboardSelectPurchaseBillModel(
                                KeyboardEventEnum.ArrowDown,
                              );
                            } else if (data.logicalKey ==
                                LogicalKeyboardKey.arrowUp) {
                              controller.keyboardSelectPurchaseBillModel(
                                KeyboardEventEnum.ArrowUp,
                              );
                            } else if (data.logicalKey ==
                                LogicalKeyboardKey.enter) {
                              if (controller.purchaseBillNoController.text !=
                                  "") {
                                onBillNoControllerEditingComplete();
                              }
                            }
                          }
                          break;
                        default:
                          throw Exception(
                            'Unsupported platform ${rawKeyEvent.data.runtimeType}',
                          );
                      }
                    },
                    child: TypeAheadField<PurchaseModel>(
                      textFieldConfiguration: TextFieldConfiguration(
                        autofocus: true,
                        focusNode: controller.purchaseBillNode,
                        onEditingComplete: () {
                          onBillNoControllerEditingComplete();
                          // controller.paymentForNode
                          //     .requestFocus();
                        },
                        controller: controller.purchaseBillNoController,
                        decoration: getInputDecoration(
                          null,
                          controller.selectedPurchaseBill == null ||
                                  !controller.purchaseBillNode.hasFocus
                              ? "Enter Bill No"
                              : controller.selectedPurchaseBill!.billNo,
                          controller.selectedPurchaseBill == null
                              ? ""
                              : controller.selectedPurchaseBill!.billNo,
                        ),
                      ),
                      suggestionsCallback: (pattern) async {
                        return controller.purchaseBillList.where((suggestion) {
                          return suggestion.billNo
                              .toString()
                              .contains(pattern.toLowerCase());
                        });
                      },
                      itemBuilder:
                          (BuildContext context, PurchaseModel suggestion) {
                        debugPrint(
                          'Suggestion Selected ${suggestion.billNo}',
                        );
                        return ListTile(
                          title: Text(suggestion.billNo),
                          subtitle: CustomText(suggestion.companyModel.name),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        controller.setSelectedPurchaseBillModel = suggestion;
                        controller.purchaseBillNoController.text =
                            suggestion.billNo;

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
            );
            return FullWidthHeightContainer(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: CustomScreenUtility(context).height * 0.1,
                      child: const HeaderText(
                        header: "Payment Management",
                      ),
                    ),
                    // CustomButton(
                    //     icon: Icons.delete,
                    //     text: "Delete All",
                    //     onTap: () {
                    //       paymentController.clearAllBills();
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
                          buttonColor: Colors.blue[300],
                          icon: Icons.add,
                          text: "Reset",
                          onTap: () {
                            receiptDB.resetReceipts();
                            controller.performInit();
                          },
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: CustomScreenUtility(context).width * 0.25,
                          child: Column(
                            children: [
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
                              CustomTypeAhead<CompanyModel>(
                                nextNode: controller.purchaseBillNode,
                                onArrowDown: () {
                                  controller.keyboardSelectCompanyModel(
                                    KeyboardEventEnum.ArrowDown,
                                  );
                                },
                                onArrowUp: () {
                                  controller.keyboardSelectCompanyModel(
                                    KeyboardEventEnum.ArrowUp,
                                  );
                                },
                                onEnter: () {
                                  controller.selectedCompanyModel =
                                      controller.selectedCompanyModel;
                                },
                                focusNode: controller.companyNode,
                                onEditingComplete: () {
                                  controller.selectedCompanyModel =
                                      controller.selectedCompanyModel;
                                },
                                controller: controller.companyController,
                                modelList: controller.allCompaniesModel,
                                model: NullCheckUtilities.getDummyCompany(),
                                selectedModel: controller.selectedCompanyModel,
                                onSuggestionSelected: (suggestion) {
                                  controller.selectedCompanyModel =
                                      controller.selectedCompanyModel;
                                },
                                keyboardFocusNode:
                                    controller.companyKeyboardNode,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                controller:
                                    controller.companyPendingAmountController,
                                label: "Company Pending Amount",
                                isEnabled: false,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              buildBillNo,
                              const SizedBox(
                                height: 20,
                              ),

                              CustomTextField(
                                label: "Total Amount",
                                focusNode: controller.totalAmountNode,
                                controller: controller.totalAmountController,
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
                                focusNode: controller.pendingAmountNode,
                                label: "Pending Amount",
                                controller: controller.pendingAmountController,
                                isEnabled: false,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (controller.selectedPurchaseBill != null)
                                Wrap(
                                  spacing: 20,
                                  runSpacing: 10,
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: paymentDB
                                      .getPaymentByPurchaseID(
                                        controller.selectedPurchaseBill!.id,
                                      )
                                      .map(
                                        (e) => Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey[400]!,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: CustomText(e.paymentNo),
                                        ),
                                      )
                                      .toList(),
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                focusNode: controller.givenAmountNode,
                                label: "Given Amount",
                                controller: controller.givenAmountController,
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
                                  await controller.addPaymentData(context);
                                  controller.resetInputField();
                                  controller.purchaseBillNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              Row(
                                children: [
                                  CustomButton(
                                    buttonColor: kPrimaryColor,
                                    icon: Icons.add,
                                    text: "Add",
                                    onTap: () async {
                                      await controller.addPaymentData(context);
                                      controller.resetInputField();
                                      controller.purchaseBillNode
                                          .requestFocus();
                                    },
                                  ),
                                  CustomButton(
                                    buttonColor: Colors.yellow[700],
                                    icon: Icons.clear,
                                    text: "Clear",
                                    onTap: () async {
                                      controller.resetInputField();
                                      controller.purchaseBillNode
                                          .requestFocus();
                                    },
                                  ),
                                ],
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
                                    children: PaymentEnum.values
                                        .map(
                                          (e) => CustomTableHeaderElement(
                                            width: CustomScreenUtility(context)
                                                    .width *
                                                0.75 /
                                                PaymentEnum.values.length,
                                            text: getStrofPaymentEnum(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              if (controller.paymentList == null)
                                const Align(
                                  child: CustomText("No Payments to display"),
                                )
                              else if (controller.paymentList!.isEmpty)
                                const Align(
                                  child: CustomText("No Payments to display"),
                                )
                              else
                                Column(
                                  children: controller.paymentList!
                                      .map(
                                        (e) => InkWell(
                                          onTap: () {
                                            controller.onPaymentTap(e);
                                          },
                                          child: Row(
                                            children: [
                                              CustomTableElement(
                                                width: CustomScreenUtility(
                                                      context,
                                                    ).width *
                                                    0.75 /
                                                    PaymentEnum.values.length,
                                                text: e.paymentNo,
                                              ),
                                              CustomTableElement(
                                                width: CustomScreenUtility(
                                                      context,
                                                    ).width *
                                                    0.75 /
                                                    PaymentEnum.values.length,
                                                text: purchaseDB
                                                        .getPurchaseModelById(
                                                          e.purchaseId,
                                                        )
                                                        ?.billNo ??
                                                    '-',
                                              ),
                                              CustomTableElement(
                                                width: CustomScreenUtility(
                                                      context,
                                                    ).width *
                                                    0.75 /
                                                    PaymentEnum.values.length,
                                                text:
                                                    '${purchaseDB.getPurchaseModelById(e.purchaseId)?.grandTotal ?? '-'}',
                                              ),
                                              CustomTableElement(
                                                width: CustomScreenUtility(
                                                      context,
                                                    ).width *
                                                    0.75 /
                                                    PaymentEnum.values.length,
                                                text: "${e.givenAmount}",
                                              ),
                                              CustomTableElement(
                                                width: CustomScreenUtility(
                                                      context,
                                                    ).width *
                                                    0.75 /
                                                    PaymentEnum.values.length,
                                                text: e.paymentMethod,
                                              ),
                                              CustomTableElement(
                                                width: CustomScreenUtility(
                                                      context,
                                                    ).width *
                                                    0.75 /
                                                    PaymentEnum.values.length,
                                                text: e.paymentID,
                                              ),
                                              CustomTableElement(
                                                width: CustomScreenUtility(
                                                      context,
                                                    ).width *
                                                    0.75 /
                                                    PaymentEnum.values.length,
                                                text: getFormattedDate(
                                                  e.createdAt,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                    child: CustomIcon(
                                                      Icons.print,
                                                      color: Colors.blue[400],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      final path =
                                                          await PDFGenerator
                                                              .generateA5PaymentModel(
                                                        e,
                                                      );
                                                      PDFGenerator.openPdf(
                                                        path,
                                                      );
                                                    },
                                                    child: CustomIcon(
                                                      Icons.visibility,
                                                      color: Colors.blue[400],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await controller
                                                          .deletePaymentById(
                                                        e,
                                                      );
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
