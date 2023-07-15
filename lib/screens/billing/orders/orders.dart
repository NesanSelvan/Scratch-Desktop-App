import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/core/constants/calculations/basic_cal.dart';
import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../../controller/billing/orders/orders.dart';
import '../../../controller/home/home.dart';
import '../../../controller/product/product.dart';
import '../../../enum/billing/sales.dart';
import '../../../enum/keyboard.dart';
import '../../../enum/printer/printer.dart';
import '../../../models/customer/customer.dart';
import '../../../models/price/price.dart';
import '../../../models/product/product.dart';
import '../../../models/unit/unit.dart';
import '../../../utils/null/null.dart';
import '../../../utils/utility.dart';
import '../../../widgets/add_inkwell.dart';
import '../../../widgets/custom_table.dart';
import '../../../widgets/custom_typeahead.dart';
import '../../../widgets/full_container.dart';
import '../../../widgets/header_text.dart';
import '../../../widgets/text_field.dart';
import '../../add/customer/customer.dart';
import '../../add/product/product.dart';
import '../sales/components/sales_button.dart';
import '../sales/sales.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  OrdersController orderController = Get.put(OrdersController());
  HomeController homeController = Get.put(HomeController());
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focus1Node = FocusNode();
  final FocusNode _customerKeyboardNode = FocusNode();
  final productNode = FocusNode();
  final qtyNode = FocusNode();
  final rateNode = FocusNode();
  final taxKeyboardNode = FocusNode();
  final taxNode = FocusNode();
  final unitNode = FocusNode();
  final unitKeyboardNode = FocusNode();
  final discountNode = FocusNode();

  void normalPrint() {
    orderController.addOrderToDB(PrinterEnum.Normal);
  }

  void thermalPrint() {
    orderController.addOrderToDB(PrinterEnum.Thermal);
  }

  void addToDB() {
    orderController.addOrderToDB(null);
  }

  @override
  Widget build(BuildContext context) {
    orderController.onInit();
    orderController.getAllProducts();
    orderController.getAllCustomers();
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);

        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            debugPrint('Hostory Keyboard: ${data.logicalKey}');

            if (!isKeyDown) {
              if (data.logicalKey == LogicalKeyboardKey.f2) {
                normalPrint();
              } else if (data.logicalKey == LogicalKeyboardKey.f3) {
                thermalPrint();
              } else if (data.logicalKey == LogicalKeyboardKey.f4) {
                addToDB();
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
          child: Column(
            children: [
              const HeaderText(
                header: "Order Bill Management",
              ),
              const SizedBox(height: 10),
              Align(
                child: Container(
                  // color: Colors.red,
                  width: CustomScreenUtility(context).width * 0.98,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                          SalesButton(
                            text: "F4.Add to Order",
                            onPressed: addToDB,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<OrdersController>(
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.centerLeft,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: CustomScreenUtility(context).width *
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
                                                    initialDate: DateTime.now(),
                                                    firstDate:
                                                        DateTime.now().subtract(
                                                      const Duration(
                                                        days: 365 * 5,
                                                      ),
                                                    ),
                                                  );
                                                  controller.setPickedDateTime(
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
                                                width:
                                                    CustomScreenUtility(context)
                                                            .width *
                                                        0.15,
                                                child: Column(
                                                  children: [
                                                    CustomTypeAhead<
                                                        ProductModel>(
                                                      // isKeyPressUp: false,
                                                      isSpecialSearch: true,
                                                      keyboardFocusNode:
                                                          _focus1Node,

                                                      nextNode: controller
                                                          .priceModelFocusNode,

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
                                                      },
                                                      onEnter: () {
                                                        // if (controller
                                                        //         .selectedProductModel !=
                                                        //     null) {
                                                        //   controller
                                                        //           .productController
                                                        //           .text =
                                                        //       controller
                                                        //           .selectedProductModel!
                                                        //           .productName;
                                                        //   qtyNode.requestFocus();
                                                        // } else {
                                                        //   productNode
                                                        //       .requestFocus();
                                                        // }
                                                        if (controller
                                                                .selectedProductModel !=
                                                            null) {
                                                          controller
                                                                  .productController
                                                                  .text =
                                                              controller
                                                                  .selectedProductModel!
                                                                  .productName;
                                                          controller
                                                              .priceModelFocusNode
                                                              .requestFocus();
                                                        } else {
                                                          controller
                                                              .addSelectedProductModel(
                                                            null,
                                                          );
                                                          controller.productNode
                                                              .requestFocus();
                                                        }
                                                      },
                                                      focusNode: controller
                                                          .productNode,
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
                                                          controller
                                                              .priceModelFocusNode
                                                              .requestFocus();
                                                        }
                                                      },
                                                      selectedModel: controller
                                                          .selectedProductModel,
                                                      controller: controller
                                                          .productController,
                                                      modelList: controller
                                                              .productsList ??
                                                          [],
                                                      model: NullCheckUtilities
                                                          .getDummyProduct(),
                                                      onSuggestionSelected:
                                                          (suggestion) {
                                                        controller
                                                            .addSelectedProductModel(
                                                          suggestion,
                                                        );
                                                        controller
                                                                .productController
                                                                .text =
                                                            suggestion
                                                                .productName;
                                                        debugPrint(
                                                          'Selected $suggestion',
                                                        );
                                                        controller
                                                            .priceModelFocusNode
                                                            .requestFocus();
                                                      },
                                                    ),
                                                  ],
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
                                                size:
                                                    CustomScreenUtility(context)
                                                            .width *
                                                        0.02,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          if (controller.selectedProductModel ==
                                              null)
                                            CustomTypeAhead<UnitModel>(
                                              keyboardFocusNode:
                                                  unitKeyboardNode,
                                              prevNode: controller.productNode,
                                              onArrowDown: () {
                                                controller
                                                    .keyboardSelectUnitModel(
                                                  KeyboardEventEnum.ArrowDown,
                                                );
                                                // setState(() {});
                                              },
                                              onArrowUp: () {
                                                controller
                                                    .keyboardSelectUnitModel(
                                                  KeyboardEventEnum.ArrowUp,
                                                );
                                                // setState(() {});
                                              },
                                              onEnter: () {},
                                              focusNode: unitNode,
                                              onEditingComplete: () {
                                                if (controller
                                                        .selectedUnitModel !=
                                                    null) {
                                                  controller.unitController
                                                      .text = controller
                                                          .selectedUnitModel!
                                                          .symbol ??
                                                      "";
                                                  controller.priceNode
                                                      .requestFocus();
                                                }
                                              },
                                              selectedModel:
                                                  controller.selectedUnitModel,
                                              controller:
                                                  controller.unitController,
                                              modelList:
                                                  Database().getAllUnits(),
                                              model: NullCheckUtilities
                                                  .getDummyUnit(),
                                              onSuggestionSelected:
                                                  (suggestion) {
                                                controller.setUnitModel =
                                                    suggestion;
                                                controller.productController
                                                        .text =
                                                    suggestion.symbol ?? "";
                                                debugPrint(
                                                  'Selected $suggestion',
                                                );
                                                controller.priceNode
                                                    .requestFocus();
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //   builder: (context) => ProductPage(product: suggestion)
                                                // ));
                                              },
                                              nextNode: controller.priceNode,
                                            ),
                                          if (controller.selectedProductModel !=
                                                  null &&
                                              controller
                                                  .selectedProductModel!
                                                  .differentPriceList!
                                                  .isNotEmpty)
                                            DropdownButton<PriceModel>(
                                              value:
                                                  controller.selectedPriceModel,
                                              focusNode: controller
                                                  .priceModelFocusNode,
                                              onChanged: (PriceModel? val) {
                                                if (val != null) {
                                                  controller
                                                          .setSelectedPriceModel =
                                                      val;
                                                  controller.priceNode
                                                      .requestFocus();
                                                }
                                              },
                                              items: controller
                                                  .selectedProductModel!
                                                  .differentPriceList!
                                                  .map(
                                                    (e) => DropdownMenuItem<
                                                        PriceModel>(
                                                      value: e,
                                                      child: CustomText(
                                                        "${e.unitModel.symbol} ( ${e.unitModel.formalName} )",
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          const SizedBox(height: 20),
                                          CustomTFWithKeyboard(
                                            keyboardNode: controller
                                                .rateKeyboardFocusNode,
                                            onAdd: () {},
                                            nextNode: qtyNode,
                                            prevNode:
                                                controller.priceModelFocusNode,
                                            onArrowDown: () {
                                              debugPrint("Arropw UP");

                                              final rate = controller
                                                  .rateController.text;
                                              controller.rateController.clear();
                                              if (controller.selectedPriceModel
                                                      ?.retail
                                                      .toString() ==
                                                  rate) {
                                                controller.rateController.text =
                                                    controller
                                                        .selectedPriceModel!.mrp
                                                        .toString();
                                              } else if (controller
                                                      .selectedPriceModel
                                                      ?.wholesale
                                                      .toString() ==
                                                  rate) {
                                                controller.rateController.text =
                                                    controller
                                                        .selectedPriceModel!
                                                        .retail
                                                        .toString();
                                              } else if (controller
                                                      .selectedPriceModel?.mrp
                                                      .toString() ==
                                                  rate) {
                                                controller.rateController.text =
                                                    controller
                                                        .selectedPriceModel!
                                                        .wholesale
                                                        .toString();
                                              }

                                              rateNode.requestFocus();
                                              controller.update();
                                            },
                                            onArrowUp: () {
                                              debugPrint("Arropw UP");

                                              final rate = controller
                                                  .rateController.text;
                                              controller.rateController.clear();
                                              if (controller.selectedPriceModel
                                                      ?.retail
                                                      .toString() ==
                                                  rate) {
                                                controller.rateController.text =
                                                    controller
                                                        .selectedPriceModel!.mrp
                                                        .toString();
                                              } else if (controller
                                                      .selectedPriceModel
                                                      ?.wholesale
                                                      .toString() ==
                                                  rate) {
                                                controller.rateController.text =
                                                    controller
                                                        .selectedPriceModel!
                                                        .retail
                                                        .toString();
                                              } else if (controller
                                                      .selectedPriceModel?.mrp
                                                      .toString() ==
                                                  rate) {
                                                controller.rateController.text =
                                                    controller
                                                        .selectedPriceModel!
                                                        .wholesale
                                                        .toString();
                                              }

                                              rateNode.requestFocus();
                                              controller.update();
                                            },
                                            onEnter: () {},

                                            focusNode: rateNode,
                                            // isEnabled: false,
                                            controller:
                                                controller.rateController,
                                            label: "Enter Rate",
                                            onChange: (String val) {},
                                            // onEditingComplete: () {
                                            //   controller.qtyNode.requestFocus();
                                            // },
                                            // isEnabled: false,
                                          ),
                                          CustomText(
                                            "Click Up and Down arrow to change Rate and \n Enter to Move to discount",
                                            color: Colors.grey[500],
                                            size: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(height: 20),
                                          CustomTFWithKeyboard(
                                            keyboardNode: taxKeyboardNode,
                                            focusNode: taxNode,
                                            isEnabled: false,
                                            controller:
                                                controller.taxController,
                                            label: "Tax",
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    CustomScreenUtility(context)
                                                            .width *
                                                        0.15,
                                                child: CustomTFWithKeyboard(
                                                  keyboardNode: controller
                                                      .priceKeyboardNode,
                                                  focusNode:
                                                      controller.priceNode,
                                                  controller: controller
                                                      .priceController,
                                                  label: "Price",
                                                  prevNode: controller
                                                      .priceModelFocusNode,
                                                  onChange: (String val) {
                                                    try {
                                                      if (controller
                                                              .selectedProductModel !=
                                                          null) {
                                                        final rate =
                                                            BasicCalculation()
                                                                .calculateAmountWithoutTax(
                                                          categoryDB
                                                              .getCategoryModelById(
                                                                controller
                                                                    .selectedProductModel!
                                                                    .categoryId,
                                                              )
                                                              .tax,
                                                          double.parse(
                                                            controller
                                                                .priceController
                                                                .text,
                                                          ),
                                                        );
                                                        controller
                                                                .rateController
                                                                .text =
                                                            rate.toStringAsFixed(
                                                          2,
                                                        );
                                                        controller.update();
                                                      } else {
                                                        controller.taxController
                                                            .text = "0";
                                                        controller
                                                                .rateController
                                                                .text =
                                                            controller
                                                                .priceController
                                                                .text;
                                                      }
                                                    } catch (e) {
                                                      CustomUtilies
                                                          .customFailureSnackBar(
                                                        "Error",
                                                        "Please enter a valid price",
                                                      );
                                                    }
                                                  },
                                                  onEditingComplete: () async {
                                                    if (controller
                                                            .selectedProductModel !=
                                                        null) {
                                                      if (controller
                                                              .priceController
                                                              .text !=
                                                          controller
                                                              .getPriceForPriceController()) {
                                                        final rate =
                                                            double.parse(
                                                          controller
                                                              .rateController
                                                              .text,
                                                        );
                                                        debugPrint(
                                                          "Product : ${controller.selectedProductModel!.copyWith(sellingPrice: rate, retail: rate, wholesale: rate)}",
                                                        );
                                                        await productDB
                                                            .updateDifferentPriceModelList(
                                                          rate,
                                                          rate,
                                                          rate,
                                                          controller
                                                              .selectedProductModel!,
                                                          controller
                                                              .selectedPriceModel!,
                                                        );
                                                        controller
                                                                .productsList =
                                                            productDB
                                                                .getAllProduct();
                                                        controller.update();
                                                      }
                                                    } else {}
                                                    qtyNode.requestFocus();
                                                  },
                                                ),
                                              ),
                                              InkWell(
                                                onLongPress: () {
                                                  ProductController()
                                                      .calculateMRPRetailWholesalePurchaseFromMrpWithTax();
                                                },
                                                child: const Icon(Icons.edit),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          CustomTextField(
                                            focusNode: qtyNode,
                                            controller:
                                                controller.qtyController,
                                            label: "Enter Quantity",
                                            onEditingComplete: () {
                                              discountNode.requestFocus();
                                            },
                                          ),
                                          const SizedBox(height: 20),
                                          CustomTextField(
                                            focusNode: discountNode,
                                            controller:
                                                controller.discountController,
                                            label: "Enter Discount",
                                            onEditingComplete: () {
                                              // node.nextFocus();
                                              controller
                                                  .addSelectedSalesProductModel();
                                              _focus1Node.requestFocus();
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
                                              .addSelectedSalesProductModel();
                                          controller.productController.clear();
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
                                          child: CustomTypeAhead<CustomerModel>(
                                            keyboardFocusNode:
                                                _customerKeyboardNode,
                                            onArrowDown: () {
                                              controller
                                                  .keyboardSelectCustomerModel(
                                                KeyboardEventEnum.ArrowDown,
                                              );
                                              // setState(() {});
                                            },
                                            onArrowUp: () {
                                              controller
                                                  .keyboardSelectCustomerModel(
                                                KeyboardEventEnum.ArrowUp,
                                              );
                                            },
                                            onEnter: () {
                                              if (controller
                                                      .selectedCustomerModel !=
                                                  null) {
                                                debugPrint(
                                                  'Selected Customer :P ${controller.selectedCustomerModel}',
                                                );
                                                controller.customerController
                                                        .text =
                                                    controller
                                                        .selectedCustomerModel!
                                                        .name;
                                                controller.productController
                                                    .clear();
                                                controller.productNode
                                                    .requestFocus();
                                              } else {
                                                CustomUtilies
                                                    .customFailureSnackBar(
                                                  "Please Enter the Customer First",
                                                  "Error",
                                                );
                                                controller.customerFocusNode
                                                    .requestFocus();
                                              }
                                            },
                                            focusNode:
                                                controller.customerFocusNode,
                                            autofocus: true,
                                            onEditingComplete: () {
                                              if (controller
                                                      .selectedCustomerModel !=
                                                  null) {
                                                controller.customerController
                                                        .text =
                                                    controller
                                                        .selectedCustomerModel!
                                                        .name;
                                              }
                                            },
                                            selectedModel: controller
                                                .selectedCustomerModel,
                                            controller:
                                                controller.customerController,
                                            modelList:
                                                controller.customersList ?? [],
                                            model: NullCheckUtilities
                                                .getDummyCustomer(),
                                            onSuggestionSelected: (suggestion) {
                                              controller.selectedCustomerModel =
                                                  suggestion;
                                              controller.customerController
                                                  .text = suggestion.name;
                                              // node.nextFocus();
                                            },
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
                                      child: CustomTextField(
                                        controller: controller.noteController,
                                        label: "Enter Note",
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
                                          "${getGrandTotal(controller.salesProductModelList, controller.selectedCustomerModel)}",
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
                                      children: SalesBillingEnum.values
                                          .map(
                                            (e) => CustomTableHeaderElement(
                                              width:
                                                  CustomScreenUtility(context)
                                                          .width *
                                                      0.8 /
                                                      SalesBillingEnum
                                                          .values.length,
                                              text: getStrofAddSalesBillingEnum(
                                                e,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: controller.salesProductModelList
                                      .map(
                                        (e) => buildInkWell(
                                          e,
                                          controller,
                                          context,
                                        ),
                                      )
                                      .toList(),
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
    );
  }

  Widget buildInkWell(
      SalesProductModel e, OrdersController controller, BuildContext context) {
    return InkWell(
      onTap: () {
        controller.onSalesModelTap(e);
      },
      child: Container(
        color: controller.selectedSalesProductModel == e
            ? Colors.grey[300]
            : controller.salesProductModelList.indexOf(e) % 2 == 0
                ? Colors.white
                : Colors.grey[200],
        child: Row(
          children: [
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  SalesBillingEnum.values.length,
              text: e.categoryModel!.hsnCode.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  SalesBillingEnum.values.length,
              text: e.productModel!.productName,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  SalesBillingEnum.values.length,
              text: e.qty.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  SalesBillingEnum.values.length,
              text:
                  "${getPriceByCustomer(e.productModel!, controller.selectedCustomerModel)}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  SalesBillingEnum.values.length,
              text: e.price.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  SalesBillingEnum.values.length,
              text: "${getDiscountAmount(e, controller.selectedCustomerModel)}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  SalesBillingEnum.values.length,
              text: "${getAmount(e, controller.selectedCustomerModel)}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  SalesBillingEnum.values.length,
              text: "${e.categoryModel!.tax}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.8 /
                  SalesBillingEnum.values.length,
              text: "${getTotalAmount(e, controller.selectedCustomerModel!)}",
            ),
            InkWell(
              onTap: () {
                controller.removeASalesProduct(e);
              },
              child: CustomTableIconElement(
                width: CustomScreenUtility(context).width *
                    0.8 /
                    SalesBillingEnum.values.length,
                iconData: Icons.cancel_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class OrderScreen extends StatelessWidget {
//   OrderScreen({Key? key}) : super(key: key);
//   SalesHistoryNotifier salesHistoryNotifier = Get.put(SalesHistoryNotifier());
//   OrdersController OrderController = Get.put(OrdersController());
//   HomeController homeController = Get.put(HomeController());
//   final FocusNode _focusNode = FocusNode();
//   final FocusNode _focus1Node = FocusNode();
//   final FocusNode _focus2Node = FocusNode();
//   final productNode = FocusNode();
//   final qtyNode = FocusNode();
//   final discountNode = FocusNode();

//   void normalPrint() {
//     OrderController.addOrderToDB(PrinterEnum.Normal);
//   }

//   void thermalPrint() {
//     OrderController.addOrderToDB(PrinterEnum.Thermal);
//   }

//   @override
//   Widget build(BuildContext context) {
//     OrderController.onInit();
//     OrderController.getAllProducts();
//     OrderController.getAllCustomers();
//     return RawKeyboardListener(
//       focusNode: _focusNode,
//       onKey: (RawKeyEvent rawKeyEvent) {
//         final isKeyDown = Utility().isKeyDown(rawKeyEvent);

//         switch (rawKeyEvent.data.runtimeType) {
//           case RawKeyEventDataWindows:
//             final data = rawKeyEvent.data as RawKeyEventDataWindows;
//             debugPrint('Hostory Keyboard: ${data.logicalKey}');

//             if (!isKeyDown) {
//               if (data.logicalKey == LogicalKeyboardKey.f2) {
//                 normalPrint();
//               } else if (data.logicalKey == LogicalKeyboardKey.f3) {
//                 thermalPrint();
//               }
//             }
//             break;
//           default:
//             throw Exception(
//                 'Unsupported platform ${rawKeyEvent.data.runtimeType}',);
//         }
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: FullWidthHeightContainer(
//           child: Column(
//             children: [
//               const HeaderText(
//                 header: "Order Bill Management",
//               ),
//               const SizedBox(height: 10),
//               Align(
//                 child: Container(
//                   // color: Colors.red,
//                   width: CustomScreenUtility(context).width * 0.98,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
                        
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           const SizedBox(width: 5),
//                           SalesButton(
//                             text: "F2.Print",
//                             onPressed: normalPrint,
//                           ),
//                           const SizedBox(width: 5),
//                           SalesButton(
//                             text: "F3.Thermal",
//                             onPressed: thermalPrint,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GetBuilder<OrdersController>(builder: (controller) {
//                 return Expanded(
//                   child: Container(
//                     width: CustomScreenUtility(context).width,
//                     color: Colors.grey[100],
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                             width: CustomScreenUtility(context).width * 0.2,
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             alignment: Alignment.centerLeft,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   width:
//                                       CustomScreenUtility(context).width * 0.2,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const SizedBox(height: 10),
//                                       Row(
//                                         children: [
//                                           DateTimeInkWell(
//                                             onTap: () async {
//                                               final dateTime =
//                                                   await showDatePickerDialog(
//                                                       context,
//                                                       initialDate:
//                                                           DateTime.now(),
//                                                       firstDate: DateTime.now()
//                                                           .subtract(
//                                                               const Duration(
//                                                                   days: 365,),),);
//                                               controller
//                                                   .setPickedDateTime(dateTime);
//                                             },
//                                             dateTime: controller.pickedDateTime,
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 20),
//                                       Row(
//                                         children: [
//                                           Container(
//                                             width: CustomScreenUtility(context)
//                                                     .width *
//                                                 0.15,
//                                             child: RawKeyboardListener(
//                                               focusNode: _focus1Node,
//                                               onKey: (RawKeyEvent rawKeyEvent) {
//                                                 final isKeyDown = Utility()
//                                                     .isKeyDown(rawKeyEvent);

//                                                 switch (rawKeyEvent
//                                                     .data.runtimeType) {
//                                                   case RawKeyEventDataWindows:
//                                                     final data = rawKeyEvent
//                                                             .data
//                                                         as RawKeyEventDataWindows;
//                                                     debugPrint(
//                                                         'Sales One: ${data.logicalKey}',);

//                                                     if (!isKeyDown) {
//                                                       if (data.logicalKey ==
//                                                           LogicalKeyboardKey
//                                                               .enter) {
//                                                         qtyNode.requestFocus();
//                                                       }
//                                                       if (data.logicalKey ==
//                                                           LogicalKeyboardKey
//                                                               .arrowDown) {
//                                                         controller
//                                                             .keyboardSelectProductModel();
//                                                       } else if (data
//                                                               .logicalKey ==
//                                                           LogicalKeyboardKey
//                                                               .f1) {
//                                                         // salesBillingController
//                                                         //     .updateCurrentSalesWidgetToNext();
//                                                       } else if (data
//                                                               .logicalKey ==
//                                                           LogicalKeyboardKey
//                                                               .f2) {
//                                                         // controller
//                                                         //     .addBillToDB(
//                                                         //         salesBillingController);
//                                                       } else if (data
//                                                               .logicalKey ==
//                                                           LogicalKeyboardKey
//                                                               .enter) {
//                                                         // controller
//                                                         //     .keyboardSelectProductModel();
//                                                         debugPrint(
//                                                             'Product ${controller.selectedProductModel}',);
//                                                         if (controller
//                                                                 .selectedProductModel !=
//                                                             null) {
//                                                           controller
//                                                                   .productController
//                                                                   .text =
//                                                               controller
//                                                                   .selectedProductModel!
//                                                                   .productName;
//                                                           qtyNode
//                                                               .requestFocus();
//                                                         } else {
//                                                           productNode
//                                                               .requestFocus();
//                                                         }
//                                                       }
//                                                     }
//                                                     break;
//                                                   default:
//                                                     throw Exception(
//                                                         'Unsupported platform ${rawKeyEvent.data.runtimeType}',);
//                                                 }
//                                               },
//                                               child:
//                                                   TypeAheadField<ProductModel>(
//                                                 textFieldConfiguration:
//                                                     TextFieldConfiguration(
//                                                   focusNode: productNode,
//                                                   controller: controller
//                                                       .productController,
//                                                   onEditingComplete: () {
//                                                     controller.productController
//                                                             .text =
//                                                         controller
//                                                             .selectedProductModel!
//                                                             .productName;
//                                                     qtyNode.requestFocus();
//                                                   },
//                                                   decoration: getInputDecoration(
//                                                       null,
//                                                       "Enter Product",
//                                                       controller.selectedProductModel ==
//                                                               null
//                                                           ? ""
//                                                           : controller
//                                                               .selectedProductModel!
//                                                               .productName,),
//                                                 ),
//                                                 suggestionsCallback:
//                                                     (pattern) async {
//                                                   return controller
//                                                       .productsList!
//                                                       .where((suggestion) =>
//                                                           suggestion.productName
//                                                               .toLowerCase()
//                                                               .contains(pattern
//                                                                   .toLowerCase(),),);
//                                                 },
//                                                 itemBuilder: (context,
//                                                     ProductModel suggestion) {
//                                                   return ListTile(
//                                                     tileColor: controller
//                                                                 .selectedProductModel ==
//                                                             suggestion
//                                                         ? Colors.grey[300]
//                                                         : Colors.white,
//                                                     title: Text(
//                                                         suggestion.productName,),
//                                                     subtitle:
//                                                         Text(suggestion.code),
//                                                   );
//                                                 },
//                                                 onSuggestionSelected:
//                                                     (suggestion) {
//                                                   controller
//                                                           .selectedProductModel =
//                                                       suggestion;
//                                                   controller.productController
//                                                           .text =
//                                                       suggestion.productName;
//                                                   debugPrint(
//                                                       'Selected $suggestion',);
//                                                   // Navigator.of(context).push(MaterialPageRoute(
//                                                   //   builder: (context) => ProductPage(product: suggestion)
//                                                   // ));
//                                                 },
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(width: 6),
//                                           AddInkWell(
//                                               onPressed: () {
//                                                 homeController
//                                                     .setCurrentSelectedWidget(
//                                                         const AddProductScreen(),);
//                                               },
//                                               size: CustomScreenUtility(context)
//                                                       .width *
//                                                   0.02,),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 20),
//                                       CustomTextField(
//                                         focusNode: qtyNode,
//                                         controller: controller.qtyController,
//                                         label: "Enter Quantity",
//                                         onEditingComplete: () {
//                                           discountNode.requestFocus();
//                                         },
//                                       ),
//                                       const SizedBox(height: 20),
//                                       CustomTextField(
//                                         focusNode: discountNode,
//                                         controller:
//                                             controller.discountController,
//                                         label: "Enter Disount",
//                                         onEditingComplete: () {
//                                           // node.nextFocus();
//                                           controller
//                                               .addSelectedSalesProductModel();
//                                           controller.productController.clear();
//                                           productNode.requestFocus();
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 30),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     SalesButton(
//                                       text: "Add to Bill",
//                                       onPressed: () {
//                                         controller
//                                             .addSelectedSalesProductModel();
//                                         controller.productController.clear();
//                                         productNode.requestFocus();
//                                       },
//                                     ),
//                                     SalesButton(
//                                       text: "Clear All",
//                                       onPressed: () {
//                                         controller.clearAll();
//                                       },
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),),
//                         Container(
//                             width: CustomScreenUtility(context).width * 0.8,
//                             child: Column(
//                               children: [
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Container(
//                                           width: CustomScreenUtility(context)
//                                                   .width *
//                                               0.2,
//                                           child: RawKeyboardListener(
//                                             focusNode: _focus2Node,
//                                             onKey: (RawKeyEvent rawKeyEvent) {
//                                               final isKeyDown = Utility()
//                                                   .isKeyDown(rawKeyEvent);
//                                               switch (rawKeyEvent
//                                                   .data.runtimeType) {
//                                                 case RawKeyEventDataWindows:
//                                                   final data = rawKeyEvent.data
//                                                       as RawKeyEventDataWindows;
//                                                   debugPrint(
//                                                       '${data.logicalKey}',);
//                                                   if (data.logicalKey ==
//                                                       LogicalKeyboardKey
//                                                           .enter) {
//                                                     if (controller
//                                                             .selectedCustomerModel !=
//                                                         null) {
//                                                       debugPrint(
//                                                           'Selected Customer :P ${controller.selectedCustomerModel}',);
//                                                       controller
//                                                               .customerController
//                                                               .text =
//                                                           controller
//                                                               .selectedCustomerModel!
//                                                               .name;
//                                                       controller
//                                                           .productController
//                                                           .clear();
//                                                       productNode
//                                                           .requestFocus();
//                                                     } else {
//                                                       CustomUtilies
//                                                           .customFailureSnackBar(
//                                                               "Please Enter the Customer First",
//                                                               "Error",);
//                                                     }
//                                                   }
//                                                   if (!isKeyDown) {
//                                                     if (data.logicalKey ==
//                                                         LogicalKeyboardKey
//                                                             .arrowDown) {
//                                                       controller
//                                                           .keyboardSelectCustomerModel();
//                                                     }
//                                                   }
//                                                   break;
//                                                 default:
//                                                   throw Exception(
//                                                       'Unsupported platform ${rawKeyEvent.data.runtimeType}',);
//                                               }
//                                             },
//                                             child:
//                                                 TypeAheadField<CustomerModel>(
//                                               textFieldConfiguration:
//                                                   TextFieldConfiguration(
//                                                       autofocus: true,
//                                                       onEditingComplete: () {
//                                                         if (controller
//                                                                 .selectedCustomerModel !=
//                                                             null) {
//                                                           controller
//                                                                   .customerController
//                                                                   .text =
//                                                               controller
//                                                                   .selectedCustomerModel!
//                                                                   .name;
//                                                         }
//                                                         // controller
//                                                         //     .productController
//                                                         //     .clear();
//                                                         // productNode
//                                                         //     .requestFocus();
//                                                       },
//                                                       controller: controller
//                                                           .customerController,
//                                                       decoration: getInputDecoration(
//                                                           null,
//                                                           "Enter Customer",
//                                                           controller.selectedCustomerModel ==
//                                                                   null
//                                                               ? ""
//                                                               : controller
//                                                                   .selectedCustomerModel!
//                                                                   .name,),),
//                                               suggestionsCallback:
//                                                   (pattern) async {
//                                                 return controller.customersList!
//                                                     .where((suggestion) =>
//                                                         suggestion.name
//                                                             .toLowerCase()
//                                                             .contains(pattern
//                                                                 .toLowerCase(),),);
//                                               },
//                                               itemBuilder: (BuildContext
//                                                       context,
//                                                   CustomerModel suggestion) {
//                                                 debugPrint(
//                                                     'Suggestion Selected ${controller.selectedCustomerModel}',);
//                                                 return ListTile(
//                                                   tileColor: controller
//                                                               .selectedCustomerModel ==
//                                                           suggestion
//                                                       ? Colors.grey[300]
//                                                       : Colors.white,
//                                                   title: Text(suggestion.name),
//                                                 );
//                                               },
//                                               onSuggestionSelected:
//                                                   (suggestion) {
//                                                 controller
//                                                         .selectedCustomerModel =
//                                                     suggestion;
//                                                 controller.customerController
//                                                     .text = suggestion.name;
//                                                 debugPrint(
//                                                     'Selected $suggestion',);
//                                                 controller.productController
//                                                     .clear();
//                                                 productNode.requestFocus();
//                                                 // node.nextFocus();
//                                               },
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 10),
//                                         AddInkWell(
//                                             onPressed: () {
//                                               homeController
//                                                   .setCurrentSelectedWidget(
//                                                       const AddCustomerScreen(),);
//                                             },
//                                             size: CustomScreenUtility(context)
//                                                     .width *
//                                                 0.02,),
//                                       ],
//                                     ),
//                                     Container(
//                                       width:
//                                           CustomScreenUtility(context).width *
//                                               0.2,
//                                       child: CustomTextField(
//                                         controller: controller.noteController,
//                                         label: "Enter Note",
//                                       ),
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         CustomText(
//                                           "Total Amount",
//                                           color: Colors.grey[500],
//                                         ),
//                                         CustomText(
//                                             "${getGrandTotal(controller.salesProductModelList, controller.selectedCustomerModel)}",
//                                             color: Colors.grey[700],
//                                             fontWeight: FontWeight.bold,),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Container(
//                                   color: kLightPrimaryColor,
//                                   child: SingleChildScrollView(
//                                     scrollDirection: Axis.horizontal,
//                                     child: Row(
//                                       children: SalesBillingEnum.values
//                                           .map((e) => CustomTableHeaderElement(
//                                                 width:
//                                                     CustomScreenUtility(context)
//                                                             .width *
//                                                         0.8 /
//                                                         SalesBillingEnum
//                                                             .values.length,
//                                                 text:
//                                                     getStrofAddSalesBillingEnum(
//                                                         e,),
//                                               ),)
//                                           .toList(),
//                                     ),
//                                   ),
//                                 ),
//                                 Column(
//                                   children: controller.salesProductModelList
//                                       .map((e) =>
//                                           buildInkWell(e, controller, context),)
//                                       .toList(),
//                                 )
//                               ],
//                             ),),
//                       ],
//                     ),
//                   ),
//                 );
//               },)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildInkWell(
//       SalesProductModel e, OrdersController controller, BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.onSalesModelTap(e);
//       },
//       child: Container(
//         color: controller.selectedSalesProductModel == e
//             ? Colors.grey[300]
//             : controller.salesProductModelList.indexOf(e) % 2 == 0
//                 ? Colors.white
//                 : Colors.grey[200],
//         child: Row(
//           children: [
//             CustomTableElement(
//               width: CustomScreenUtility(context).width *
//                   0.8 /
//                   SalesBillingEnum.values.length,
//               text: e.categoryModel!.hsnCode.toString(),
//             ),
//             CustomTableElement(
//               width: CustomScreenUtility(context).width *
//                   0.8 /
//                   SalesBillingEnum.values.length,
//               text: e.productModel!.productName,
//             ),
//             CustomTableElement(
//               width: CustomScreenUtility(context).width *
//                   0.8 /
//                   SalesBillingEnum.values.length,
//               text: e.qty.toString(),
//             ),
//             CustomTableElement(
//               width: CustomScreenUtility(context).width *
//                   0.8 /
//                   SalesBillingEnum.values.length,
//               text:
//                   "${getPriceByCustomer(e.productModel!, controller.selectedCustomerModel)}",
//             ),
//             CustomTableElement(
//               width: CustomScreenUtility(context).width *
//                   0.8 /
//                   SalesBillingEnum.values.length,
//               text: e.price.toString(),
//             ),
//             CustomTableElement(
//               width: CustomScreenUtility(context).width *
//                   0.8 /
//                   SalesBillingEnum.values.length,
//               text: "${getDiscountAmount(e, controller.selectedCustomerModel)}",
//             ),
//             CustomTableElement(
//               width: CustomScreenUtility(context).width *
//                   0.8 /
//                   SalesBillingEnum.values.length,
//               text: "${getAmount(e, controller.selectedCustomerModel)}",
//             ),
//             CustomTableElement(
//               width: CustomScreenUtility(context).width *
//                   0.8 /
//                   SalesBillingEnum.values.length,
//               text: "${e.categoryModel!.tax}",
//             ),
//             CustomTableElement(
//               width: CustomScreenUtility(context).width *
//                   0.8 /
//                   SalesBillingEnum.values.length,
//               text: "${getTotalAmount(e, controller.selectedCustomerModel!)}",
//             ),
//             InkWell(
//               onTap: () {
//                 controller.removeASalesProduct(e);
//               },
//               child: CustomTableIconElement(
//                   width: CustomScreenUtility(context).width *
//                       0.8 /
//                       SalesBillingEnum.values.length,
//                   iconData: Icons.cancel_outlined,),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Container(
//   //     child: Column(

//   //       children: [
//   //         CustomText("Order"),
//   //         CustomButton(
//   //             icon: Icons.delete,
//   //             text: "Delete All",
//   //             onTap: () {
//   //               salesHistoryNotifier.clearAllBills();
//   //             }),
//   //       ],
//   //     ),
//   //   );
//   // }

// }
