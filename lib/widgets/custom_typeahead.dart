import 'dart:io';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/extensions/type.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/persons/employee/employee.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/utils/search/search.dart';
import 'package:annai_store/widgets/custom_keyboard.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CustomTypeAhead<T> extends StatelessWidget {
  final FocusNode focusNode;
  final FocusNode? prevNode;
  final FocusNode? nextNode;
  final FocusNode keyboardFocusNode;
  final bool? autofocus;
  final Callback? onEnter;
  final Callback? onAdd;
  final Callback? onArrowUp;
  final Callback? onF1;
  final VoidCallback? onTap;
  final Callback? onF2;
  final Callback? onF3;
  final Callback? onArrowDown;
  final Callback onEditingComplete;
  final TextEditingController controller;
  final T? selectedModel;
  final List<T>? modelList;
  final bool? isSpecialSearch;
  final T model;
  final bool? isKeyPressUp;
  final ValueSetter<T> onSuggestionSelected;
  const CustomTypeAhead({
    Key? key,
    required this.focusNode,
    required this.onEditingComplete,
    required this.controller,
    required this.selectedModel,
    required this.modelList,
    required this.model,
    required this.onSuggestionSelected,
    this.autofocus,
    required this.keyboardFocusNode,
    this.isKeyPressUp,
    this.onEnter,
    this.onAdd,
    this.onArrowUp,
    this.onArrowDown,
    this.onF1,
    this.onF2,
    this.onF3,
    this.prevNode,
    this.nextNode,
    this.onTap,
    this.isSpecialSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suggesstionBoxController = SuggestionsBoxController();
    Object redrawObject = Object();

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          if (focusNode.hasFocus) ...[
            if (selectedModel?.genericType == ProductModel)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
                child: CustomText(
                  "${(selectedModel as ProductModel?)?.productName}",
                  size: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (selectedModel?.genericType == CustomerModel)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
                child: CustomText(
                  "${(selectedModel as CustomerModel?)?.name}",
                  size: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(
              height: 10,
            )
          ],
          CustomKeyboard(
            focusNode: keyboardFocusNode,
            isKeyPressUp: isKeyPressUp,
            onAdd: onAdd ?? () {},
            onArrowDown: onArrowDown != null
                ? () {
                    onArrowDown!();
                    debugPrint("Selected Type : $selectedModel");
                    redrawObject = Object();
                  }
                : () {},
            onArrowUp: onArrowUp ?? () {},
            onEnter: onEnter ?? () {},
            onF1: onF1 ?? () {},
            onF2: onF2 ?? () {},
            onF3: onF3 ?? () {},
            onShiftRight: () {
              if (prevNode != null) {
                prevNode!.requestFocus();
              }
            },
            child: TypeAheadField<T>(
              // key: ValueKey<Object>(redrawObject),
              textFieldConfiguration: TextFieldConfiguration(
                focusNode: focusNode,
                autofocus: autofocus ?? false,
                onEditingComplete: () {
                  onEditingComplete();
                  if (nextNode != null) {
                    nextNode!.requestFocus();
                  }
                },
                controller: controller,
                decoration: getInputDecoration(
                  null,
                  SearchUtility.getLabel<T>(selectedModel, focusNode, model),
                  SearchUtility.getHint<T>(selectedModel, model),
                ),
              ),
              suggestionsCallback: (pattern) async {
                return SearchUtility.customSearch<T>(
                  pattern,
                  modelList ?? [],
                  isSpecialSearch: isSpecialSearch ?? false,
                );
              },
              // suggestionsBoxDecoration: SuggestionsBoxDecoration(
              //     color: selectedModel == null ? Colors.red : Colors.green),
              suggestionsBoxController: suggesstionBoxController,
              itemBuilder: (BuildContext context, T suggestion) {
                debugPrint("Suggestion Type: ${suggestion!.genericType}");
                if (suggestion.genericType == CustomerModel) {
                  final customer = suggestion as CustomerModel;
                  return ListTile(
                    tileColor: selectedModel == suggestion
                        ? Colors.grey[300]
                        : Colors.white,
                    title: CustomText(customer.name),
                  );
                } else if (suggestion.genericType == ProductModel) {
                  final product = suggestion as ProductModel;
                  return ListTile(
                    leading: Container(
                      child: product.imagesList == null
                          ? const Icon(Icons.production_quantity_limits)
                          : product.imagesList!.isEmpty
                              ? const Icon(Icons.production_quantity_limits)
                              : Image.file(File(product.imagesList!.first)),
                    ),
                    tileColor: selectedModel == suggestion
                        ? Colors.grey[300]
                        : Colors.white,
                    title: CustomText(product.productName),
                    subtitle: CustomText(
                      "${product.companyId != null ? companyDB.getCompanyById(product.companyId!).name : ''} (₹ ${product.sellingPrice})",
                      size: 10,
                    ),
                  );
                } else if (suggestion.genericType == EmployeeModel) {
                  final employee = suggestion as EmployeeModel;
                  return ListTile(
                    tileColor: selectedModel == suggestion
                        ? Colors.grey[300]
                        : Colors.white,
                    title: CustomText(employee.name),
                  );
                } else if (suggestion.genericType == CompanyModel) {
                  final employee = suggestion as CompanyModel;
                  return ListTile(
                    tileColor: selectedModel == suggestion
                        ? Colors.grey[300]
                        : Colors.white,
                    title: CustomText(employee.name),
                  );
                } else if (suggestion.genericType == CategoryModel) {
                  final category = suggestion as CategoryModel;
                  return ListTile(
                    tileColor: selectedModel == suggestion
                        ? Colors.grey[300]
                        : Colors.white,
                    title: CustomText(category.category),
                    subtitle: CustomText("${category.hsnCode}"),
                  );
                } else if (suggestion.genericType == UnitModel) {
                  final category = suggestion as UnitModel;
                  return ListTile(
                    tileColor: selectedModel == suggestion
                        ? Colors.grey[300]
                        : Colors.white,
                    title: CustomText(category.symbol ?? ""),
                    subtitle: CustomText(category.formalName ?? ""),
                  );
                }
                return ListTile(
                  tileColor: selectedModel == suggestion
                      ? Colors.grey[300]
                      : Colors.white,
                  title: const CustomText("Not Defined"),
                );
              },
              onSuggestionSelected: onSuggestionSelected,
            ),
          ),
        ],
      ),
    );
  }
}
