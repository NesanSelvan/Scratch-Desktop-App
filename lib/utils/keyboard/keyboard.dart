import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/utils/search/search.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

// ignore: avoid_classes_with_only_static_members
class KeyboardUtilities {
  static CategoryModel? keyboardSelectCategoryModel(
    String text,
    List<CategoryModel> _categoryList,
    CategoryModel? selectedCategory,
    KeyboardEventEnum keyboardEventEnum,
  ) {
    debugPrint('text: $text');
    final catList =
        SearchUtility.customSearch<CategoryModel>(text, _categoryList);

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (keyboardEventEnum == KeyboardEventEnum.ArrowDown) {
      if (selectedCategory == null) {
        if (catList.isEmpty) {
          return null;
        }
        return catList[0];
      } else {
        if (catList.contains(selectedCategory)) {
          final index = catList.indexOf(selectedCategory);
          if (index + 1 == catList.length) {
            return catList[0];
          } else {
            return catList[index + 1];
          }
        } else {
          return catList[0];
        }
      }
    } else if (keyboardEventEnum == KeyboardEventEnum.ArrowUp) {
      if (selectedCategory == null) {
        return catList.last;
      } else {
        if (catList.contains(selectedCategory)) {
          final index = catList.indexOf(selectedCategory);
          if (index - 1 < 0) {
            return catList.last;
          } else {
            return catList[index - 1];
          }
        } else {
          return catList.last;
        }
      }
    }
    return null;
  }

  static UnitModel? keyboardSelectUnitModel(
    String text,
    List<UnitModel> _unitList,
    UnitModel? selectedUnit,
    KeyboardEventEnum keyboardEventEnum,
  ) {
    debugPrint('text: $text');
    final unitList = SearchUtility.customSearch<UnitModel>(text, _unitList);

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (keyboardEventEnum == KeyboardEventEnum.ArrowDown) {
      if (selectedUnit == null) {
        return unitList[0];
      } else {
        if (unitList.contains(selectedUnit)) {
          final index = unitList.indexOf(selectedUnit);
          if (index + 1 == unitList.length) {
            return unitList[0];
          } else {
            return unitList[index + 1];
          }
        } else {
          return unitList[0];
        }
      }
    } else if (keyboardEventEnum == KeyboardEventEnum.ArrowUp) {
      if (selectedUnit == null) {
        return unitList.last;
      } else {
        if (unitList.contains(selectedUnit)) {
          final index = unitList.indexOf(selectedUnit);
          if (index - 1 < 0) {
            return unitList.last;
          } else {
            return unitList[index - 1];
          }
        } else {
          return unitList.last;
        }
      }
    }
    return null;
  }

  static CompanyModel? keyboardSelectCompanyModel(
    String text,
    List<CompanyModel> _companyList,
    CompanyModel? selectedCompanyModel,
    KeyboardEventEnum keyboardEventEnum,
  ) {
    debugPrint('text: $text');
    final compList =
        SearchUtility.customSearch<CompanyModel>(text, _companyList);

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (keyboardEventEnum == KeyboardEventEnum.ArrowDown) {
      if (selectedCompanyModel == null) {
        return compList[0];
      } else {
        if (compList.contains(selectedCompanyModel)) {
          final index = compList.indexOf(selectedCompanyModel);
          if (index + 1 == compList.length) {
            return compList[0];
          } else {
            return compList[index + 1];
          }
        } else {
          return compList[0];
        }
      }
    } else if (keyboardEventEnum == KeyboardEventEnum.ArrowUp) {
      if (selectedCompanyModel == null) {
        return compList.last;
      } else {
        if (compList.contains(selectedCompanyModel)) {
          final index = compList.indexOf(selectedCompanyModel);
          if (index - 1 < 0) {
            return compList.last;
          } else {
            return compList[index - 1];
          }
        } else {
          return compList.last;
        }
      }
    }
    return null;
  }

  static ProductModel? keyboardSelectProductModel(
    String text,
    List<ProductModel> productsList,
    ProductModel? selectedProductModel,
    KeyboardEventEnum keyboardEventEnum, {
    bool? isSpecialSearch,
  }) {
    final productList = SearchUtility.customSearch<ProductModel>(
      text,
      productsList,
      isSpecialSearch: isSpecialSearch,
    );
    print("productList: ${productList.length}");

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (keyboardEventEnum == KeyboardEventEnum.ArrowDown) {
      if (selectedProductModel == null) {
        return productList.elementAt(0);
      } else {
        ProductModel? existingItem;
        try {
          existingItem = productList.firstWhere(
            (itemToCheck) => itemToCheck.id == selectedProductModel.id,
          );
        } catch (e) {}
        if (existingItem != null) {
          final index = productList.indexOf(existingItem);
          if (index + 1 == productList.length) {
            return productList[0];
          } else {
            return productList[index + 1];
          }
        } else {
          return productList[0];
        }
      }
    } else if (keyboardEventEnum == KeyboardEventEnum.ArrowUp) {
      if (selectedProductModel == null) {
        return productList.last;
      } else {
        ProductModel? existingItem;
        try {
          existingItem = productList.firstWhere(
            (itemToCheck) => itemToCheck.id == selectedProductModel.id,
          );
        } catch (e) {}
        if (existingItem != null) {
          final index = productList.indexOf(existingItem);
          if (index - 1 < 0) {
            return productList.last;
          } else {
            return productList[index - 1];
          }
        } else {
          return productList.last;
        }
      }
    }
    return null;
  }

