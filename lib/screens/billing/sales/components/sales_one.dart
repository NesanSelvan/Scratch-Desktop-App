// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'dart:developer';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/billing/sales/sales_one.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/controller/payments/receipt/receipt.dart';
import 'package:annai_store/controller/product/product.dart';
import 'package:annai_store/core/constants/calculations/basic_cal.dart';
import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/core/constants/calculations/report.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/billing/sales.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/enum/printer/printer.dart';
import 'package:annai_store/models/bill/bill.dart';
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
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/widgets/add_inkwell.dart';
import 'package:annai_store/widgets/custom_button.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/custom_typeahead.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

class SalesScreen1 extends StatefulWidget {
  @override
  State<SalesScreen1> createState() => _SalesScreen1State();
}

class _SalesScreen1State extends State<SalesScreen1> {
  SalesBillingOneController salesBillingOneController =
      Get.put(SalesBillingOneController());

  SalesBillingController salesBillingController =
      Get.put(SalesBillingController());

  HomeController homeController = Get.put(HomeController());
  ReceiptController receiptController = Get.put(ReceiptController());

  final FocusNode _focusNode = FocusNode();

  final unitNode = FocusNode();
  final unitKeyboardNode = FocusNode();
  final FocusNode _focusNodeBillNo = FocusNode();
  final FocusNode _focusNodeCustomer = FocusNode();

  final taxNode = FocusNode();
  final taxKeyboardNode = FocusNode();

  final rateNode = FocusNode();
  final FocusNode _focusNodeCustomer1 = FocusNode();
  final List<String> someData = ["ASD", "DSA", "Aset", "Test", "Zasd"];

  void addBillToSalesList() {
    if (salesBillingOneController.selectedProductModel == null) {
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
      final rate =
          double.tryParse(salesBillingOneController.rateController.text) ?? 0;
      final product = ProductModel(
        differentPriceList: [],
        id: const Uuid().v4(),
        code: "",
        productName: salesBillingOneController.productController.text,
        categoryId: category.id,
        unitId: salesBillingOneController.selectedUnitModel!.id!,
        purchasePrice: 0,
        sellingPrice: rate,
        wholesale: rate,
        retail: rate,
        companyId: company.id,
        createdAt: DateTime.now(),
      );
      salesBillingOneController.addSelectedProductModel = product;
      productDB.addProductToDb(product);
    }
    salesBillingOneController.addSelectedSalesProductModel();
    salesBillingOneController.productController.clear();
    salesBillingOneController.getAllProducts();
    salesBillingOneController.update();
    salesBillingOneController.productNode.requestFocus();
  }

