import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../../controller/billing/sales/sales.dart';
import '../../../controller/category/category.dart';
import '../../../enum/category.dart';
import '../../../models/category/category.dart';
import '../../../utils/utility.dart';
import '../../../widgets/custom_table.dart';
import '../../../widgets/operation_buttons.dart';
import '../../../widgets/search_by.dart';
import '../../../widgets/text_field.dart';
import '../product/product.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  CategoryEnum searchCategoryEnum = CategoryEnum.HsnCode;
  final FocusNode _focusNode = FocusNode();
  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    categoryController.getAllCategory();
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);
        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            categoryController.updateKeys(data.logicalKey);
            if (!isKeyDown) {
              debugPrint('unitControllers ${categoryController.clickedKeys}');

              categoryController.performKeyboardClickedAction();
              debugPrint(
                'categoryController ${categoryController.clickedKeys}',
              );
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
                    "Category Management",
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
                      CountContainer(
                        type: "No of Category",
                        count: categoryDB.getAllCategory().length.toDouble(),
                      ),
                      const SizedBox(width: 20),
                      const SearchByText(),
                      const SizedBox(width: 20),
                      DropdownButton<CategoryEnum>(
                        value: searchCategoryEnum,
                        onChanged: (e) {
                          setState(() {
                            searchCategoryEnum = e!;
                          });
                        },
                        items: CategoryEnum.values
                            .map(
                              (e) => DropdownMenuItem<CategoryEnum>(
                                value: e,
                                child: CustomText(
                                  unitEnumToStr(e),
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
                          controller: categoryController.searchController,
                          label: "Search",
                          onChange: (String value) {
                            categoryController.searchUnit(value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  onPressed: categoryController.getAllCategory,
                                )
                              ],
                            ),
                            // const SizedBox(height: 20),
                            // CustomTextField(
                            //   controller: categoryController.hsnController,
                            //   autofocus: true,
                            //   label: "Enter Category Symbol",
                            //   textInputType: TextInputType.number,
                            // ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: categoryController.hsnController,
                              autofocus: true,
                              focusNode: categoryController.hsnCodeNode,
                              label: "Enter HSN Code",
                              textInputType: TextInputType.number,
                              onEditingComplete: () {
                                categoryController.catNode.requestFocus();
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              focusNode: categoryController.catNode,
                              controller: categoryController.categoryController,
                              label: "Enter Category",
                              onEditingComplete: () {
                                categoryController.taxNode.requestFocus();
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: categoryController.taxController,
                              label: "Enter Tax",
                              textInputType: TextInputType.number,
                              focusNode: categoryController.taxNode,
                              onEditingComplete: () async {
                                categoryController.catNode.requestFocus();
                                await categoryController.addCategory();
                              },
                            ),
                            const SizedBox(height: 20),
                            OperationButtons(
                              onAdd: categoryController.addCategory,
                              onClear: () {
                                categoryController.clearTextField();
                                categoryController
                                    .setSelectedCategoryModel(null);
                              },
                              onDelete: categoryController.deleteCategory,
                              onUpdate: categoryController.updateCategory,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey[10],
                        width: CustomScreenUtility(context).width * 0.7,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  color: kLightPrimaryColor,
                                  child: Row(
                                    children: CategoryEnum.values
                                        .map(
                                          (e) => CustomTableHeaderElement(
                                            width: CustomScreenUtility(
                                                  context,
                                                ).width *
                                                0.7 /
                                                CategoryEnum.values.length,
                                            text: unitEnumToStr(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                GetBuilder<CategoryController>(
                                  builder: (controller) {
                                    return Column(
                                      children: controller
                                              .categoryModelList.isEmpty
                                          ? [
                                              const CustomText(
                                                "No Category Record Exists",
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                size: 14,
                                              )
                                            ]
                                          : controller.searchedCategoryModel
                                                  .isNotEmpty
                                              ? controller.searchedCategoryModel
                                                  .map(
                                                    (e) => buildInkWell(
                                                      e,
                                                      controller,
                                                    ),
                                                  )
                                                  .toList()
                                              : controller.categoryModelList
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInkWell(CategoryModel e, CategoryController controller) {
    return InkWell(
      onTap: () {
        controller.onCategoryTap(e);
      },
      child: Container(
        color: controller.selectedCategoryModel == e
            ? Colors.grey[300]
            : controller.categoryModelList.indexOf(e) % 2 == 0
                ? Colors.white
                : Colors.grey[200],
        child: Row(
          children: [
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.69 /
                  CategoryEnum.values.length,
              text: e.hsnCode.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.69 /
                  CategoryEnum.values.length,
              text: e.category,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.69 /
                  CategoryEnum.values.length,
              text: e.tax.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.69 /
                  CategoryEnum.values.length,
              // text: validate,
              text: getFormattedDateTime(e.dateTime),
            ),
          ],
        ),
      ),
    );
  }
}
