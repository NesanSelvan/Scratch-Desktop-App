import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/payments/voucher/voucher.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/payments/receipt.dart';
import 'package:annai_store/models/persons/employee/employee.dart';
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
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  final FocusNode _focusNode = FocusNode();
  final FocusNode _EmployeeKeybardfocusNode = FocusNode();

  VoucherController voucherController = Get.put(VoucherController());

  @override
  Widget build(BuildContext context) {
    voucherController.performInit();
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
                // voucherController.updateSelectedBillModel();
              } else if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
                // voucherController.updateUpSelectedBillModel();
              } else if (data.logicalKey == LogicalKeyboardKey.f2) {
                // showPrintOptnDialog(context);
              } else if (data.logicalKey == LogicalKeyboardKey.f1) {
                // voucherController.viewBill(
                //     voucherController.selectedBillModel!, homeController);
              } else if (data.logicalKey == LogicalKeyboardKey.f3) {
                // voucherController.viewThermal(
                //     voucherController.selectedBillModel!, homeController);
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
        body: GetBuilder<VoucherController>(
          init: VoucherController(),
          builder: (controller) {
            return FullWidthHeightContainer(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: CustomScreenUtility(context).height * 0.1,
                      child: const HeaderText(
                        header: "Voucher Management",
                      ),
                    ),
                    // CustomButton(
                    //     icon: Icons.delete,
                    //     text: "Delete All",
                    //     onTap: () {
                    //       voucherController.clearAllBills();
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
                          padding: const EdgeInsets.all(10),
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
                              CustomTextField(
                                label: "Voucher No",
                                controller: controller.voucherNoController,
                                onEditingComplete: () {
                                  controller.descriptionNode.requestFocus();
                                },
                                isEnabled: false,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                focusNode: controller.descriptionNode,
                                autofocus: true,
                                label: "Description",
                                controller: controller.descriptionController,
                                onEditingComplete: () {
                                  controller.employeeNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTypeAhead<EmployeeModel>(
                                focusNode: controller.employeeNode,
                                onArrowDown: () {
                                  controller.keyboardSelectEmployeeModel();
                                },
                                onEditingComplete: () {
                                  if (controller.selectedEmployeeModel !=
                                      null) {
                                    controller.employeeController.text =
                                        controller.selectedEmployeeModel!.name;
                                    controller.givenAMount.requestFocus();
                                  }
                                },
                                controller: controller.employeeController,
                                modelList: controller.employeeList,
                                model: NullCheckUtilities.getDummyEmployee(),
                                onSuggestionSelected: (suggestion) {
                                  controller.selectedEmployeeModel = suggestion;
                                  controller.employeeController.text =
                                      suggestion.name;
                                },
                                selectedModel: controller.selectedEmployeeModel,
                                keyboardFocusNode: _EmployeeKeybardfocusNode,
                              ),
                              // Container(
                              //   child: RawKeyboardListener(
                              //     focusNode: _EmployeeKeybardfocusNode,
                              //     onKey: (RawKeyEvent rawKeyEvent) {
                              //       final isKeyDown =
                              //           Utility().isKeyDown(rawKeyEvent);
                              //       switch (rawKeyEvent.data.runtimeType) {
                              //         case RawKeyEventDataWindows:
                              //           final data = rawKeyEvent.data
                              //               as RawKeyEventDataWindows;
                              //           debugPrint('${data.logicalKey}');
                              //           if (data.logicalKey ==
                              //               LogicalKeyboardKey.enter) {
                              //             if (controller
                              //                     .selectedEmployeeModel !=
                              //                 null) {
                              //               debugPrint(
                              //                   'Selected Customer :P ${controller.selectedEmployeeModel}');
                              //               controller
                              //                       .employeeController.text =
                              //                   controller
                              //                       .selectedEmployeeModel!
                              //                       .name;
                              //               controller.givenAMount
                              //                   .requestFocus();
                              //             } else {
                              //               CustomUtilies.customFailureSnackBar(
                              //                   "Please Enter the Customer First",
                              //                   "Error");
                              //             }
                              //           }
                              //           if (!isKeyDown) {
                              //             if (data.logicalKey ==
                              //                 LogicalKeyboardKey.arrowDown) {
                              //               // controller
                              //               //     .keyboardSelectCustomerModel();
                              //             }
                              //           }
                              //           break;
                              //         default:
                              //           throw Exception(
                              //               'Unsupported platform ${rawKeyEvent.data.runtimeType}');
                              //       }
                              //     },
                              //     child: TypeAheadField<EmployeeModel>(
                              //       textFieldConfiguration:
                              //           TextFieldConfiguration(
                              //               focusNode:
                              //                   controller.employeeNode,
                              //               onEditingComplete: () {
                              //                 if (controller
                              //                         .selectedEmployeeModel !=
                              //                     null) {
                              //                   controller.employeeController
                              //                           .text =
                              //                       controller
                              //                           .selectedEmployeeModel!
                              //                           .name;
                              //                 }
                              //               },
                              //               controller:
                              //                   controller.employeeController,
                              //               decoration: getInputDecoration(
                              //                   null,
                              //                   "Enter Employee",
                              //                   controller.selectedEmployeeModel ==
                              //                           null
                              //                       ? ""
                              //                       : controller
                              //                           .selectedEmployeeModel!
                              //                           .name)),
                              //       suggestionsCallback: (pattern) async {
                              //         return controller.employeeList!.where(
                              //             (suggestion) => suggestion.name
                              //                 .toLowerCase()
                              //                 .contains(
                              //                     pattern.toLowerCase()));
                              //       },
                              //       itemBuilder: (BuildContext context,
                              //           EmployeeModel suggestion) {
                              //         debugPrint(
                              //             'Suggestion Selected ${suggestion.name}');
                              //         return ListTile(
                              //           tileColor: controller
                              //                       .selectedEmployeeModel ==
                              //                   suggestion
                              //               ? Colors.grey[300]
                              //               : Colors.white,
                              //           title: Text(suggestion.name),
                              //         );
                              //       },
                              //       onSuggestionSelected: (suggestion) {
                              //         controller.selectedEmployeeModel =
                              //             suggestion;
                              //         controller.employeeController.text =
                              //             suggestion.name;
                              //         // controller
                              //         //         .pendingAmountController.text =
                              //         //     "${suggestion.pendingAmount}";
                              //         debugPrint('Selected $suggestion');
                              //         // node.nextFocus();
                              //       },
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                label: "Given Amount",
                                controller: controller.givenAmountController,
                                focusNode: controller.givenAMount,
                                onEditingComplete: () {
                                  controller.paymentMethodNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DropdownButton<String>(
                                focusNode: controller.paymentMethodNode,
                                onChanged: (data) {
                                  controller.performInit();
                                  if (data != null) {
                                    controller.setSelectedPaymentMethod(data);
                                    controller.paymentIDNode.requestFocus();
                                  }
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
                                controller: controller.paymentIdController,
                                onEditingComplete: () async {
                                  await controller.addVoucherData();
                                  controller.resetInputField();
                                  controller.descriptionNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomTextButtonIcon(
                                    Icons.add,
                                    "Add",
                                    onPressed: () async {
                                      await controller.addVoucherData();
                                      controller.resetInputField();
                                    },
                                  ),
                                  CustomTextButton(
                                    "Clear",
                                    textColor: Colors.grey[600],
                                    backgoundColor: Colors.yellow,
                                    onPressed: () {
                                      controller.resetInputField();
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
                                    children: VoucherEnum.values
                                        .map(
                                          (e) => CustomTableHeaderElement(
                                            width: CustomScreenUtility(context)
                                                    .width *
                                                0.72 /
                                                VoucherEnum.values.length,
                                            text: getStrofVoucherEnum(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              if (voucherController.vouchersList == null)
                                const Align(
                                  child: CustomText("No Vouchers to display"),
                                )
                              else if (voucherController.vouchersList!.isEmpty)
                                const Align(
                                  child: CustomText("No Vouchers to display"),
                                )
                              else
                                Column(
                                  children: voucherController.vouchersList!
                                      .map(
                                        (e) => Row(
                                          children: [
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.72 /
                                                  VoucherEnum.values.length,
                                              text: e.voucherNo,
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.72 /
                                                  VoucherEnum.values.length,
                                              text: e.givenTo.name,
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.72 /
                                                  VoucherEnum.values.length,
                                              text: e.description,
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.72 /
                                                  VoucherEnum.values.length,
                                              text: "${e.givenAmount}",
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.72 /
                                                  VoucherEnum.values.length,
                                              text: e.paymentMethod,
                                            ),
                                            CustomTableElement(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.72 /
                                                  VoucherEnum.values.length,
                                              text: getFormattedDate(
                                                e.createdAt,
                                              ),
                                            ),
                                            Container(
                                              width: CustomScreenUtility(
                                                    context,
                                                  ).width *
                                                  0.72 /
                                                  VoucherEnum.values.length,
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      final path =
                                                          await PDFGenerator
                                                              .generateA5VoucherBuffer(
                                                        e,
                                                      );
                                                      PDFGenerator
                                                          .openBufferPdf(
                                                        path,
                                                        "voucher_${e.voucherNo.replaceAll(' / ', '-')}",
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.visibility,
                                                      color: Colors.green[400],
                                                    ),
                                                  )
                                                ],
                                              ),
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
