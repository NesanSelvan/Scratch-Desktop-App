import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:annai_store/features/barcode_printer/cubit/barcode_printer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/product/product.dart';
import 'package:annai_store/controller/server/server.dart';
import 'package:annai_store/core/constants/calculations/basic_cal.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/enum/product.dart';
import 'package:annai_store/enum/sort/product.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/screens/viewer/image_viewer.dart';
import 'package:annai_store/utils/image/image.dart';
import 'package:annai_store/utils/null/null.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:annai_store/widgets/custom_keyboard.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/custom_typeahead.dart';
import 'package:annai_store/widgets/operation_buttons.dart';
import 'package:annai_store/widgets/search_by.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final FocusNode _focusNode = FocusNode();
  ProductController productController = Get.put(ProductController());
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return CustomKeyboard(
      focusNode: _focusNode,
      onF5: productController.addProduct,
      onF6: () {
        productController.clearAll();
      },
      onF7: productController.updateProduct,
      onF8: productController.deleteProduct,
      onAdd: () {},
      onArrowDown: () {},
      onArrowUp: () {},
      onEnter: () {},
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<ProductController>(
          builder: (controller) {
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: CustomScreenUtility(context).width,
                  height: CustomScreenUtility(context).height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: CustomScreenUtility(context).height * 0.07,
                          child: const Center(
                            child: CustomText(
                              "Product Management",
                              size: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: CustomScreenUtility(context).width * 0.2,
                              child: OperationButtons(
                                onAdd: () {
                                  debugPrint(
                                    "${productController.categoryList}",
                                  );
                                  productController.addProduct();
                                },
                                onClear: productController.clearAll,
                                onDelete: productController.deleteProduct,
                                onUpdate: productController.updateProduct,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                // color: Colors.red,
                                width:
                                    CustomScreenUtility(context).width * 0.78,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CountContainer(
                                          type: "No of Product",
                                          count: controller
                                              .productModelList.length
                                              .toDouble(),
                                        ),
                                        if (controller.searchController.text !=
                                            "")
                                          const SizedBox(width: 10),
                                        if (controller.searchController.text !=
                                            "")
                                          CountContainer(
                                            type: "No of Searched Product",
                                            count: controller
                                                .searchedProductModel.length
                                                .toDouble(),
                                          ),
                                        const SizedBox(width: 10),
                                        const SearchByText(),
                                        const SizedBox(width: 10),
                                        // DropdownButton<ProductEnum>(
                                        //     value: searchProductEnum,
                                        //     onChanged: (e) {
                                        //       setState(() {
                                        //         searchProductEnum = e!;
                                        //       });
                                        //     },
                                        //     items: ProductEnum.values
                                        //         .map((e) => DropdownMenuItem<ProductEnum>(
                                        //             value: e,
                                        //             child: CustomText(
                                        //               unitEnumToStr(e),
                                        //               size: 12,
                                        //             )))
                                        //         .toList()),
                                        const SizedBox(width: 10),
                                        SizedBox(
                                          width: 250,
                                          child: CustomTextField(
                                            controller: productController
                                                .searchController,
                                            label: "Search",
                                            onChange: (String value) {
                                              productController
                                                  .searchProduct(value);
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        CustomTextButton(
                                          "Generate Product No Again",
                                          onPressed: () async {
                                            await controller.addProductNumber();
                                            setState(() {});
                                          },
                                        ),
                                        DropdownButton<ProductSort>(
                                          value: controller.sort,
                                          items: ProductSort.values
                                              .map(
                                                (e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e.type),
                                                ),
                                              )
                                              .toList(),
                                          onChanged: (val) {
                                            if (val != null) {
                                              controller.sort = val;
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      color: kLightPrimaryColor,
                                      child: Row(
                                        children: ProductEnum.values
                                            .map(
                                              (e) => CustomTableHeaderElement(
                                                width:
                                                    CustomScreenUtility(context)
                                                            .width *
                                                        0.70 /
                                                        ProductEnum
                                                            .values.length,
                                                text: companyEnumToStr(e),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: CustomScreenUtility(context).height * 0.8,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      CustomScreenUtility(context).width * 0.2,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                print("Searching....");
                                                controller.onInit();
                                                // controller.searchedProductModel
                                                //     .clear();
                                                controller.getAllProduct();
                                                controller.update();
                                              },
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        // GetBuilder<ServerController>(
                                        //     builder: (serverController) {
                                        //   return CustomTextField(
                                        //     autofocus: true,
                                        //     focusNode: controller.codeFocus,
                                        //     controller: barcodeController,
                                        //     label: "Enter Code",
                                        //     onEditingComplete: () {
                                        //       controller.nameFocus.requestFocus();
                                        //     },
                                        //   );
                                        // }),
                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.codeKeyboardFocus,
                                          autofocus: true,
                                          focusNode: controller.codeFocus,
                                          controller: barcodeController,
                                          label: "Enter Code",
                                          // nextNode: controller.nameFocus,
                                          onEditingComplete: () {
                                            try {
                                              productDB.checkProductIfExists(
                                                barcodeController.text,
                                              );
                                              controller.nameFocus
                                                  .requestFocus();
                                            } catch (e) {
                                              CustomUtilies
                                                  .customFailureSnackBar(
                                                "Error in Adding Product",
                                                "$e",
                                              );
                                            }
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          nextNode: controller.companyFocus,
                                          prevNode: controller.codeFocus,
                                          keyboardNode:
                                              controller.nameKeyboardFocus,
                                          controller: controller.nameController,
                                          label: "Enter Name",
                                          focusNode: controller.nameFocus,
                                          textInputType: TextInputType.number,
                                          initialValue:
                                              controller.categoryList.isEmpty
                                                  ? null
                                                  : controller.categoryList
                                                      .first.catSymbol,
                                          onEditingComplete: () {
                                            controller.getAllCategory();
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Checkbox(
                                              value:
                                                  controller.multipleCompanyHas,
                                              onChanged: (val) {
                                                controller.multipleCompanyHas =
                                                    val;
                                              },
                                            ),
                                            const CustomText(
                                              "Multiple Company Has this product?",
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTypeAhead<CompanyModel>(
                                          nextNode: controller.categoryFocus,
                                          prevNode: controller.nameFocus,
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
                                            if (controller.selectedCompany !=
                                                null) {
                                              controller
                                                      .companyController.text =
                                                  controller
                                                      .selectedCompany!.name;
                                            } else {
                                              CustomUtilies
                                                  .customFailureSnackBar(
                                                "Error",
                                                "Please Select Company to proceed further",
                                              );
                                              controller.companyFocus
                                                  .requestFocus();
                                            }
                                            debugPrint(
                                              "controller.companyModelList : ${controller.companyModelList}",
                                            );
                                          },
                                          focusNode: controller.companyFocus,
                                          onEditingComplete: () {
                                            if (controller.selectedCompany !=
                                                null) {
                                              controller
                                                      .companyController.text =
                                                  controller
                                                      .selectedCompany!.name;
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
                                              //         controller.selectedCompany!);
                                              // if (uniqueCode != null) {
                                              //   barcodeController.text = uniqueCode;
                                              // }
                                            }
                                          },
                                          controller:
                                              controller.companyController,
                                          modelList:
                                              controller.companyModelList,
                                          model: NullCheckUtilities
                                              .getDummyCompany(),
                                          selectedModel:
                                              controller.selectedCompany,
                                          onSuggestionSelected: (suggestion) {
                                            controller.selectedCompany =
                                                suggestion;
                                            controller.companyController.text =
                                                suggestion.name;
                                            debugPrint('Selected $suggestion');
                                          },
                                          keyboardFocusNode:
                                              controller.companyKeyboardFocus,
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTypeAhead<CategoryModel>(
                                          onArrowDown: () {
                                            controller
                                                .keyboardSelectCategoryModel(
                                              KeyboardEventEnum.ArrowDown,
                                            );
                                          },
                                          onArrowUp: () {
                                            controller
                                                .keyboardSelectCategoryModel(
                                              KeyboardEventEnum.ArrowUp,
                                            );
                                          },
                                          onEnter: () {
                                            if (controller.selectedCategory !=
                                                null) {
                                              controller
                                                      .categoryController.text =
                                                  controller.selectedCategory!
                                                      .category;
                                              controller.unitNode
                                                  .requestFocus();
                                            } else {
                                              controller.categoryFocus
                                                  .requestFocus();
                                            }
                                          },
                                          focusNode: controller.categoryFocus,
                                          onEditingComplete: () {
                                            if (controller.selectedCategory !=
                                                null) {
                                              controller
                                                      .categoryController.text =
                                                  controller.selectedCategory!
                                                      .category;
                                            } else {
                                              CustomUtilies
                                                  .customFailureSnackBar(
                                                "Error",
                                                "Please show Category",
                                              );
                                            }
                                          },
                                          nextNode: controller.unitNode,
                                          prevNode: controller.nameFocus,
                                          controller:
                                              controller.categoryController,
                                          modelList: controller.categoryList,
                                          model: NullCheckUtilities
                                              .getDummyCategory(),
                                          selectedModel:
                                              controller.selectedCategory,
                                          onSuggestionSelected: (suggestion) {
                                            controller.setSelectedCategory(
                                              suggestion,
                                            );
                                            controller.categoryController.text =
                                                suggestion.category;
                                            debugPrint('Selected $suggestion');
                                            controller.unitNode.requestFocus();
                                          },
                                          keyboardFocusNode:
                                              controller.categoryKeyboardFocus,
                                        ),

                                        // RawKeyboardListener(
                                        //   focusNode: controller.categoryKeyboardFocus,
                                        //   onKey: (RawKeyEvent rawKeyEvent) async {
                                        //     final isKeyDown =
                                        //         Utility().isKeyDown(rawKeyEvent);

                                        //     switch (rawKeyEvent.data.runtimeType) {
                                        //       case RawKeyEventDataWindows:
                                        //         final data = rawKeyEvent.data
                                        //             as RawKeyEventDataWindows;
                                        //         debugPrint(
                                        //             'Sales One: ${data.logicalKey}');

                                        //         if (!isKeyDown) {
                                        //           if (data.logicalKey ==
                                        //               LogicalKeyboardKey.arrowDown) {
                                        //             controller
                                        //                 .keyboardSelectCategoryModel(
                                        //                     KeyboardEventEnum
                                        //                         .ArrowDown);
                                        //           } else if (data.logicalKey ==
                                        //               LogicalKeyboardKey.arrowUp) {
                                        //             controller
                                        //                 .keyboardSelectCategoryModel(
                                        //                     KeyboardEventEnum
                                        //                         .ArrowUp);
                                        //           } else if (data.logicalKey ==
                                        //               LogicalKeyboardKey.enter) {
                                        //             // controller
                                        //             //     .keyboardSelectProductModel();
                                        //             debugPrint(
                                        //                 'Product ${controller.selectedCategory}');
                                        //             if (controller.selectedCategory !=
                                        //                 null) {
                                        //               controller.categoryController
                                        //                       .text =
                                        //                   controller.selectedCategory!
                                        //                       .category;
                                        //               controller.unitNode
                                        //                   .requestFocus();
                                        //             } else {
                                        //               controller.categoryFocus
                                        //                   .requestFocus();
                                        //             }
                                        //           }
                                        //         }
                                        //         break;
                                        //       default:
                                        //         throw Exception(
                                        //             'Unsupported platform ${rawKeyEvent.data.runtimeType}');
                                        //     }
                                        //   },
                                        //   child: TypeAheadField<CategoryModel>(
                                        //     textFieldConfiguration:
                                        //         TextFieldConfiguration(
                                        //       focusNode: controller.categoryFocus,
                                        //       controller:
                                        //           controller.categoryController,
                                        //       onEditingComplete: () {
                                        //         if (controller.selectedCategory !=
                                        //             null) {
                                        //           controller.categoryController.text =
                                        //               controller
                                        //                   .selectedCategory!.category;
                                        //           controller.unitNode.requestFocus();
                                        //         } else {
                                        //           CustomUtilies.customFailureSnackBar(
                                        //               "Error",
                                        //               "Please show Category");
                                        //         }
                                        //       },
                                        //       decoration: getInputDecoration(
                                        //           null,
                                        //           controller.selectedCategory ==
                                        //                       null ||
                                        //                   !controller
                                        //                       .categoryFocus.hasFocus
                                        //               ? "Enter Category"
                                        //               : controller
                                        //                   .selectedCategory!.category,
                                        //           controller.selectedCategory == null
                                        //               ? ""
                                        //               : controller.selectedCategory!
                                        //                   .category),
                                        //     ),
                                        //     suggestionsCallback: (pattern) async {
                                        //       return controller.categoryList.where(
                                        //           (suggestion) =>
                                        //               suggestion.category
                                        //                   .toLowerCase()
                                        //                   .contains(pattern
                                        //                       .toLowerCase()) ||
                                        //               (suggestion.hsnCode
                                        //                   .toString()
                                        //                   .contains(pattern
                                        //                       .toLowerCase())));
                                        //     },
                                        //     itemBuilder:
                                        //         (context, CategoryModel suggestion) {
                                        //       return ListTile(
                                        //         tileColor:
                                        //             controller.selectedCategory ==
                                        //                     suggestion
                                        //                 ? Colors.grey[300]
                                        //                 : Colors.white,
                                        //         title: Text(suggestion.category),
                                        //         subtitle:
                                        //             Text("${suggestion.hsnCode}"),
                                        //       );
                                        //     },
                                        //     onSuggestionSelected: (suggestion) {
                                        //       controller.selectedCategory =
                                        //           suggestion;
                                        //       controller.categoryController.text =
                                        //           suggestion.category;
                                        //       debugPrint('Selected $suggestion');
                                        //       controller.unitNode.requestFocus();
                                        //       // Navigator.of(context).push(MaterialPageRoute(
                                        //       //   builder: (context) => ProductPage(product: suggestion)
                                        //       // ));
                                        //     },
                                        //   ),
                                        // ),

                                        const SizedBox(height: 20),
                                        CustomTypeAhead<UnitModel>(
                                          onArrowDown: () {
                                            controller.keyboardSelectUnitModel(
                                              KeyboardEventEnum.ArrowDown,
                                            );
                                          },
                                          onArrowUp: () {
                                            controller.keyboardSelectUnitModel(
                                              KeyboardEventEnum.ArrowUp,
                                            );
                                          },
                                          onEnter: () {
                                            if (controller.selectedUnit !=
                                                null) {
                                              controller.unitController.text =
                                                  controller.selectedUnit!
                                                          .symbol ??
                                                      "";
                                              controller.unitQtyFocus
                                                  .requestFocus();
                                            } else {
                                              controller.unitNode
                                                  .requestFocus();
                                            }
                                          },
                                          focusNode: controller.unitNode,
                                          onEditingComplete: () {
                                            if (controller.selectedUnit !=
                                                null) {
                                              controller.unitController.text =
                                                  controller.selectedUnit!
                                                          .symbol ??
                                                      "";
                                            } else {
                                              CustomUtilies
                                                  .customFailureSnackBar(
                                                "Error",
                                                "Please show Category",
                                              );
                                            }
                                          },
                                          nextNode: controller.unitQtyFocus,
                                          prevNode: controller.categoryFocus,
                                          controller: controller.unitController,
                                          modelList: controller.allUnitsList,
                                          model:
                                              NullCheckUtilities.getDummyUnit(),
                                          selectedModel:
                                              controller.selectedUnit,
                                          onSuggestionSelected: (suggestion) {
                                            controller
                                                .setSelectedUnit(suggestion);
                                            controller.unitController.text =
                                                suggestion.symbol ?? "";
                                            debugPrint('Selected $suggestion');
                                          },
                                          keyboardFocusNode:
                                              controller.unitKeyboardFocus,
                                        ),

                                        const SizedBox(height: 20),

                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.unitKeyboardQtyFocus,
                                          focusNode: controller.unitQtyFocus,
                                          controller:
                                              controller.unitQtyController,
                                          label: "Enter Unit Qty",
                                          nextNode: controller.purchaseFocus,
                                          prevNode: controller.unitNode,
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          focusNode: controller.purchaseFocus,
                                          keyboardNode:
                                              controller.purchaseKeyboardFocus,
                                          prevNode: controller.unitQtyFocus,
                                          nextNode: controller.wholesaleFocus,
                                          controller: controller
                                              .purchasePriceController,
                                          label: "Enter Purchase Price",
                                          onChange: (String val) {
                                            // try {
                                            //   final value = double.parse(val);
                                            //   final mrp = controller
                                            //       .getMrpRetailWholesaleByPercCal(
                                            //           value)
                                            //       .first;
                                            //   final retail = controller
                                            //       .getMrpRetailWholesaleByPercCal(
                                            //           value)[1];
                                            //   final wholesale = controller
                                            //       .getMrpRetailWholesaleByPercCal(
                                            //           value)
                                            //       .last;
                                            //   controller.mrpController.text = "$mrp";
                                            //   controller.retailController.text =
                                            //       "$retail";
                                            //   controller.wholesaleController.text =
                                            //       "$wholesale";
                                            // } catch (e) {
                                            //   CustomUtilies.customFailureSnackBar(
                                            //       "Error", "Please Enter Number");
                                            // }
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTextButton(
                                          "Update Prices",
                                          onPressed: () {
                                            if (controller
                                                    .selectedProductModel !=
                                                null) {
                                              controller
                                                  .updateMRPRetailWholeByPercCalculation();
                                            }
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.wholesaleKeyboardFocus,
                                          nextNode: controller.retailFocus,
                                          prevNode: controller.purchaseFocus,
                                          focusNode: controller.wholesaleFocus,
                                          controller:
                                              controller.wholesaleController,
                                          label: "Enter Wholesale",
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.retailKeyboardFocus,
                                          nextNode: controller.mrpFocus,
                                          prevNode: controller.wholesaleFocus,
                                          focusNode: controller.retailFocus,
                                          controller:
                                              controller.retailController,
                                          isKeyPressUp: false,
                                          label: "Enter Retail",
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.mrpKeyboardFocus,
                                          nextNode: controller.code1Focus,
                                          prevNode: controller.retailFocus,
                                          isKeyPressUp: false,
                                          focusNode: controller.mrpFocus,
                                          controller: controller.mrpController,
                                          label: "Enter MRP",
                                          textInputType: TextInputType.number,
                                          onAdd: () {
                                            controller.addPriceModelList();
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTextButton(
                                          "Calculate Without Tax",
                                          onPressed: () {
                                            controller
                                                .calculateMRPRetailWholesalePurchaseFromMrpWithTax();
                                          },
                                        ),
                                        CustomTextButton(
                                          "Add Images",
                                          onPressed: () {
                                            final result =
                                                ImageUtilities.openFilePicker();
                                            if (result != null) {
                                              controller.setImageInImagesList =
                                                  result.path;
                                            }
                                          },
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: controller.imagesList
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
                                          ),
                                        ),
                                        if (controller.selectedProductModel !=
                                            null)
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                CustomText(
                                                  "MRP : ${BasicCalculation.calculateTax(categoryDB.getCategoryModelById(controller.selectedProductModel!.categoryId).tax, controller.selectedProductModel!.sellingPrice).toStringAsFixed(2)}  ",
                                                ),
                                                CustomText(
                                                  "Retail : ${BasicCalculation.calculateTax(categoryDB.getCategoryModelById(controller.selectedProductModel!.categoryId).tax, controller.selectedProductModel!.retail).toStringAsFixed(2)} ",
                                                ),
                                                CustomText(
                                                  "Wholesale : ${BasicCalculation.calculateTax(categoryDB.getCategoryModelById(controller.selectedProductModel!.categoryId).tax, controller.selectedProductModel!.wholesale).toStringAsFixed(2)} ",
                                                ),
                                              ],
                                            ),
                                          ),

                                        const SizedBox(height: 20),
                                        CustomText(
                                          "For Bill price",
                                          size: 10,
                                          color: Colors.grey[400],
                                        ),
                                        const SizedBox(height: 20),
                                        ...controller.priceModelList
                                            .map(
                                              (e) => ExpansionTile(
                                                onExpansionChanged: (bool val) {
                                                  if (val) {
                                                    controller
                                                        .setSelectedPriceModel = e;
                                                  } else {
                                                    controller
                                                            .setSelectedPriceModel =
                                                        null;
                                                  }
                                                },
                                                trailing: IconButton(
                                                  onPressed: () {
                                                    controller.priceModelList
                                                        .remove(e);
                                                    controller.update();
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red[400],
                                                  ),
                                                ),
                                                title: CustomText(
                                                  "${e.unitModel.formalName}",
                                                ),
                                                children: [
                                                  CustomText(
                                                    "Purchase Price : ${e.purchasePrice}",
                                                  ),
                                                  CustomText("MRP : ${e.mrp}"),
                                                  CustomText(
                                                    "Retail : ${e.retail}",
                                                  ),
                                                  CustomText(
                                                    "Wholesale : ${e.wholesale}",
                                                  ),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                        if (controller.selectedPriceModel !=
                                            null)
                                          CustomTextButton(
                                            "Update Price",
                                            onPressed: () {
                                              controller.updatePriceModelList();
                                            },
                                          ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.code1KeyboardFocus,
                                          prevNode: controller.mrpFocus,
                                          nextNode: controller.unit1Node,
                                          focusNode: controller.code1Focus,
                                          controller:
                                              controller.code1Controller,
                                          label: "Enter Code for this Unit",
                                          onEditingComplete: () => controller
                                              .unit1Node
                                              .requestFocus(),
                                        ),
                                        const SizedBox(height: 20),

                                        CustomTypeAhead<UnitModel>(
                                          onArrowDown: () {
                                            controller.keyboardSelectUnit1Model(
                                              KeyboardEventEnum.ArrowDown,
                                            );
                                          },
                                          onArrowUp: () {
                                            controller.keyboardSelectUnit1Model(
                                              KeyboardEventEnum.ArrowUp,
                                            );
                                          },
                                          onEnter: () {
                                            if (controller.selectedUnit1 !=
                                                null) {
                                              controller.unit1Controller.text =
                                                  controller.selectedUnit1!
                                                          .symbol ??
                                                      "";
                                              controller.unitQty1Focus
                                                  .requestFocus();
                                            } else {
                                              controller.unit1Node
                                                  .requestFocus();
                                            }
                                          },
                                          focusNode: controller.unit1Node,
                                          onEditingComplete: () {
                                            if (controller.selectedUnit1 !=
                                                null) {
                                              controller.unit1Controller.text =
                                                  controller.selectedUnit1!
                                                          .symbol ??
                                                      "";
                                            } else {
                                              CustomUtilies
                                                  .customFailureSnackBar(
                                                "Error",
                                                "Please show Category",
                                              );
                                            }
                                          },
                                          nextNode: controller.unitQty1Focus,
                                          prevNode: controller.code1Focus,
                                          controller:
                                              controller.unit1Controller,
                                          modelList: controller.allUnitsList,
                                          model:
                                              NullCheckUtilities.getDummyUnit(),
                                          selectedModel:
                                              controller.selectedUnit1,
                                          onSuggestionSelected: (suggestion) {
                                            controller
                                                .setSelectedUnit1(suggestion);
                                            controller.unit1Controller.text =
                                                suggestion.symbol ?? "";
                                            debugPrint('Selected $suggestion');
                                            controller.unit1Node.requestFocus();
                                          },
                                          keyboardFocusNode:
                                              controller.unit1KeyboardNode,
                                        ),

                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.unitQty1KeyboardFocus,
                                          prevNode: controller.unit1Node,
                                          nextNode: controller.purchase1Focus,
                                          focusNode: controller.unitQty1Focus,
                                          controller:
                                              controller.unitQty1Controller,
                                          label: "Enter Unit Qty",
                                          onEditingComplete: () => controller
                                              .purchase1Focus
                                              .requestFocus(),
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.purchase1KeyboardFocus,
                                          prevNode: controller.unitQty1Focus,
                                          nextNode: controller.wholesale1Focus,
                                          focusNode: controller.purchase1Focus,
                                          controller: controller
                                              .purchasePrice1Controller,
                                          label: "Enter Purchase Price",
                                          onChange: (val) {
                                            // try {
                                            //   final value = double.parse(val);

                                            //   final mrp = controller
                                            //       .getMrpRetailWholesaleByPercCal(
                                            //           value)
                                            //       .first;
                                            //   final retail = controller
                                            //       .getMrpRetailWholesaleByPercCal(
                                            //           value)[1];
                                            //   final wholesale = controller
                                            //       .getMrpRetailWholesaleByPercCal(
                                            //           value)
                                            //       .last;
                                            //   controller.mrp1Controller.text =
                                            //       "$mrp";
                                            //   controller.retail1Controller.text =
                                            //       "$retail";
                                            //   controller.wholesale1Controller.text =
                                            //       "$wholesale";
                                            // } catch (e) {
                                            //   CustomUtilies.customFailureSnackBar(
                                            //       "Error", "Please Enter Number");
                                            // }
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode: controller
                                              .wholesale1KeyboardFocus,
                                          focusNode: controller.wholesale1Focus,
                                          controller:
                                              controller.wholesale1Controller,
                                          label: "Enter Wholesale",
                                          prevNode: controller.purchase1Focus,
                                          nextNode: controller.retail1Focus,
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.retail1KeyboardFocus,
                                          focusNode: controller.retail1Focus,
                                          controller:
                                              controller.retail1Controller,
                                          prevNode: controller.wholesale1Focus,
                                          nextNode: controller.mrp1Focus,
                                          label: "Enter Retail",
                                        ),
                                        const SizedBox(height: 20),
                                        CustomKeyboard(
                                          isKeyPressUp: false,
                                          focusNode:
                                              controller.mrp1KeyboardFocus,
                                          onShiftRight: () {
                                            controller.retail1Focus
                                                .requestFocus();
                                          },
                                          onEnter: () async {
                                            if (controller
                                                    .mrp1Controller.text !=
                                                "") {
                                              controller.addPriceModelList();
                                              await controller.addProduct();
                                              controller.codeFocus
                                                  .requestFocus();
                                            } else {
                                              controller.mrp1Focus
                                                  .requestFocus();
                                            }
                                          },
                                          onAdd: () {
                                            controller.addPriceModelList();
                                          },
                                          onArrowDown: () {},
                                          onArrowUp: () {},
                                          child: CustomTextField(
                                            focusNode: controller.mrp1Focus,
                                            controller:
                                                controller.mrp1Controller,
                                            label: "Enter MRP 1",
                                            onChange: (String val) {
                                              if (val.contains("+")) {
                                                controller.addPriceModelList();
                                                // controller.unit1Node.requestFocus();
                                              }
                                            },
                                            onEditingComplete: () async {
                                              debugPrint(
                                                "SDSAD ${controller.mrp1Controller.text}",
                                              );
                                              if (controller
                                                      .mrp1Controller.text !=
                                                  "") {
                                                controller.addPriceModelList();
                                                await controller.addProduct();
                                                controller.codeFocus
                                                    .requestFocus();
                                              } else {
                                                controller.mrp1Focus
                                                    .requestFocus();
                                              }
                                            },
                                          ),
                                        ),

                                        const SizedBox(height: 20),
                                        CustomTextButton(
                                          "Calculate Without Tax",
                                          onPressed: () {
                                            controller
                                                .calculateMRPRetailWholesalePurchaseFromMrpWithTaxDifferentPriceModel();
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode: controller
                                              .wholesalePercKeyboardFocus,
                                          focusNode:
                                              controller.wholesalePercFocus,
                                          controller: controller
                                              .wholesalePercController,
                                          nextNode: controller.retailPercFocus,
                                          label: "Enter Wholesale",
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode: controller
                                              .retailPercKeyboardFocus,
                                          focusNode: controller.retailPercFocus,
                                          controller:
                                              controller.retailPercController,
                                          prevNode:
                                              controller.wholesalePercFocus,
                                          nextNode: controller.mrpPercFocus,
                                          label: "Enter Retail",
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTFWithKeyboard(
                                          keyboardNode:
                                              controller.mrpPercKeyboardFocus,
                                          focusNode: controller.mrpPercFocus,
                                          controller:
                                              controller.mrpPercController,
                                          prevNode: controller.retailPercFocus,
                                          label: "Enter MRP",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.grey[10],
                                  width:
                                      CustomScreenUtility(context).width * 0.77,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          GetBuilder<ProductController>(
                                            builder: (controller) {
                                              return Column(
                                                children: controller
                                                        .productModelList
                                                        .isEmpty
                                                    ? [
                                                        const CustomText(
                                                          "No Product Record Exists",
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          size: 14,
                                                        )
                                                      ]
                                                    : controller.searchController
                                                                    .text !=
                                                                "" &&
                                                            controller
                                                                .searchedProductModel
                                                                .isEmpty
                                                        ? [
                                                            const CustomText(
                                                              "No Product Record Exists",
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              size: 14,
                                                            )
                                                          ]
                                                        : controller
                                                                .searchedProductModel
                                                                .isNotEmpty
                                                            ? controller.searchController
                                                                        .text ==
                                                                    ""
                                                                ? controller.sort ==
                                                                        ProductSort
                                                                            .category
                                                                    ? buildProductByCategory(
                                                                        controller,
                                                                      )
                                                                    : controller
                                                                        .productModelList
                                                                        .map(
                                                                          (e) =>
                                                                              buildInkWell(
                                                                            e,
                                                                            controller,
                                                                          ),
                                                                        )
                                                                        .toList()
                                                                : controller
                                                                    .searchedProductModel
                                                                    .map(
                                                                      (e) =>
                                                                          buildInkWell(
                                                                        e,
                                                                        controller,
                                                                      ),
                                                                    )
                                                                    .toList()
                                                            : controller.sort ==
                                                                    ProductSort
                                                                        .category
                                                                ? buildProductByCategory(
                                                                    controller,
                                                                  )
                                                                : controller
                                                                    .productModelList
                                                                    .map(
                                                                      (e) =>
                                                                          buildInkWell(
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
                        )
                      ],
                    ),
                  ),
                ),
                if (controller.count != -1)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(0.2),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          Text(
                            "${controller.count}/${productDB.getAllProduct().length}",
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> buildProductByCategory(ProductController controller) {
    return categoryDB.getAllCategory().map((e) {
      final productsList = productDB.getAllProductByCategoryId(e.id);
      return Container(
        child: ExpansionTile(
          initiallyExpanded: true,
          title: CustomText("${e.category} (${e.hsnCode})"),
          children:
              productsList.map((f) => buildInkWell(f, controller)).toList(),
        ),
      );
    }).toList();
  }

  Widget buildSuggestionContainer(
    Function(CategoryModel) onSelected,
    Iterable<CategoryModel> options,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: Container(
          width: CustomScreenUtility(context).width * 0.2,
          height: 200.0,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final CategoryModel option = options.elementAt(index);
              return InkWell(
                onTap: () {
                  onSelected(option);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomText("${option.hsnCode} ( ${option.category} )"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildInkWell(ProductModel e, ProductController controller) {
    final productNumberController =
        TextEditingController(text: e.productNumber ?? "");
    return InkWell(
      onTap: () {
        controller.onProductTap(e);
      },
      child: ExpansionTile(
        onExpansionChanged: (value) {
          controller.onProductTap(e);
        },
        title: Container(
          color: controller.selectedProductModel == e
              ? Colors.grey[100]
              : controller.productModelList.indexOf(e) % 2 == 0
                  ? Colors.white
                  : Colors.grey[50],
          child: Row(
            children: [
              // CustomTableElement(
              //   width: CustomScreenUtility(context).width *
              //       0.70 /
              //       ProductEnum.values.length,
              //   text: e.code,
              // ),
              // CustomTableElement(
              //   width: CustomScreenUtility(context).width *
              //       0.70 /
              //       ProductEnum.values.length,
              //   text: e.productNumber ?? "",
              // ),

              Container(
                width: CustomScreenUtility(context).width *
                    0.70 /
                    ProductEnum.values.length,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(productNumberController.text),
                  // child: CustomTextField(
                  //   controller: productNumberController,
                  //   label: "Enter Product Number",
                  // ),
                ),
              ),
              CustomTableElement(
                width: CustomScreenUtility(context).width *
                    0.70 /
                    ProductEnum.values.length,
                text: e.productName,
              ),
              CustomTableElement(
                width: CustomScreenUtility(context).width *
                    0.70 /
                    ProductEnum.values.length,
                // text: validate,
                text: e.companyId != null
                    ? companyDB.getCompanyById(e.companyId!).name
                    : "",
              ),
              CustomTableElement(
                width: CustomScreenUtility(context).width *
                    0.70 /
                    ProductEnum.values.length,
                text: Database().getUnitModelById(e.unitId)?.symbol ?? "",
              ),
              CustomTableElement(
                width: CustomScreenUtility(context).width *
                    0.70 /
                    ProductEnum.values.length,
                text: e.unitQty.toString(),
              ),
              Container(
                width: CustomScreenUtility(context).width *
                    0.70 /
                    ProductEnum.values.length,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(
                    child: const Icon(Icons.update, color: kPrimaryColor),
                    onTap: () async {
                      await controller.updateProductNumber(
                        productNumberController.text,
                        e,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                "Barcode",
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
              Screenshot(
                controller: screenshotController,
                child: Container(
                  width: 240,
                  height: 100,
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SfBarcodeGenerator(
                    value: '${e.productNumber}',
                    showValue: true,
                  ),
                ),
              ),
            ],
          ),
          CustomTextButton(
            "Print",
            onPressed: () async {
              screenshotController.capture().then((Uint8List? image) async {
                if (image != null) {
                  context.read<BarcodePrinterCubit>().addImages(image, 1);
                }
                // if (image != null) {
                //   final path = await PDFGenerator.generateBarcode(
                //     [image],
                //     e.sellingPrice,
                //   );
                //   PDFGenerator.openPdf(path);
                //   final file = File(path);
                //   await PrinterUtility.barcodePrint(file);
                // } else {
                //   CustomUtilies.customFailureSnackBar("Error", "Image is null");
                // }
              }).catchError((onError) {
                print(onError);
              });

              // final printersList = await Printing.listPrinters();
              // Printer? printer;
              // final printerDataFromDB = "Bar Code Printer T-9650 Pro";
              // for (final item in printersList) {
              //   if (item.name == printerDataFromDB ||
              //       item.model == printerDataFromDB ||
              //       item.url == printerDataFromDB ||
              //       item.location == printerDataFromDB) {
              //     printer = item;
              //   }
              // }

              // if (printer != null) {
              //   // Printing.pickPrinter(context: context);
              //   Printing.layoutPdf(
              //     onLayout: (format) {
              //       print(format);
              //       return _generatePdf(format, "Testing");
              //     },
              //     format: PdfPageFormat(
              //       101.6 * PdfPageFormat.mm,
              //       20 * PdfPageFormat.mm,
              //     ),
              //     usePrinterSettings: true,
              //   );

              //   Printing.directPrintPdf(
              //       onLayout: (format) {
              //         return _generatePdf(format, "Testing");
              //       },
              //       printer: printer);
              // }
            },
          ),
          CustomTextButton(
            "Potrait",
            onPressed: () async {
              // screenshotController.capture().then((Uint8List? image) async {
              //   if (image != null) {
              //     final path = await PDFGenerator.generateBarcode(
              //       [image, image, image, image],
              //       e.sellingPrice,
              //       isPotrait: true,
              //     );
              //     PDFGenerator.openPdf(path);
              //     final file = File(path);
              //     await PrinterUtility.barcodePrint(file);
              //   } else {
              //     CustomUtilies.customFailureSnackBar("Error", "Image is null");
              //   }
              // }).catchError((onError) {
              //   print(onError);
              // });
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                CountContainer(type: "Purchase Price", count: e.purchasePrice),
                const SizedBox(
                  width: 20,
                ),
                CountContainer(
                  type: "Wholesale Price",
                  count: double.parse(
                    BasicCalculation.calculateTax(
                      categoryDB.getCategoryModelById(e.categoryId).tax,
                      e.wholesale,
                    ).toStringAsFixed(2),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CountContainer(
                  type: "Retail Price",
                  count: double.parse(
                    BasicCalculation.calculateTax(
                      categoryDB.getCategoryModelById(e.categoryId).tax,
                      e.retail,
                    ).toStringAsFixed(2),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CountContainer(
                  type: "MRP Price",
                  count: double.parse(
                    BasicCalculation.calculateTax(
                      categoryDB.getCategoryModelById(e.categoryId).tax,
                      e.sellingPrice,
                    ).toStringAsFixed(2),
                  ),
                ),
              ],
            ),
          ),
          const CustomText("Images"),
          if (e.imagesList == null)
            const CustomText("No Images to display")
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: e.imagesList!
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageViewer(image: e),
                            ),
                          );
                        },
                        child: Container(
                          width: CustomScreenUtility(context).width * 0.2,
                          child: Image.file(File(e)),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) => pw.Placeholder(),
      ),
    );

    return pdf.save();
  }
}

class ImageContainer extends StatelessWidget {
  final String imagePath;
  final VoidCallback onRemoveImageTap;
  final double? width, height;
  const ImageContainer({
    Key? key,
    required this.onRemoveImageTap,
    required this.imagePath,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageViewer(image: imagePath),
          ),
        );
      },
      child: Container(
        width: width ?? 40,
        height: height ?? 60,
        child: Stack(
          children: [
            Image.file(File(imagePath)),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: onRemoveImageTap,
                child: const Icon(Icons.cancel, size: 14, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountContainer extends StatelessWidget {
  final String type;
  final double count;
  const CountContainer({
    Key? key,
    required this.type,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(type, color: Colors.grey[600], fontWeight: FontWeight.bold),
        CustomText(
          "$count",
          fontWeight: FontWeight.bold,
          color: Colors.green[400],
          size: 20,
        )
      ],
    );
  }
}
