import 'dart:io';

import 'package:annai_store/core/constants/constants.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../controller/billing/sales/sales.dart';
import '../../../../controller/product/sub/sub_product.dart';
import '../../../../enum/keyboard.dart';
import '../../../../models/product/product.dart';
import '../../../../utils/image/image.dart';
import '../../../../utils/null/null.dart';
import '../../../../utils/utility.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_typeahead.dart';
import '../../../../widgets/full_container.dart';
import '../../../../widgets/header_text.dart';
import '../../../../widgets/text_field.dart';
import '../product.dart';

class SubProductScreen extends StatefulWidget {
  const SubProductScreen({Key? key}) : super(key: key);

  @override
  _SubProductScreenState createState() => _SubProductScreenState();
}

class _SubProductScreenState extends State<SubProductScreen> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);

        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            debugPrint('History Keyboard: ${data.logicalKey}');

            if (!isKeyDown) {
              if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
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
        body: GetBuilder<SubProductController>(
          init: SubProductController(),
          builder: (controller) {
            return FullWidthHeightContainer(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: CustomScreenUtility(context).height * 0.1,
                      child: const HeaderText(
                        header: "Sub Product Management",
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: CustomScreenUtility(context).width * 0.25,
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.selectedThreadsCompanyModel !=
                                    null)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            CustomScreenUtility(context).width *
                                                0.2,
                                        child: CustomTextField(
                                          controller:
                                              controller.subProductNoController,
                                          label: "Add more products",
                                          maxLines: 3,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomTextButton(
                                            "Clear",
                                            backgoundColor: Colors.yellow[500],
                                            textColor: Colors.white,
                                            onPressed: () {
                                              controller.subProductNoController
                                                  .clear();
                                              controller.update();
                                            },
                                          ),
                                          const SizedBox(width: 10),
                                          CustomButton(
                                            buttonColor: Colors.green[400],
                                            icon: Icons.update,
                                            text: "Update",
                                            onTap: () async {
                                              // if (controller
                                              //         .selectedThreadsCompanyModel !=
                                              //     null) {
                                              //   await controller.updateThread(
                                              //       controller
                                              //           .selectedThreadsCompanyModel!,
                                              //       controller
                                              //           .threadsController
                                              //           .text
                                              //           .split(" "));
                                              //   controller
                                              //           .setSelectedThreadModel =
                                              //       threadCompanyDB
                                              //           .getThreadCompanyModelById(
                                              //               controller
                                              //                   .selectedThreadsCompanyModel!
                                              //                   .id);
                                              //   controller.update();
                                              // } else {
                                              //   CustomUtilies
                                              //       .customFailureSnackBar(
                                              //           "Error",
                                              //           "Please select ThreAad company to update");
                                              // }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                else
                                  Container(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomText(
                                      "Sub Product Products",
                                      fontWeight: FontWeight.bold,
                                      size: 16,
                                    ),
                                    CustomTextButton(
                                      "Add",
                                      backgoundColor: kPrimaryColor,
                                      textColor: Colors.white,
                                      onPressed: () async {
                                        controller.setIsAddClicked = true;
                                        // await Utility()
                                        //     .showAddThreadDialog(context);
                                      },
                                    )
                                  ],
                                ),
                                ...threadCompanyDB
                                    .getAllThreadCompanys()
                                    .map(
                                      (e) => Container(
                                        margin: const EdgeInsets.all(5),
                                        child: ListTile(
                                          onTap: () {
                                            // controller
                                            //     .setSelectedThreadModel = e;
                                          },
                                          tileColor: controller
                                                      .selectedThreadsCompanyModel ==
                                                  e
                                              ? Colors.grey[300]
                                              : Colors.grey[100],
                                          title: CustomText(
                                            e.companyModel.name,
                                          ),
                                          subtitle: CustomText(
                                            "${e.threadProduct.product.productName} ( ${e.threadProduct.threads.length} )",
                                          ),
                                          trailing: InkWell(
                                            onTap: () {
                                              // controller
                                              //     .deleteThreadCompanyModel(
                                              //         e);
                                              controller.update();
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (controller.selectedThreadsCompanyModel == null)
                          Container(
                            width: CustomScreenUtility(context).width * 0.75,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          CustomScreenUtility(context).width *
                                              0.25,
                                      height:
                                          CustomScreenUtility(context).height,
                                      child: Column(
                                        children: [
                                          CustomTypeAhead<ProductModel>(
                                            keyboardFocusNode:
                                                controller.productKeyboardNode,
                                            onArrowDown: () {
                                              controller
                                                  .keyboardSelectProductModel(
                                                KeyboardEventEnum.ArrowDown,
                                              );
                                              setState(() {});
                                            },
                                            onArrowUp: () {
                                              controller
                                                  .keyboardSelectProductModel(
                                                KeyboardEventEnum.ArrowUp,
                                              );
                                            },
                                            onEnter: () {
                                              if (controller
                                                      .selectedProductModel !=
                                                  null) {
                                                controller.productController
                                                        .text =
                                                    controller
                                                        .selectedProductModel!
                                                        .productName;
                                                controller.subproductNameNode
                                                    .requestFocus();
                                              } else {
                                                controller.productNode
                                                    .requestFocus();
                                              }
                                            },
                                            focusNode: controller.productNode,
                                            onEditingComplete: () {
                                              controller
                                                      .productController.text =
                                                  controller
                                                      .selectedProductModel!
                                                      .productName;
                                              controller.subproductNameNode
                                                  .requestFocus();
                                            },
                                            selectedModel:
                                                controller.selectedProductModel,
                                            controller:
                                                controller.productController,
                                            modelList: controller.productList,
                                            model: NullCheckUtilities
                                                .getDummyProduct(),
                                            onSuggestionSelected: (suggestion) {
                                              controller
                                                      .setSelectedProductModel =
                                                  suggestion;
                                              controller
                                                      .productController.text =
                                                  suggestion.productName;
                                              debugPrint(
                                                'Selected $suggestion',
                                              );
                                              controller.subproductNameNode
                                                  .requestFocus();
                                              // Navigator.of(context).push(MaterialPageRoute(
                                              //   builder: (context) => ProductPage(product: suggestion)
                                              // ));
                                            },
                                          ),
                                          const SizedBox(height: 10),
                                          CustomTextField(
                                            controller: controller
                                                .subProductNoController,
                                            focusNode:
                                                controller.subproductNoNode,
                                            onEditingComplete: () async {
                                              controller.subproductNameNode
                                                  .requestFocus();
                                            },
                                            label: "Enter Sub Product Number",
                                          ),
                                          const SizedBox(height: 10),
                                          CustomTextField(
                                            controller: controller
                                                .subProductNameController,
                                            focusNode:
                                                controller.subproductNameNode,
                                            onEditingComplete: () async {
                                              controller.subProductNoController
                                                      .text =
                                                  "${controller.selectedProductModel?.productNumber}.${controller.subProductNameController.text}";
                                              controller.subproductStockNode
                                                  .requestFocus();
                                            },
                                            label: "Enter Sub Product Name",
                                          ),
                                          const SizedBox(height: 10),
                                          CustomTextField(
                                            controller: controller
                                                .subProductStockController,
                                            focusNode:
                                                controller.subproductStockNode,
                                            onEditingComplete: () async {
                                              await controller
                                                  .addSubProductToDB();
                                            },
                                            label: "Enter Sub Product Stock",
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: Wrap(
                                              children: [
                                                ...controller.imagesList
                                                    .map(
                                                      (e) => ImageContainer(
                                                        width: 150,
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
                                                    final result =
                                                        ImageUtilities
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
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomTextButton(
                                                "Add",
                                                onPressed: () async {
                                                  await controller
                                                      .addSubProductToDB();
                                                },
                                              ),
                                              CustomTextButton(
                                                "Clear",
                                                backgoundColor:
                                                    Colors.yellow[700],
                                                textColor: Colors.white,
                                                onPressed: controller
                                                    .clearOnAddSubProduct,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        width:
                                            CustomScreenUtility(context).width *
                                                0.4,
                                        child: Column(
                                          children: [
                                            if (controller.subProductModel ==
                                                null)
                                              Container()
                                            else ...[
                                              CustomText(
                                                "${controller.subProductModel?.subProducts.length}",
                                              ),
                                              ...controller
                                                  .subProductModel!.subProducts
                                                  .map(
                                                    (e) => ExpansionTile(
                                                      title: CustomText(
                                                        e.name,
                                                      ),
                                                      children: [
                                                        const CustomText(
                                                          "Images",
                                                        ),
                                                        ...e.imagesList
                                                            .map(
                                                              (f) => Image.file(
                                                                File(
                                                                  f,
                                                                ),
                                                              ),
                                                            )
                                                            .toList()
                                                      ],
                                                    ),
                                                  )
                                                  .toList()
                                            ],
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        else
                          Container(
                            width: CustomScreenUtility(context).width * 0.75,
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.topCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.grey[100],
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomTextButton(
                                        "Save",
                                        onPressed: controller.saveThreads,
                                        backgoundColor: Colors.green[400],
                                        textColor: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomTextButton(
                                        "Exports",
                                        onPressed: () {},
                                        backgoundColor: Colors.red[400],
                                        textColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // if (controller.selectedThreadsCompanyModel ==
                                //     null)
                                //   const CustomText("Please Select a thread")
                                // else
                                //   SingleChildScrollView(
                                //     physics: const BouncingScrollPhysics(),
                                //     child: Wrap(
                                //       children: controller
                                //           .selectedThreadsCompanyModel!
                                //           .threadProduct
                                //           .threads
                                //           .map((e) {
                                //         final threadTextController =
                                //             TextEditingController();
                                //         // threadTextController.text =
                                //         //     "${e.stock}";
                                //         final stockList = controller
                                //             .threadStock
                                //             .where((element) =>
                                //                 element.number == e.number)
                                //             .toList();
                                //         if (stockList.isNotEmpty) {
                                //           threadTextController.text =
                                //               "${stockList.first.stock}";
                                //         }
                                //         final focus = FocusNode();
                                //         return Container(
                                //           width: 250,
                                //           margin: const EdgeInsets.all(5),
                                //           padding: const EdgeInsets.all(10),
                                //           color: Colors.grey[100],
                                //           child: Row(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceAround,
                                //             children: [
                                //               CustomText(e.number),
                                //               Column(
                                //                 children: [
                                //                   const CustomText(
                                //                     "Stock",
                                //                     size: 10,
                                //                   ),
                                //                   CustomText("${e.stock}")
                                //                 ],
                                //               ),
                                //               Container(
                                //                 width: 100,
                                //                 child: CustomTextField(
                                //                   label: "Stock",
                                //                   controller:
                                //                       threadTextController,
                                //                   onChange: (String? value) {
                                //                     controller.onTextFieldUpdated(
                                //                         threadTextController
                                //                                     .text ==
                                //                                 ""
                                //                             ? "0"
                                //                             : threadTextController
                                //                                 .text,
                                //                         e);
                                //                     // focus.requestFocus();
                                //                   },
                                //                   onEditingComplete: () {},
                                //                 ),
                                //               )
                                //             ],
                                //           ),
                                //         );
                                //       }).toList(),
                                //     ),
                                //   )
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
