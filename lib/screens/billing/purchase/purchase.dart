import 'package:annai_store/core/constants/constants.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../../controller/billing/purchase/purchase.dart';
import '../../../controller/billing/sales/sales.dart';
import '../../../controller/history/sales/sales.dart';
import '../../../controller/home/home.dart';
import '../../../enum/billing/sales.dart';
import '../../../enum/keyboard.dart';
import '../../../models/company/company.dart';
import '../../../models/product/product.dart';
import '../../../models/purchase/product/purchase_product.dart';
import '../../../utils/image/image.dart';
import '../../../utils/keyboard/keyboard.dart';
import '../../../utils/null/null.dart';
import '../../../utils/utility.dart';
import '../../../widgets/add_inkwell.dart';
import '../../../widgets/custom_keyboard.dart';
import '../../../widgets/custom_table.dart';
import '../../../widgets/custom_typeahead.dart';
import '../../../widgets/full_container.dart';
import '../../../widgets/header_text.dart';
import '../../../widgets/text_field.dart';
import '../../add/customer/customer.dart';
import '../../add/product/product.dart';
import '../sales/components/sales_button.dart';
import '../sales/sales.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  SalesHistoryNotifier salesHistoryNotifier = Get.put(SalesHistoryNotifier());

  PurchaseController purchaseController = Get.put(PurchaseController());

  HomeController homeController = Get.put(HomeController());

  final FocusNode _focusNode = FocusNode();

  final productNode = FocusNode();

  final givenAmountNode = FocusNode();

  final paymentIDNode = FocusNode();

  final qtyNode = FocusNode();

  final rateNode = FocusNode();

  final amountNode = FocusNode();

  final frightNode = FocusNode();

  final taxableValNode = FocusNode();

  final taxNode = FocusNode();

  final totalAmountNode = FocusNode();
  final forwardingSalesNode = FocusNode();

  final discountNode = FocusNode();

  void onCompanySelected() {
    purchaseController.companyController.text =
        purchaseController.selectedCompanyModel!.name;
    purchaseController.productController.clear();
    purchaseController.getPurchaseBillNo();
    purchaseController.getProductsByCompany();
    productNode.requestFocus();
    purchaseController.update();
  }

  void onProductSelected() {
    if (purchaseController.selectedProductModel != null) {
      purchaseController.productController.text =
          purchaseController.selectedProductModel!.productName;
      final category = categoryDB.getCategoryModelById(
        purchaseController.selectedProductModel!.categoryId,
      );
      purchaseController.taxController.text = "${category.tax}";
      qtyNode.requestFocus();
    }
  }

  Future<void> addPurchaseToDB(BuildContext context) async {
    if (purchaseController.purchaseProductModelList.isEmpty) {
      CustomUtilies.customFailureSnackBar("Error", "Please add Products");
      return;
    }
    await purchaseController.addPurchaseToDB();
  }

  Future<void> showTransportAmountDialog(BuildContext context) async {
    final givenAmountController = TextEditingController(text: "0");
    final paymentIDController = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) {
        givenAmountNode.requestFocus();
        givenAmountNode.addListener(() {
          if (givenAmountNode.hasFocus) {
            givenAmountController.selection = TextSelection(
              baseOffset: 0,
              extentOffset: givenAmountController.text.length,
            );
          }
        });
        return SimpleDialog(
          title: CustomText(
            "Lorry Fright Details",
            color: Colors.grey[800],
            size: 20,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: [
            GetBuilder<PurchaseController>(
              init: PurchaseController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: "Lorry Fright",
                      controller: controller.lorryFrightOverallController,
                      onChange: controller.calculateOverallLorryFright,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      focusNode: givenAmountNode,
                      label: "Lorry Fright Tax",
                      controller: controller.lorryFrightOverallTaxController,
                      onChange: controller.calculateOverallLorryFright,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "Lorry Fright Total",
                      isEnabled: false,
                      controller: controller.lorryFrightOverallTotalController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextButton(
                      "Add",
                      onPressed: () async {
                        await addPurchaseToDB(context);
                        Navigator.pop(context);
                      },
                      backgoundColor: kPrimaryColor,
                      textColor: Colors.white,
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

  void addListenerForTextSelection() {
    qtyNode.addListener(() {
      if (qtyNode.hasFocus) {
        purchaseController.qtyController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: purchaseController.qtyController.text.length,
        );
      }
    });
    rateNode.addListener(() {
      if (rateNode.hasFocus) {
        purchaseController.rateController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: purchaseController.rateController.text.length,
        );
      }
    });
    discountNode.addListener(() {
      if (discountNode.hasFocus) {
        purchaseController.discountController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: purchaseController.discountController.text.length,
        );
      }
    });

    frightNode.addListener(() {
      if (frightNode.hasFocus) {
        purchaseController.lorryFrightController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: purchaseController.lorryFrightController.text.length,
        );
      }
    });
    taxNode.addListener(() {
      if (taxNode.hasFocus) {
        purchaseController.taxController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: purchaseController.taxController.text.length,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    addListenerForTextSelection();
    purchaseController.onInit();
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);

        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            debugPrint('Hostory Keyboard: ${data.logicalKey}');

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
        body: SingleChildScrollView(
          child: FullWidthHeightContainer(
            child: Column(
              children: [
                const HeaderText(
                  header: "Purchase Bill Management",
                ),
                const SizedBox(height: 10),
                Align(
                  child: Container(
                    // color: Colors.red,
                    width: CustomScreenUtility(context).width * 0.98,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(width: 5),
                            SalesButton(
                              text: "Save",
                              onPressed: () async {
                                debugPrint("${purchaseController.imagesList}");
                                if (purchaseController.selectedCompanyModel !=
                                    null) {
                                  if (purchaseController.selectedCompanyModel!
                                          .isNormalPurchaseBill ??
                                      true) {
                                    showTransportAmountDialog(context);
                                  } else {
                                    await addPurchaseToDB(context);
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GetBuilder<PurchaseController>(
                  builder: (controller) {
                    return Expanded(
                      child: Container(
                        width: CustomScreenUtility(context).width,
                        color: Colors.grey[100],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: CustomScreenUtility(context).width * 0.2,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.centerLeft,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          CustomScreenUtility(context).width *
                                              0.2,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                DateTimeInkWell(
                                                  onTap: () async {
                                                    final dateTime =
                                                        await showDatePickerDialog(
                                                      context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime.now()
                                                          .subtract(
                                                        const Duration(
                                                          days: 365 * 5,
                                                        ),
                                                      ),
                                                    );
                                                    controller
                                                        .setPickedDateTime(
                                                      dateTime,
                                                    );
                                                  },
                                                  dateTime:
                                                      controller.pickedDateTime,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Container(
                                                  width: CustomScreenUtility(
                                                        context,
                                                      ).width *
                                                      0.15,
                                                  child: CustomTypeAhead<
                                                      ProductModel>(
                                                    // isKeyPressUp: false,
                                                    isSpecialSearch: true,
                                                    keyboardFocusNode: controller
                                                        .productKeyboardNode,

                                                    nextNode: qtyNode,

                                                    onArrowDown: () {
                                                      controller
                                                          .keyboardSelectProductModel(
                                                        KeyboardEventEnum
                                                            .ArrowDown,
                                                      );
                                                    },
                                                    onArrowUp: () {
                                                      controller
                                                          .keyboardSelectProductModel(
                                                        KeyboardEventEnum
                                                            .ArrowUp,
                                                      );
                                                      // setState(() {});
                                                    },
                                                    onEnter: () {
                                                      if (controller
                                                              .selectedProductModel !=
                                                          null) {
                                                        controller
                                                                .productController
                                                                .text =
                                                            controller
                                                                .selectedProductModel!
                                                                .productName;
                                                        qtyNode.requestFocus();
                                                      } else {
                                                        controller
                                                                .selectedProductModel =
                                                            null;
                                                        controller.productNode
                                                            .requestFocus();
                                                      }
                                                      setState(() {});
                                                    },
                                                    focusNode:
                                                        controller.productNode,
                                                    onEditingComplete: () {
                                                      if (controller
                                                              .selectedProductModel !=
                                                          null) {
                                                        controller
                                                                .productController
                                                                .text =
                                                            controller
                                                                .selectedProductModel!
                                                                .productName;
                                                        qtyNode.requestFocus();
                                                      }
                                                    },
                                                    selectedModel: controller
                                                        .selectedProductModel,
                                                    controller: controller
                                                        .productController,
                                                    modelList:
                                                        controller.productsList,
                                                    model: NullCheckUtilities
                                                        .getDummyProduct(),
                                                    onSuggestionSelected:
                                                        (suggestion) {
                                                      controller
                                                              .selectedProductModel =
                                                          suggestion;
                                                      controller
                                                              .productController
                                                              .text =
                                                          suggestion
                                                              .productName;
                                                      debugPrint(
                                                        'Selected $suggestion',
                                                      );
                                                      qtyNode.requestFocus();
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                AddInkWell(
                                                  onPressed: () {
                                                    homeController
                                                        .setCurrentSelectedWidget(
                                                      const AddProductScreen(),
                                                    );
                                                  },
                                                  size: CustomScreenUtility(
                                                        context,
                                                      ).width *
                                                      0.02,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            CustomTextField(
                                              focusNode: qtyNode,
                                              controller:
                                                  controller.qtyController,
                                              label: "Enter Quantity",
                                              onChange: (String val) {
                                                if (controller
                                                        .rateController.text !=
                                                    "") {
                                                  controller.calculateAmounts();
                                                }
                                              },
                                              onEditingComplete: () {
                                                KeyboardUtilities()
                                                    .validateNumberInput(
                                                  controller.qtyController.text,
                                                  rateNode,
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                            CustomTextField(
                                              focusNode: rateNode,
                                              controller:
                                                  controller.rateController,
                                              label: "Enter Rate",
                                              onChange: (String rate) {
                                                try {
                                                  controller.calculateAmounts();
                                                } catch (e) {
                                                  controller.amountController
                                                      .text = "0";
                                                  CustomUtilies
                                                      .customFailureSnackBar(
                                                    "Error",
                                                    "$e",
                                                  );
                                                }
                                              },
                                              onEditingComplete: () {
                                                KeyboardUtilities()
                                                    .validateNumberInput(
                                                  controller
                                                      .rateController.text,
                                                  discountNode,
                                                );
                                                controller.calculateAmounts();
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                            CustomTextField(
                                              focusNode: amountNode,
                                              controller:
                                                  controller.amountController,
                                              label: "Enter Amount",
                                              isEnabled: false,
                                              onEditingComplete: () {
                                                KeyboardUtilities()
                                                    .validateNumberInput(
                                                  controller
                                                      .amountController.text,
                                                  discountNode,
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                            const Divider(),
                                            const SizedBox(height: 10),
                                            CustomTextField(
                                              focusNode: discountNode,
                                              label: "Enter Discount",
                                              controller: controller
                                                  .discountPercController,
                                              onChange: (String val) {
                                                try {
                                                  controller
                                                      .calculateDiscount();
                                                  controller.calculateAmounts();
                                                } catch (e) {
                                                  CustomUtilies
                                                      .customFailureSnackBar(
                                                    "Error",
                                                    "$e",
                                                  );
                                                }
                                              },
                                              onEditingComplete: () {
                                                KeyboardUtilities()
                                                    .validateNumberInput(
                                                  controller
                                                      .discountController.text,
                                                  controller.selectedCompanyModel ==
                                                          null
                                                      ? frightNode
                                                      : (controller
                                                                  .selectedCompanyModel!
                                                                  .isNormalPurchaseBill ??
                                                              true)
                                                          ? taxNode
                                                          : frightNode,
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 10),
                                            InkWell(
                                              onTap: () {
                                                controller
                                                        .isDiscountPercentage =
                                                    !controller
                                                        .isDiscountPercentage;
                                                controller.calculateDiscount();
                                                controller.calculateAmounts();
                                              },
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                    value: controller
                                                        .isDiscountPercentage,
                                                    onChanged: (val) {
                                                      if (val != null) {
                                                        controller
                                                                .isDiscountPercentage =
                                                            val;
                                                        controller
                                                            .calculateDiscount();
                                                        controller
                                                            .calculateAmounts();
                                                      }
                                                    },
                                                  ),
                                                  const Text("Is Percentage"),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextField(
                                              controller:
                                                  controller.discountController,
                                              label: "Discount Amount",
                                              isEnabled: false,
                                              onChange: (String val) {
                                                try {
                                                  controller.calculateAmounts();
                                                } catch (e) {
                                                  CustomUtilies
                                                      .customFailureSnackBar(
                                                    "Error",
                                                    "$e",
                                                  );
                                                }
                                              },
                                              onEditingComplete: () {
                                                KeyboardUtilities()
                                                    .validateNumberInput(
                                                  controller
                                                      .discountController.text,
                                                  controller.selectedCompanyModel ==
                                                          null
                                                      ? frightNode
                                                      : (controller
                                                                  .selectedCompanyModel!
                                                                  .isNormalPurchaseBill ??
                                                              true)
                                                          ? taxNode
                                                          : frightNode,
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 10),
                                            const Divider(),
                                            const SizedBox(height: 20),
                                            if (controller
                                                        .selectedCompanyModel ==
                                                    null ||
                                                (!(controller
                                                        .selectedCompanyModel
                                                        ?.isNormalPurchaseBill ??
                                                    true)))
                                              CustomTextField(
                                                focusNode: frightNode,
                                                controller: controller
                                                    .lorryFrightController,
                                                label: "Enter Lorry Fright",
                                                onChange: (String val) {
                                                  try {
                                                    double.parse(val);
                                                  } catch (e) {
                                                    CustomUtilies
                                                        .customFailureSnackBar(
                                                      "Error",
                                                      "$e",
                                                    );
                                                  }
                                                  controller.calculateAmounts();
                                                },
                                                onEditingComplete: () {
                                                  KeyboardUtilities()
                                                      .validateNumberInput(
                                                    controller
                                                        .lorryFrightController
                                                        .text,
                                                    taxNode,
                                                  );
                                                  controller.calculateAmounts();
                                                },
                                              ),
                                            const SizedBox(height: 20),
                                            CustomTextField(
                                              focusNode: taxableValNode,
                                              controller: controller
                                                  .taxableValueController,
                                              label: "Taxable Value",
                                              isEnabled: false,
                                              onEditingComplete: () {
                                                KeyboardUtilities()
                                                    .validateNumberInput(
                                                  controller
                                                      .taxableValueController
                                                      .text,
                                                  taxNode,
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                            CustomTextField(
                                              focusNode: taxNode,
                                              controller:
                                                  controller.taxController,
                                              label: "Tax",
                                              onChange: (String val) {
                                                try {
                                                  double.parse(val);
                                                  controller.calculateAmounts();
                                                } catch (e) {
                                                  controller.calculateAmounts();
                                                  CustomUtilies
                                                      .customFailureSnackBar(
                                                    "Error",
                                                    "$e",
                                                  );
                                                }
                                              },
                                              onEditingComplete: () {
                                                KeyboardUtilities()
                                                    .validateNumberInput(
                                                  controller.taxController.text,
                                                  productNode,
                                                );
                                                controller
                                                    .addSelectedPurchaseProductModel();
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                            CustomTextField(
                                              focusNode: totalAmountNode,
                                              isEnabled: false,
                                              controller: controller
                                                  .totalAmountController,
                                              label: "Total Amount",
                                              onEditingComplete: () {
                                                KeyboardUtilities()
                                                    .validateNumberInput(
                                                  controller
                                                      .totalAmountController
                                                      .text,
                                                  productNode,
                                                );
                                                controller.productController
                                                    .clear();
                                                productNode.requestFocus();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SalesButton(
                                          text: "Add to Bill",
                                          onPressed: () {
                                            controller
                                                .addSelectedPurchaseProductModel();
                                            controller.productController
                                                .clear();
                                            productNode.requestFocus();
                                          },
                                        ),
                                        SalesButton(
                                          text: "Clear All",
                                          onPressed: () {
                                            controller.clearAll();
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    CustomTextField(
                                      focusNode: forwardingSalesNode,
                                      controller:
                                          controller.forwardingSalesController,
                                      label: "Forwarding Sales",
                                      onEditingComplete: () {
                                        controller.calculateAmounts();
                                        controller.calculateGrandTotal();
                                      },
                                    ),
                                    const SizedBox(height: 70),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: CustomScreenUtility(context).width * 0.8,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: CustomScreenUtility(context)
                                                    .width *
                                                0.2,
                                            child:
                                                CustomTypeAhead<CompanyModel>(
                                              nextNode: controller.productNode,
                                              prevNode:
                                                  controller.invoiceNoNode,
                                              onArrowDown: () {
                                                controller
                                                    .keyboardSelectCompanyModel(
                                                  KeyboardEventEnum.ArrowDown,
                                                );
                                              },
                                              onArrowUp: () {
                                                controller
                                                    .keyboardSelectCompanyModel(
                                                  KeyboardEventEnum.ArrowUp,
                                                );
                                              },
                                              onEnter: () {
                                                if (controller
                                                        .selectedCompanyModel !=
                                                    null) {
                                                  controller.companyController
                                                          .text =
                                                      controller
                                                          .selectedCompanyModel!
                                                          .name;
                                                } else {
                                                  CustomUtilies
                                                      .customFailureSnackBar(
                                                    "Error",
                                                    "Please Select Company to proceed further",
                                                  );
                                                  controller.companyNode
                                                      .requestFocus();
                                                }
                                                debugPrint(
                                                  "controller.companyModelList : ${controller.companiesList}",
                                                );
                                              },
                                              focusNode: controller.companyNode,
                                              onEditingComplete: () {
                                                if (controller
                                                        .selectedCompanyModel !=
                                                    null) {
                                                  controller.companyController
                                                          .text =
                                                      controller
                                                          .selectedCompanyModel!
                                                          .name;
                                                  // final uniqueCode = UniqueCode()
                                                  //     .getBarcodeUniqueCode(
                                                  //         1,
                                                  //         controller.selectedCategory!,
                                                  //         controller.selectedUnit!,
                                                  //         double.parse(controller
                                                  //             .purchasePriceController
                                                  //             .text),
                                                  //         double.parse(controller
                                                  //             .wholesaleController
                                                  //             .text),
                                                  //         double.parse(controller
                                                  //             .retailController.text),
                                                  //         double.parse(controller
                                                  //             .mrpController.text),
                                                  //         controller.selectedCompanyModel!);
                                                  // if (uniqueCode != null) {
                                                  //   barcodeController.text = uniqueCode;
                                                  // }
                                                }
                                              },
                                              controller:
                                                  controller.companyController,
                                              modelList:
                                                  controller.companiesList,
                                              model: NullCheckUtilities
                                                  .getDummyCompany(),
                                              selectedModel: controller
                                                  .selectedCompanyModel,
                                              onSuggestionSelected:
                                                  (suggestion) {
                                                controller
                                                        .setSelectedCompanyModel =
                                                    suggestion;
                                                controller.companyController
                                                    .text = suggestion.name;
                                                debugPrint(
                                                  'Selected $suggestion',
                                                );
                                              },
                                              keyboardFocusNode: controller
                                                  .companyKeyboardNode,
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
                                      Container(
                                        width:
                                            CustomScreenUtility(context).width *
                                                0.2,
                                        child: CustomKeyboard(
                                          focusNode:
                                              controller.invoiceNoKeyboardNode,
                                          child: CustomTextField(
                                            autofocus: true,
                                            focusNode: controller.invoiceNoNode,
                                            controller: controller
                                                .invoiceNumberController,
                                            label: "Enter Invoice No",
                                          ),
                                          onEnter: () {
                                            controller.companyNode
                                                .requestFocus();
                                          },
                                          onArrowUp: () {},
                                          onArrowDown: () {},
                                          onAdd: () {},
                                        ),
                                        // child: CustomTextField(
                                        //   autofocus: true,
                                        //   focusNode: controller.invoiceNoNode,
                                        //   controller:
                                        //       controller.invoiceNumberController,
                                        //   label: "Enter Invoice No",
                                        //   onEditingComplete: () {
                                        //     controller.companyNode.requestFocus();
                                        //   },
                                        // ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            ...controller.imagesList
                                                .map(
                                                  (e) => ImageContainer(
                                                    imagePath: e,
                                                    onRemoveImageTap: () {
                                                      controller
                                                          .removeImageFromImagesList = e;
                                                    },
                                                  ),
                                                )
                                                .toList(),
                                            CustomTextButton(
                                              "Add Image",
                                              onPressed: () {
                                                final result = ImageUtilities
                                                    .openFilePicker();
                                                if (result != null) {
                                                  controller
                                                          .setImageInImagesList =
                                                      result.path;
                                                }
                                              },
                                            )
                                          ],
                                        ),
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
                                            "${controller.grandTotal}",
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
                                        children: PurchaseBillingEnum.values
                                            .map(
                                              (e) => CustomTableHeaderElement(
                                                width:
                                                    CustomScreenUtility(context)
                                                            .width *
                                                        0.8 /
                                                        PurchaseBillingEnum
                                                            .values.length,
                                                text:
                                                    getStrofAddPurchaseBillingEnum(
                                                  e,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      ...controller.purchaseProductModelList
                                          .map(
                                            (e) => buildInkWell(
                                              e,
                                              controller,
                                              context,
                                            ),
                                          )
                                          .toList(),
                                      buildTotalSummary(
                                        controller.getTotalPurchaseProductModel,
                                      ),
                                      if (controller.forwardingSales != 0)
                                        forwardingSales(
                                          controller.forwardingSales,
                                        )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInkWell(PurchaseProductModel e, PurchaseController controller,
      BuildContext context) {
    return InkWell(
      onTap: () {
        controller.onSalesModelTap(e);
      },
      child: Container(
        color: controller.selectedPurchaseProductModel == e
            ? Colors.grey[300]
            : controller.purchaseProductModelList.indexOf(e) % 2 == 0
                ? Colors.white
                : Colors.grey[200],
        child: Row(
          children: [
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.categoryModel.hsnCode.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.productModel.productName,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.qty.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.rate.toStringAsFixed(2),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.amount.toStringAsFixed(2),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.discount.toStringAsFixed(2).toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.lorryFright.toStringAsFixed(2),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.taxableValue.toStringAsFixed(2),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.tax.toStringAsFixed(2),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  PurchaseBillingEnum.values.length,
              text: e.totalAmount.toStringAsFixed(2),
            ),
            InkWell(
              onTap: () {
                controller.removeAPurchaseProduct(e);
              },
              child: CustomTableIconElement(
                width: CustomScreenUtility(context).width *
                    0.8 /
                    PurchaseBillingEnum.values.length,
                iconData: Icons.cancel_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTotalSummary(PurchaseProductModel purchaseProductModel) {
    return Container(
      child: Row(
        children: [
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: purchaseProductModel.qty.toString(),
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: purchaseProductModel.rate.toStringAsFixed(2),
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: purchaseProductModel.amount.toStringAsFixed(2),
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: purchaseProductModel.discount.toStringAsFixed(2),
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: purchaseProductModel.lorryFright.toStringAsFixed(2),
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: purchaseProductModel.taxableValue.toStringAsFixed(2),
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: purchaseProductModel.totalAmount.toStringAsFixed(2),
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
        ],
      ),
    );
  }

  Widget forwardingSales(double totalAmount) {
    return Container(
      child: Row(
        children: [
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "Forwarding Sales",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: totalAmount.toString(),
          ),
          CustomTableElement(
            width: CustomScreenUtility(context).width *
                0.8 /
                PurchaseBillingEnum.values.length,
            text: "",
          ),
        ],
      ),
    );
  }
}
