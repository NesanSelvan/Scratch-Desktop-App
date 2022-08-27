// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/billing/sales/sales_two.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/controller/product/product.dart';
import 'package:annai_store/core/constants/calculations/basic_cal.dart';
import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/billing/sales.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/enum/printer/printer.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/price/price.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/screens/add/customer/customer.dart';
import 'package:annai_store/screens/add/product/product.dart';
import 'package:annai_store/screens/billing/sales/components/sales_button.dart';
import 'package:annai_store/screens/billing/sales/sales.dart';
import 'package:annai_store/utils/null/null.dart';
import 'package:annai_store/utils/upi.dart';
import 'package:annai_store/widgets/add_inkwell.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/custom_typeahead.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

class SalesScreen2 extends StatefulWidget {
  @override
  State<SalesScreen2> createState() => _SalesScreen2State();
}

class _SalesScreen2State extends State<SalesScreen2> {
  SalesBillingTwoController salesBillingTwoController =
      Get.put(SalesBillingTwoController());

  SalesBillingController salesBillingController =
      Get.put(SalesBillingController());

  HomeController homeController = Get.put(HomeController());

  final FocusNode _focusNode = FocusNode();

  final unitNode = FocusNode();
  final unitKeyboardNode = FocusNode();

  final taxNode = FocusNode();
  final taxKeyboardNode = FocusNode();

  final rateNode = FocusNode();

  void addBillToSalesList() {
    if (salesBillingTwoController.selectedProductModel == null) {
      final category = categoryDB
          .getAllCategory()
          .where(
            (element) =>
                element.category.toLowerCase().trim() ==
                "Dont know".toLowerCase(),
          )
          .toList()[0];
      final company = companyDB
          .getAllCompany()
          .where(
            (element) =>
                element.name.toLowerCase().trim() == "Dont know".toLowerCase(),
          )
          .toList()[0];
      final rate = double.parse(salesBillingTwoController.rateController.text);
      final product = ProductModel(
        differentPriceList: [],
        id: const Uuid().v4(),
        code: "",
        productName: salesBillingTwoController.productController.text,
        categoryId: category.id,
        unitId: salesBillingTwoController.selectedUnitModel!.id!,
        purchasePrice: 0,
        sellingPrice: rate,
        wholesale: rate,
        retail: rate,
        companyId: company.id,
        createdAt: DateTime.now(),
      );
      salesBillingTwoController.addSelectedProductModel = product;
      productDB.addProductToDb(product);
    }
    salesBillingTwoController.addSelectedSalesProductModel();
    salesBillingTwoController.productController.clear();
    salesBillingTwoController.getAllProducts();
    salesBillingTwoController.update();
    salesBillingTwoController.productNode.requestFocus();
  }