  static CustomerModel? keyboardSelectCustomerModel(
    String text,
    List<CustomerModel> customersDBList,
    CustomerModel? selectedCustomerModel,
    KeyboardEventEnum keyboardEventEnum,
  ) {
    debugPrint('text: $text');
    final customerList =
        SearchUtility.customSearch<CustomerModel>(text, customersDBList);

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (keyboardEventEnum == KeyboardEventEnum.ArrowDown) {
      if (customerList != null || customerList.isNotEmpty) {
        if (selectedCustomerModel == null) {
          return customerList[0];
        } else {
          if (customerList.contains(selectedCustomerModel)) {
            final index = customerList.indexOf(selectedCustomerModel);
            if (index + 1 == customerList.length) {
              return customerList[0];
            } else {
              return customerList[index + 1];
            }
          } else {
            return customerList[0];
          }
        }
      }
    } else if (keyboardEventEnum == KeyboardEventEnum.ArrowUp) {
      if (selectedCustomerModel == null) {
        return customerList.last;
      } else {
        if (customerList.contains(selectedCustomerModel)) {
          final index = customerList.indexOf(selectedCustomerModel);
          if (index - 1 < 0) {
            return customerList.last;
          } else {
            return customerList[index - 1];
          }
        } else {
          return customerList.last;
        }
      }
    }
    return null;
  }

  static PurchaseModel? keyboardSelectPurchaseModel(
    String text,
    List<PurchaseModel> _purchaseList,
    PurchaseModel? selectedPurchaseModel,
    KeyboardEventEnum keyboardEventEnum,
  ) {
    debugPrint('text: $text');
    final compList = _purchaseList
        .where(
          (suggestion) =>
              suggestion.billNo.toLowerCase().contains(text.toLowerCase()) ||
              suggestion.companyModel.name.toString().contains(text),
        )
        .toList();

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (keyboardEventEnum == KeyboardEventEnum.ArrowDown) {
      if (selectedPurchaseModel == null) {
        return compList[0];
      } else {
        if (compList.contains(selectedPurchaseModel)) {
          final index = compList.indexOf(selectedPurchaseModel);
          if (index + 1 == compList.length) {
            return compList[0];
          } else {
            return compList[index + 1];
          }
        } else {
          return compList[0];
        }
      }
    } else if (keyboardEventEnum == KeyboardEventEnum.ArrowUp) {
      if (selectedPurchaseModel == null) {
        return compList.last;
      } else {
        if (compList.contains(selectedPurchaseModel)) {
          final index = compList.indexOf(selectedPurchaseModel);
          if (index - 1 < 0) {
            return compList.last;
          } else {
            return compList[index - 1];
          }
        } else {
          return compList.last;
        }
      }
    }
    return null;
  }

  void onKeyPressed(
    RawKeyEvent rawKeyEvent, {
    required List<LogicalKeyboardKey> keyboardKeyList,
    required List<Callback> onKeyPressedList,
  }) {
    final isKeyDown = Utility().isKeyDown(rawKeyEvent);
    switch (rawKeyEvent.data.runtimeType) {
      case RawKeyEventDataWindows:
        final data = rawKeyEvent.data as RawKeyEventDataWindows;
        debugPrint('${data.logicalKey}');
        if (!isKeyDown) {
          for (var i = 0; i < keyboardKeyList.length; i++) {
            if (data.logicalKey == keyboardKeyList[i]) {
              onKeyPressedList[i]();
            }
          }
        }
        break;
      default:
        throw Exception('Unsupported platform ${rawKeyEvent.data.runtimeType}');
    }
  }

  void validateNumberInput(String inputText, FocusNode focusNode) {
    try {
      double.parse(inputText);
      focusNode.requestFocus();
    } catch (e) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Error Input has to be in number",
      );
    }
  }

  void validateInput(String inputText, FocusNode focusNode) {
    if (inputText != "") {
      focusNode.requestFocus();
    } else {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Error Input cannot be null",
      );
    }
  }
}
