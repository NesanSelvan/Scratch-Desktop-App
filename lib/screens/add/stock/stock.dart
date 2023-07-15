import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../../controller/billing/sales/sales.dart';
import '../../../controller/home/home.dart';
import '../../../controller/stock/stock.dart';
import '../../../enum/stock.dart';
import '../../../models/product/product.dart';
import '../../../models/stocks/stock.dart';
import '../../../utils/utility.dart';
import '../../../widgets/custom_table.dart';
import '../../../widgets/operation_buttons.dart';
import '../../../widgets/search_by.dart';
import '../../../widgets/text_field.dart';

class AddStockScreen extends StatefulWidget {
  const AddStockScreen({Key? key}) : super(key: key);

  @override
  _AddStockScreenState createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  StockEnum searchStockEnum = StockEnum.ProductName;
  final FocusNode _focusNode = FocusNode();
  final FocusNode _productNameNode = FocusNode();
  final FocusNode _stockCountNode = FocusNode();
  StockController stockController = Get.put(StockController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    stockController.getAllStocks();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: CustomScreenUtility(context).width,
        height: CustomScreenUtility(context).height,
        child: Column(
          children: [
            SizedBox(
              height: CustomScreenUtility(context).height * 0.07,
              child: const Center(
                child: CustomText(
                  "Stock Management",
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                // color: Colors.red,
                width: CustomScreenUtility(context).width * 0.8,
                height: CustomScreenUtility(context).height * 0.13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SearchByText(),
                    const SizedBox(width: 20),
                    DropdownButton<StockEnum>(
                      value: searchStockEnum,
                      onChanged: (e) {
                        setState(() {
                          searchStockEnum = e!;
                        });
                      },
                      items: StockEnum.values
                          .map(
                            (e) => DropdownMenuItem<StockEnum>(
                              value: e,
                              child: CustomText(
                                stockEnumToStr(e),
                                size: 12,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 50,
                      child: CustomTextField(
                        controller: stockController.searchController,
                        label: "Search",
                        onChange: (String value) {
                          stockController.searchStock(value);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Scrollable(
              viewportBuilder: (BuildContext context, ViewportOffset position) {
                return GetBuilder<StockController>(
                  builder: (controller) {
                    return SizedBox(
                      height: CustomScreenUtility(context).height * 0.8,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: CustomScreenUtility(context).width * 0.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomText(
                                        "Menu",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      IconButton(
                                        icon: const CustomIcon(
                                          Icons.refresh,
                                          color: kPrimaryColor,
                                        ),
                                        onPressed: () {
                                          controller.getAllStocks();
                                        },
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  RawKeyboardListener(
                                    focusNode: _productNameNode,
                                    onKey: (RawKeyEvent rawKeyEvent) {
                                      final isKeyDown =
                                          Utility().isKeyDown(rawKeyEvent);
                                      switch (rawKeyEvent.data.runtimeType) {
                                        case RawKeyEventDataWindows:
                                          final data = rawKeyEvent.data
                                              as RawKeyEventDataWindows;
                                          if (data.logicalKey ==
                                              LogicalKeyboardKey.enter) {
                                            if (controller.selectedProduct !=
                                                null) {
                                              controller.productNameController
                                                      .text =
                                                  controller.selectedProduct!
                                                      .productName;
                                            }
                                          }
                                          if (!isKeyDown) {
                                            debugPrint('${data.logicalKey}');
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
                                    child: TypeAheadField<ProductModel>(
                                      textFieldConfiguration:
                                          TextFieldConfiguration(
                                        autofocus: true,
                                        onEditingComplete: () {
                                          controller
                                                  .productNameController.text =
                                              controller
                                                  .selectedProduct!.productName;
                                          controller.stockCountController
                                              .clear();
                                          _stockCountNode.requestFocus();
                                        },
                                        controller:
                                            controller.productNameController,
                                        decoration: getInputDecoration(
                                          null,
                                          "Enter Product Name",
                                          controller.selectedProduct == null
                                              ? ""
                                              : controller
                                                  .selectedProduct!.productName,
                                        ),
                                      ),
                                      suggestionsCallback: (pattern) async {
                                        return controller.allProductsList.where(
                                          (suggestion) => suggestion.productName
                                              .toLowerCase()
                                              .contains(pattern.toLowerCase()),
                                        );
                                      },
                                      itemBuilder: (BuildContext context,
                                          ProductModel suggestion) {
                                        return ListTile(
                                          tileColor:
                                              controller.selectedProduct ==
                                                      suggestion
                                                  ? Colors.grey[300]
                                                  : Colors.white,
                                          title: Text(suggestion.productName),
                                        );
                                      },
                                      onSuggestionSelected: (suggestion) {
                                        controller.selectedProduct = suggestion;
                                        controller.productNameController.text =
                                            suggestion.productName;
                                        debugPrint('Selected $suggestion');

                                        // node.nextFocus();
                                      },
                                    ),
                                  ),
                                  // TypeAheadField<ProductModel>(
                                  //   textFieldConfiguration:
                                  //       TextFieldConfiguration(
                                  //     autofocus: true,
                                  //     onEditingComplete: () {
                                  //       controller.productNameController.text =
                                  //           controller
                                  //               .selectedProduct!.productName;
                                  //       controller.stockCountController.clear();
                                  //       _stockCountNode.requestFocus();
                                  //     },
                                  //     controller:
                                  //         controller.productNameController,
                                  //     decoration: getInputDecoration(
                                  //       null,
                                  //       "Enter Product Name",
                                  //       controller.selectedProduct == null
                                  //           ? ""
                                  //           : controller
                                  //               .selectedProduct!.productName,
                                  //     ),
                                  //   ),
                                  //   suggestionsCallback: (pattern) async {
                                  //     return controller.allProductsList.where(
                                  //       (suggestion) => suggestion.productName
                                  //           .toLowerCase()
                                  //           .contains(pattern.toLowerCase()),
                                  //     );
                                  //   },
                                  //   itemBuilder: (BuildContext context,
                                  //       ProductModel suggestion) {
                                  //     return ListTile(
                                  //       tileColor: controller.selectedProduct ==
                                  //               suggestion
                                  //           ? Colors.grey[300]
                                  //           : Colors.white,
                                  //       title: Text(suggestion.productName),
                                  //     );
                                  //   },
                                  //   onSuggestionSelected: (suggestion) {
                                  //     controller.selectedProduct = suggestion;
                                  //     controller.productNameController.text =
                                  //         suggestion.productName;
                                  //     debugPrint('Selected $suggestion');

                                  //     // node.nextFocus();
                                  //   },
                                  // ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    focusNode: _stockCountNode,
                                    controller: controller.stockCountController,
                                    label: "Enter Stock count",
                                    onEditingComplete: () async {
                                      await controller.addStock();
                                      debugPrint("Focusing in ProductNameNode");
                                      _productNameNode.requestFocus();
                                      debugPrint("Clearing");
                                      controller.productNameController.clear();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  OperationButtons(
                                    onAdd: () async {
                                      await controller.addStock();
                                      controller.productNameController.clear();
                                      _productNameNode.requestFocus();
                                    },
                                    onClear: () {
                                      controller.clearTextField();
                                      controller.setSelectedStockModel(null);
                                    },
                                    onDelete: controller.deleteStock,
                                    onUpdate: controller.updateStock,
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextButton(
                                    "Reset All Stock",
                                    onPressed: () {
                                      controller.resetStock();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextButton(
                                    "Reset Only Negative Stock",
                                    onPressed: () {
                                      controller.resetAllNegativeStock();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.grey[10],
                              width: CustomScreenUtility(context).width * 0.77,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        color: kLightPrimaryColor,
                                        child: Row(
                                          children: StockEnum.values
                                              .map(
                                                (e) => CustomTableHeaderElement(
                                                  width: CustomScreenUtility(
                                                        context,
                                                      ).width *
                                                      0.77 /
                                                      StockEnum.values.length,
                                                  text: stockEnumToStr(e),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                      GetBuilder<StockController>(
                                        builder: (controller) {
                                          return Column(
                                            children: controller
                                                    .stockModelList.isEmpty
                                                ? [
                                                    const CustomText(
                                                      "No Stock Record Exists",
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      size: 14,
                                                    )
                                                  ]
                                                : controller.stockModelList
                                                    .map(
                                                      (e) => buildInkWell(
                                                        e,
                                                        controller,
                                                      ),
                                                    )
                                                    .toList(),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInkWell(StockModel e, StockController controller) {
    return InkWell(
      onTap: () {
        controller.onStockTap(e);
      },
      child: Container(
        color: controller.selectedStockModel == e
            ? Colors.grey[300]
            : controller.stockModelList.indexOf(e) % 2 == 0
                ? Colors.white
                : Colors.grey[200],
        child: Row(
          children: [
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  StockEnum.values.length,
              text: e.productCode,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  StockEnum.values.length,
              text:
                  "${productDB.getProductModelById(e.productId)?.productName}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  StockEnum.values.length,
              // text: validate,
              text: "${e.qty}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  StockEnum.values.length,
              // text: validate,
              text: getFormattedDateTime(e.createdAt),
            ),
          ],
        ),
      ),
    );
  }
}