  Widget buildInkWell(
    SalesProductModel e,
    SalesBillingTwoController controller,
    BuildContext context,
  ) {
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
                  0.6 /
                  SalesBillingEnum.values.length,
              text: e.categoryModel!.hsnCode.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.6 /
                  SalesBillingEnum.values.length,
              text: e.productModel!.productName,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.6 /
                  SalesBillingEnum.values.length,
              text: e.qty.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.6 /
                  SalesBillingEnum.values.length,
              text: "${e.rate}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.6 /
                  SalesBillingEnum.values.length,
              text: e.price.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.6 /
                  SalesBillingEnum.values.length,
              text: "${getDiscountAmount(e, controller.selectedCustomerModel)}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.6 /
                  SalesBillingEnum.values.length,
              text: "${getAmount(e, controller.selectedCustomerModel)}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.6 /
                  SalesBillingEnum.values.length,
              text: "${e.categoryModel!.tax}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.6 /
                  SalesBillingEnum.values.length,
              text: "${getTotalAmount(e, controller.selectedCustomerModel!)}",
            ),
            InkWell(
              onTap: () {
                controller.removeASalesProduct(e);
              },
              child: CustomTableIconElement(
                width: CustomScreenUtility(context).width *
                    0.6 /
                    SalesBillingEnum.values.length,
                iconData: Icons.cancel_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    salesBillingTwoController.onInit();
    salesBillingTwoController.getAllProducts();
    salesBillingTwoController.getAllCustomers();
    return GetBuilder<SalesBillingTwoController>(
      builder: (controller) {
        return Container(
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
                        width: CustomScreenUtility(context).width * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Row(
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
                                const Spacer(),
                                const CustomText("01")
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  width:
                                      CustomScreenUtility(context).width * 0.15,
                                  child: Column(
                                    children: [
                                      // if (controller
                                      //     .productKeyboardNode.hasFocus) ...[
                                      //   CustomText(
                                      //     "${controller.selectedProductModel?.productName}",
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      //   const SizedBox(
                                      //     height: 10,
                                      //   )
                                      // ] else
                                      //   Container(),
                                      CustomTypeAhead<ProductModel>(
                                        // isKeyPressUp: false,
                                        isSpecialSearch: true,
                                        keyboardFocusNode:
                                            controller.productKeyboardNode,

                                        // nextNode: controller.priceModelFocusNode,

                                        onArrowDown: () {
                                          salesBillingTwoController
                                              .keyboardSelectProductModel(
                                            KeyboardEventEnum.ArrowDown,
                                          );
                                        },
                                        onArrowUp: () {
                                          salesBillingTwoController
                                              .keyboardSelectProductModel(
                                            KeyboardEventEnum.ArrowUp,
                                          );
                                          // setState(() {});
                                        },
                                        onF1: () {
                                          salesBillingController
                                              .updateCurrentSalesWidgetToNext();
                                        },
                                        onF2: () async {
                                          await salesBillingTwoController
                                              .addBillToDB(
                                            salesBillingController,
                                            PrinterEnum.Normal,
                                          );
                                        },
                                        onF3: () async {
                                          await salesBillingTwoController
                                              .addBillToDB(
                                            salesBillingController,
                                            PrinterEnum.Thermal,
                                          );
                                        },
                                        onEnter: () {
                                          if (controller.selectedProductModel !=
                                              null) {
                                            salesBillingTwoController
                                                    .productController.text =
                                                salesBillingTwoController
                                                    .selectedProductModel!
                                                    .productName;
                                            controller.priceModelFocusNode
                                                .requestFocus();
                                          } else {
                                            controller.addSelectedProductModel =
                                                null;
                                            controller.setIsProductExists =
                                                false;
                                            controller.productNode
                                                .requestFocus();
                                          }
                                          setState(() {});
                                        },
                                        focusNode: controller.productNode,
                                        onEditingComplete: () {
                                          if (salesBillingTwoController
                                                  .selectedProductModel !=
                                              null) {
                                            salesBillingTwoController
                                                    .productController.text =
                                                salesBillingTwoController
                                                    .selectedProductModel!
                                                    .productName;
                                            controller.priceModelFocusNode
                                                .requestFocus();
                                          }
                                        },
                                        selectedModel:
                                            controller.selectedProductModel,
                                        controller:
                                            controller.productController,
                                        modelList:
                                            controller.productsList ?? [],
                                        model: NullCheckUtilities
                                            .getDummyProduct(),
                                        onSuggestionSelected: (suggestion) {
                                          controller.addSelectedProductModel =
                                              suggestion;
                                          salesBillingTwoController
                                              .productController
                                              .text = suggestion.productName;
                                          debugPrint('Selected $suggestion');
                                          controller.priceModelFocusNode
                                              .requestFocus();
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //   builder: (context) => ProductPage(product: suggestion)
                                          // ));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 6),
                                AddInkWell(
                                  onPressed: () {
                                    homeController.setCurrentSelectedWidget(
                                      const AddProductScreen(),
                                    );
                                  },
                                  size:
                                      CustomScreenUtility(context).width * 0.02,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            if (controller.selectedProductModel == null)
                              CustomTypeAhead<UnitModel>(
                                keyboardFocusNode: unitKeyboardNode,
                                // nextNode: controller.priceModelFocusNode,
                                prevNode: controller.productNode,
                                onArrowDown: () {
                                  salesBillingTwoController
                                      .keyboardSelectUnitModel(
                                    KeyboardEventEnum.ArrowDown,
                                  );
                                  // setState(() {});
                                },
                                onArrowUp: () {
                                  salesBillingTwoController
                                      .keyboardSelectUnitModel(
                                    KeyboardEventEnum.ArrowUp,
                                  );
                                  // setState(() {});
                                },
                                onF1: () {
                                  salesBillingController
                                      .updateCurrentSalesWidgetToNext();
                                },
                                onEnter: () {},
                                focusNode: unitNode,
                                onEditingComplete: () {
                                  if (salesBillingTwoController
                                          .selectedUnitModel !=
                                      null) {
                                    salesBillingTwoController.unitController
                                        .text = salesBillingTwoController
                                            .selectedUnitModel!.symbol ??
                                        "";
                                    controller.priceNode.requestFocus();
                                  }
                                },
                                selectedModel: controller.selectedUnitModel,
                                controller: controller.unitController,
                                modelList: Database().getAllUnits(),
                                model: NullCheckUtilities.getDummyUnit(),
                                onSuggestionSelected: (suggestion) {
                                  controller.setUnitModel = suggestion;
                                  salesBillingTwoController.productController
                                      .text = suggestion.symbol ?? "";
                                  debugPrint('Selected $suggestion');
                                  controller.priceNode.requestFocus();
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => ProductPage(product: suggestion)
                                  // ));
                                },
                                nextNode: controller.priceNode,
                              ),
                            if (controller.selectedProductModel != null &&
                                controller.selectedProductModel!
                                    .differentPriceList!.isNotEmpty)
                              DropdownButton<PriceModel>(
                                value: controller.selectedPriceModel,
                                focusNode: controller.priceModelFocusNode,
                                onChanged: (PriceModel? val) {
                                  if (val != null) {
                                    controller.setSelectedPriceModel = val;
                                    controller.priceNode.requestFocus();
                                  }
                                },
                                items: controller
                                    .selectedProductModel!.differentPriceList!
                                    .map(
                                      (e) => DropdownMenuItem<PriceModel>(
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
                              keyboardNode: controller.rateKeyboardFocusNode,
                              onAdd: () {},
                              nextNode: controller.qtyNode,
                              prevNode: controller.priceModelFocusNode,
                              onArrowDown: () {
                                debugPrint("Arropw UP");

                                final rate = controller.rateController.text;
                                controller.rateController.clear();
                                if (controller.selectedPriceModel?.retail
                                        .toString() ==
                                    rate) {
                                  controller.rateController.text = controller
                                      .selectedPriceModel!.mrp
                                      .toString();
                                } else if (controller
                                        .selectedPriceModel?.wholesale
                                        .toString() ==
                                    rate) {
                                  controller.rateController.text = controller
                                      .selectedPriceModel!.retail
                                      .toString();
                                } else if (controller.selectedPriceModel?.mrp
                                        .toString() ==
                                    rate) {
                                  controller.rateController.text = controller
                                      .selectedPriceModel!.wholesale
                                      .toString();
                                }

                                rateNode.requestFocus();
                                controller.update();
                              },
                              onArrowUp: () {
                                debugPrint("Arropw UP");

                                final rate = controller.rateController.text;
                                controller.rateController.clear();
                                if (controller.selectedPriceModel?.retail
                                        .toString() ==
                                    rate) {
                                  controller.rateController.text = controller
                                      .selectedPriceModel!.mrp
                                      .toString();
                                } else if (controller
                                        .selectedPriceModel?.wholesale
                                        .toString() ==
                                    rate) {
                                  controller.rateController.text = controller
                                      .selectedPriceModel!.retail
                                      .toString();
                                } else if (controller.selectedPriceModel?.mrp
                                        .toString() ==
                                    rate) {
                                  controller.rateController.text = controller
                                      .selectedPriceModel!.wholesale
                                      .toString();
                                }

                                rateNode.requestFocus();
                                controller.update();
                              },
                              onEnter: () {},

                              focusNode: rateNode,
                              // isEnabled: false,
                              controller: controller.rateController,
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
                              controller: controller.taxController,
                              label: "Tax",
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  width:
                                      CustomScreenUtility(context).width * 0.15,
                                  child: CustomTFWithKeyboard(
                                    keyboardNode: controller.priceKeyboardNode,
                                    focusNode: controller.priceNode,
                                    controller: controller.priceController,
                                    label: "Price",
                                    prevNode: controller.priceModelFocusNode,
                                    onChange: (String val) {
                                      try {
                                        if (controller.selectedProductModel !=
                                            null) {
                                          final rate = BasicCalculation()
                                              .calculateAmountWithoutTax(
                                            categoryDB
                                                .getCategoryModelById(
                                                  controller
                                                      .selectedProductModel!
                                                      .categoryId,
                                                )
                                                .tax,
                                            double.parse(
                                              controller.priceController.text,
                                            ),
                                          );
                                          controller.rateController.text =
                                              rate.toStringAsFixed(2);
                                          controller.update();
                                        } else {
                                          controller.taxController.text = "0";
                                          controller.rateController.text =
                                              controller.priceController.text;
                                        }
                                      } catch (e) {
                                        CustomUtilies.customFailureSnackBar(
                                          "Error",
                                          "Please enter a valid price",
                                        );
                                      }
                                    },
                                    onEditingComplete: () async {
                                      if (controller.selectedProductModel !=
                                          null) {
                                        if (controller.priceController.text !=
                                            controller
                                                .getPriceForPriceController()) {
                                          final rate = double.parse(
                                            controller.rateController.text,
                                          );
                                          debugPrint(
                                            "Product : ${controller.selectedProductModel!.copyWith(sellingPrice: rate, retail: rate, wholesale: rate)}",
                                          );
                                          await productDB
                                              .updateDifferentPriceModelList(
                                            rate,
                                            rate,
                                            rate,
                                            controller.selectedProductModel!,
                                            controller.selectedPriceModel!,
                                          );
                                          controller.productsList =
                                              productDB.getAllProduct();
                                          controller.update();
                                        }
                                      } else {}
                                      controller.qtyNode.requestFocus();
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
                            CustomTFWithKeyboard(
                              keyboardNode: controller.qtyKeyboardNode,
                              nextNode: controller.discountNode,
                              prevNode: rateNode,
                              focusNode: controller.qtyNode,
                              controller: controller.qtyController,
                              label: "Enter Quantity",
                            ),
                            const SizedBox(height: 20),
                            CustomTFWithKeyboard(
                              keyboardNode: controller.discountKeyboardNode,
                              nextNode: controller.productNode,
                              prevNode: controller.qtyNode,
                              focusNode: controller.discountNode,
                              controller: controller.discountController,
                              label: "Enter Disount",
                              errorTextFieldColor:
                                  controller.isProfit ? null : Colors.red,
                              onChange: controller.onDiscountChange,
                              onEditingComplete: addBillToSalesList,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        runSpacing: 5,
                        spacing: 5,
                        children: [
                          SalesButton(
                            text: "Add to Bill",
                            onPressed: addBillToSalesList,
                          ),
                          SalesButton(
                            text: "Clear Textfields",
                            onPressed: () {
                              controller.clearTFS();
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
                width: CustomScreenUtility(context).width * 0.6,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: CustomScreenUtility(context).width * 0.2,
                                child: CustomTypeAhead<CustomerModel>(
                                  keyboardFocusNode: _focusNode,
                                  onArrowDown: () {
                                    salesBillingTwoController
                                        .keyboardSelectCustomerModel(
                                      KeyboardEventEnum.ArrowDown,
                                    );
                                    // setState(() {});
                                  },
                                  onArrowUp: () {
                                    salesBillingTwoController
                                        .keyboardSelectCustomerModel(
                                      KeyboardEventEnum.ArrowUp,
                                    );
                                  },
                                  onEnter: () {
                                    if (salesBillingTwoController
                                            .selectedCustomerModel !=
                                        null) {
                                      debugPrint(
                                        'Selected Customer :P ${salesBillingTwoController.selectedCustomerModel}',
                                      );
                                      salesBillingTwoController
                                              .customerController.text =
                                          salesBillingTwoController
                                              .selectedCustomerModel!.name;
                                      salesBillingTwoController
                                          .productController
                                          .clear();
                                      controller.productNode.requestFocus();
                                    } else {
                                      CustomUtilies.customFailureSnackBar(
                                        "Please Enter the Customer First",
                                        "Error",
                                      );
                                      controller.customerFocusNode
                                          .requestFocus();
                                    }
                                  },
                                  focusNode: controller.customerFocusNode,
                                  autofocus: true,
                                  onEditingComplete: () {
                                    if (salesBillingTwoController
                                            .selectedCustomerModel !=
                                        null) {
                                      salesBillingTwoController
                                              .customerController.text =
                                          salesBillingTwoController
                                              .selectedCustomerModel!.name;
                                    }
                                  },
                                  selectedModel:
                                      controller.selectedCustomerModel,
                                  controller: controller.customerController,
                                  modelList: controller.customersList ?? [],
                                  model: NullCheckUtilities.getDummyCustomer(),
                                  onSuggestionSelected: (suggestion) {
                                    controller.selectedCustomerModel =
                                        suggestion;
                                    controller.customerController.text =
                                        suggestion.name;
                                    // node.nextFocus();
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              AddInkWell(
                                onPressed: () {
                                  homeController.setCurrentSelectedWidget(
                                    const AddCustomerScreen(),
                                  );
                                },
                                size: CustomScreenUtility(context).width * 0.02,
                              ),
                            ],
                          ),
                          Container(
                            width: CustomScreenUtility(context).width * 0.2,
                            child: CustomTextField(
                              controller: controller.noteController,
                              label: "Enter Note",
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    width: CustomScreenUtility(context).width *
                                        0.6 /
                                        SalesBillingEnum.values.length,
                                    text: getStrofAddSalesBillingEnum(e),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      GetBuilder<SalesBillingTwoController>(
                        builder: (controller) {
                          return Column(
                            children: controller.salesProductModelList
                                .map(
                                  (e) => buildInkWell(e, controller, context),
                                )
                                .toList(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: CustomScreenUtility(context).width * 0.2,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey[100],
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: CustomScreenUtility(context).width * 0.2,
                        // color: kPrimaryColor,
                        child: CustomText(
                          "Sewing Service",
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: CustomScreenUtility(context).width * 0.3,
                        child: CustomTFWithKeyboard(
                          keyboardNode:
                              controller.sewingServiceInvoiceNoKeyboardNode,
                          focusNode: controller.sewingServiceInvoiceNoNode,
                          controller:
                              controller.sewingServiceInvoiceNoController,
                          autofocus: true,
                          label: "Invoice No",
                          isEnabled: false,
                          onEditingComplete: () {},
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextButton(
                        "Thermal",
                        textColor: Colors.white,
                        backgoundColor: kPrimaryColor,
                        onPressed: () {
                          controller.addSewingServiceToDB();
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.invoiceNumberController,
                        label: "Invoice Number",
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.supplierRefController,
                        label: "Supplier Ref",
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.orderDateController,
                        label: "Order No",
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.orderDateController,
                        label: "Order Date",
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.despatchDocNoController,
                        label: "Despatch Document No",
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.despatchThroughController,
                        label: "Despatch Through",
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.destinationController,
                        label: "Destination",
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      const SizedBox(height: 20),
                      const CustomText("Online Payment QR Code"),
                      Container(
                        child: Screenshot(
                          controller:
                              salesBillingController.screenshotController,
                          child: SfBarcodeGenerator(
                            value:
                                "upi://pay?pa=${UPIDetails.upiID}&pn=${UPIDetails.payeeName}&am=${getGrandTotal(controller.salesProductModelList, controller.selectedCustomerModel).round()}&cu=INR&mode=01&purpose=10&orgid=-&sign=-&tn=Bill Payment",
                            symbology: QRCode(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