  Widget buildInkWell(
    SalesProductModel e,
    SalesBillingOneController controller,
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
          (receiptController.selectedBillModel!.price -
                  receiptController.selectedBillModel!.givenAmount!)
              .toStringAsFixed(2);
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
      receiptController.customerController.text =
          receiptController.selectedCustomerModel!.name;
      final todayDate = DateTime.now();
      late DateTime selectedDateTime;
      if (todayDate.month >= 4) {
        selectedDateTime = DateTime(todayDate.year, 4);
      } else {
        selectedDateTime = DateTime(todayDate.year - 1, 4);
      }
      final pendingAmount = ReportCalculations.getStartBalance(
        selectedDateTime,
        receiptController.selectedCustomerModel!.id,
      );
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
  void initState() {
    super.initState();

    salesBillingOneController.onInit();
    salesBillingOneController.getAllProducts();
    salesBillingOneController.getAllCustomers();
  }

  @override
  Widget build(BuildContext context) {
    // receiptController.performInit();
    final node = FocusScope.of(context);
    return GetBuilder<SalesBillingOneController>(
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
                            Container(
                              width: CustomScreenUtility(context).width * 0.3,
                              child: CustomTextField(
                                controller: controller.invoiceNumberController,
                                label: "Invoice No",
                                onChange: (val) {
                                  // controller.invoiceNumberController.text = val;
                                  print(
                                    "onChange controller.invoiceNumberController: ${controller.invoiceNumberController.text}",
                                  );
                                },
                                onEditingComplete: () {
                                  print(
                                    "controller.invoiceNumberController: ${controller.invoiceNumberController.text}",
                                  );
                                },
                              ),
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

                                        nextNode:
                                            controller.priceModelFocusNode,

                                        onArrowDown: () {
                                          salesBillingOneController
                                              .keyboardSelectProductModel(
                                            KeyboardEventEnum.ArrowDown,
                                          );
                                        },
                                        onArrowUp: () {
                                          salesBillingOneController
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
                                          await salesBillingOneController
                                              .addBillToDB(
                                            salesBillingController,
                                            PrinterEnum.Normal,
                                          );
                                        },
                                        onF3: () async {
                                          await salesBillingOneController
                                              .addBillToDB(
                                            salesBillingController,
                                            PrinterEnum.Thermal,
                                          );
                                        },
                                        onEnter: () {
                                          if (controller.selectedProductModel !=
                                              null) {
                                            salesBillingOneController
                                                    .productController.text =
                                                salesBillingOneController
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
                                          if (salesBillingOneController
                                                  .selectedProductModel !=
                                              null) {
                                            salesBillingOneController
                                                    .productController.text =
                                                salesBillingOneController
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
                                          salesBillingOneController
                                              .productController
                                              .text = suggestion.productName;
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
                                  salesBillingOneController
                                      .keyboardSelectUnitModel(
                                    KeyboardEventEnum.ArrowDown,
                                  );
                                  // setState(() {});
                                },
                                onArrowUp: () {
                                  salesBillingOneController
                                      .keyboardSelectUnitModel(
                                    KeyboardEventEnum.ArrowUp,
                                  );
                                  // setState(() {});
                                },
                                onF1: () {
                                  salesBillingController
                                      .updateCurrentSalesWidgetToNext();
                                },
                                focusNode: unitNode,
                                onEditingComplete: () {
                                  if (salesBillingOneController
                                          .selectedUnitModel !=
                                      null) {
                                    salesBillingOneController.unitController
                                        .text = salesBillingOneController
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
                                  log('Selected $suggestion');
                                  controller.setUnitModel = suggestion;
                                  salesBillingOneController.productController
                                      .text = suggestion.symbol ?? "";
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
                              onChange: (val) {
                                controller.update();
                              },
                            ),
                            Text("Qty: ${controller.qty}"),
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
                                    salesBillingOneController
                                        .keyboardSelectCustomerModel(
                                      KeyboardEventEnum.ArrowDown,
                                    );
                                    // setState(() {});
                                  },
                                  onArrowUp: () {
                                    salesBillingOneController
                                        .keyboardSelectCustomerModel(
                                      KeyboardEventEnum.ArrowUp,
                                    );
                                  },
                                  onEnter: () {
                                    if (salesBillingOneController
                                            .selectedCustomerModel !=
                                        null) {
                                      debugPrint(
                                        'Selected Customer :P ${salesBillingOneController.selectedCustomerModel}',
                                      );
                                      salesBillingOneController
                                              .customerController.text =
                                          salesBillingOneController
                                              .selectedCustomerModel!.name;
                                      salesBillingOneController
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
                                    if (salesBillingOneController
                                            .selectedCustomerModel !=
                                        null) {
                                      salesBillingOneController
                                              .customerController.text =
                                          salesBillingOneController
                                              .selectedCustomerModel!.name;
                                    }
                                  },
                                  selectedModel:
                                      controller.selectedCustomerModel,
                                  controller: controller.customerController,
                                  modelList: controller.customersList ?? [],
                                  model: NullCheckUtilities.getDummyCustomer(),
                                  onSuggestionSelected: (suggestion) {
                                    log("suggestion: ${suggestion.name}");
                                    controller.selectedCustomerModel =
                                        suggestion;
                                    controller.customerController.text =
                                        suggestion.name;
                                    if (salesBillingOneController
                                            .selectedCustomerModel !=
                                        null) {
                                      debugPrint(
                                        'Selected Customer :P ${salesBillingOneController.selectedCustomerModel}',
                                      );
                                      salesBillingOneController
                                              .customerController.text =
                                          salesBillingOneController
                                              .selectedCustomerModel!.name;
                                      salesBillingOneController
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
                      GetBuilder<SalesBillingOneController>(
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
                      CustomTFWithKeyboard(
                        controller: controller.sewingServiceInvoiceNoController,
                        keyboardNode:
                            controller.sewingServiceInvoiceNoKeyboardNode,
                        focusNode: controller.sewingServiceInvoiceNoNode,
                        label: "Invoice Number",
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      CustomTextButton(
                        "Thermal",
                        textColor: Colors.white,
                        backgoundColor: kPrimaryColor,
                        onPressed: () {
                          controller.addSewingServiceToDB();
                        },
                      ),
                      GetBuilder<ReceiptController>(
                        init: ReceiptController(),
                        builder: (rc) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: rc.isA5,
                                        onChanged: (bool? val) {
                                          rc.setIsA5 = val;
                                        },
                                      ),
                                      const CustomText("A5")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: rc.isPrint,
                                        onChanged: (bool? val) {
                                          rc.setIsPrint = val;
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
                                  rc.setPickedDateTime(dateTime);
                                },
                                dateTime: rc.pickedDateTime,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: CustomScreenUtility(context).width * 0.2,
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
                                              LogicalKeyboardKey.arrowDown) {
                                            rc.keyboardSelectBillModel();
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
                                        rc.givenAmountNode.requestFocus();
                                      },
                                      controller: rc.salesBillNoController,
                                      decoration: getInputDecoration(
                                        null,
                                        rc.selectedBillModel == null ||
                                                !_focusNodeBillNo.hasFocus
                                            ? "Enter Bill No"
                                            : rc.selectedBillModel!.billNo,
                                        rc.selectedBillModel == null
                                            ? ""
                                            : rc.selectedBillModel!.billNo,
                                      ),
                                    ),
                                    suggestionsCallback: (pattern) async {
                                      return rc.billModelList
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
                                      return GestureDetector(
                                        onPanDown: (details) {
                                          rc.setSelectedBillModel = suggestion;
                                          rc.salesBillNoController.text =
                                              suggestion.billNo;
                                          onBillNoControllerEditingComplete();
                                        },
                                        child: ListTile(
                                          title: Text(suggestion.billNo),
                                        ),
                                      );
                                    },
                                    onSuggestionSelected: (suggestion) {
                                      rc.setSelectedBillModel = suggestion;
                                      rc.salesBillNoController.text =
                                          suggestion.billNo;

                                      // node.nextFocus();
                                    },
                                  ),
                                ),
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
                                            rc.keyboardSelectCustomerModel();
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

                                        rc.paymentForNode.requestFocus();
                                      },
                                      controller: rc.customerController,
                                      decoration: getInputDecoration(
                                        null,
                                        rc.selectedCustomerModel == null ||
                                                !_focusNodeCustomer.hasFocus
                                            ? "Enter Customer / Phone No"
                                            : rc.selectedCustomerModel!.name,
                                        rc.selectedCustomerModel == null
                                            ? ""
                                            : rc.selectedCustomerModel!.name,
                                      ),
                                    ),
                                    suggestionsCallback: (pattern) async {
                                      return rc.customersList!
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
                                      return GestureDetector(
                                        onPanDown: (panDetails) {
                                          rc.selectedCustomerModel = suggestion;
                                          rc.customerController.text =
                                              suggestion.name;
                                          final todayDate = DateTime.now();
                                          late DateTime selectedDateTime;
                                          if (todayDate.month >= 4) {
                                            selectedDateTime =
                                                DateTime(todayDate.year, 4);
                                          } else {
                                            selectedDateTime =
                                                DateTime(todayDate.year - 1, 4);
                                          }
                                          final pendingAmount =
                                              ReportCalculations
                                                  .getStartBalance(
                                            selectedDateTime,
                                            suggestion.id,
                                          );
                                          onCustomerControllerComplete();
                                          print(
                                            "pendingAmount: $pendingAmount",
                                          );
                                          rc.pendingAmountController.text =
                                              pendingAmount.toStringAsFixed(2);
                                          debugPrint('Selected $suggestion');
                                          // node.nextFocus();
                                        },
                                        child: ListTile(
                                          tileColor: rc.selectedCustomerModel ==
                                                  suggestion
                                              ? Colors.grey[300]
                                              : Colors.white,
                                          title: Text(suggestion.name),
                                        ),
                                      );
                                    },
                                    onSuggestionSelected: (suggestion) {
                                      rc.selectedCustomerModel = suggestion;
                                      rc.customerController.text =
                                          suggestion.name;
                                      final todayDate = DateTime.now();
                                      late DateTime selectedDateTime;
                                      if (todayDate.month >= 4) {
                                        selectedDateTime =
                                            DateTime(todayDate.year, 4);
                                      } else {
                                        selectedDateTime =
                                            DateTime(todayDate.year - 1, 4);
                                      }
                                      final pendingAmount =
                                          ReportCalculations.getStartBalance(
                                        selectedDateTime,
                                        suggestion.id,
                                      );
                                      print("pendingAmount: $pendingAmount");
                                      rc.pendingAmountController.text =
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
                                controller: rc.receiptNoController,
                                onEditingComplete: () {},
                                isEnabled: false,
                              ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // CustomTextField(
                              //   label: "Bill No",
                              //   rc: rc.billNoController,
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                label: "Pending Amount",
                                isEnabled: false,
                                controller: rc.pendingAmountController,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                focusNode: rc.paymentForNode,
                                label: "Payment For",
                                controller: rc.paymentForController,
                                onEditingComplete: () {
                                  rc.receivedFromNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                focusNode: rc.givenAmountNode,
                                label: "Given Amount",
                                controller: rc.givenAmountController,
                                onEditingComplete: () {
                                  rc.receivedFromNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                focusNode: rc.receivedFromNode,
                                label: "Received From",
                                controller: rc.receivedFromController,
                                onEditingComplete: () {
                                  rc.paymentMethodNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DropdownButton<String>(
                                focusNode: rc.paymentMethodNode,
                                onChanged: (data) async {
                                  rc.performInit();
                                  print(
                                    "All Customer = ${rc.customersList}",
                                  );
                                  if (data != null) {
                                    rc.setSelectedPaymentMethod(data);
                                  }

                                  rc.paymentIDNode.requestFocus();
                                },
                                value: rc.selectedPaymentMethod,
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
                                focusNode: rc.paymentIDNode,
                                label: "Payment ID",
                                controller: rc.paymentIDController,
                                onEditingComplete: () async {
                                  await rc.addReceiptData();
                                  rc.resetInputField();
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
                                  await rc.addReceiptData();
                                  rc.resetInputField();
                                  _focusNodeCustomer1.requestFocus();
                                },
                              ),
                            ],
                          );
                        },
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
