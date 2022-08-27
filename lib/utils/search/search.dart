import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:flutter/material.dart';

import '../../controller/billing/sales/sales.dart';
import '../../extensions/list.dart';
import '../../extensions/type.dart';
import '../../models/company/company.dart';
import '../../models/persons/employee/employee.dart';
import '../../models/price/price.dart';
import '../../models/unit/unit.dart';

// ignore: avoid_classes_with_only_static_members
class SearchUtility {
  static List<T> customSearch<T>(String pattern, List<T> datas,
      {bool? isSpecialSearch}) {
    debugPrint('Your List type is ${datas.genericType}!');
    List<T> returningData = [];
    if (datas.genericType == CustomerModel) {
      final typeDatas = datas as List<CustomerModel>;
      final matchedData = typeDatas
          .where(
            (element) =>
                element.name.toLowerCase().contains(pattern.toLowerCase()) ||
                element.mobileNo
                    .toString()
                    .toLowerCase()
                    .contains(pattern.toLowerCase()),
          )
          .toList();
      returningData = matchedData.cast<T>().toList();
    } else if (datas.genericType == ProductModel) {
      final typeDatas = datas as List<ProductModel>;
      // final companyList = companyDB.getAllCompany();
      debugPrint("Pattern: ${pattern.toLowerCase()}");
      final List<ProductModel> matchedP = [];
      debugPrint("Is Speacial Search: $isSpecialSearch");
      if (isSpecialSearch == true) {
        for (final item in typeDatas) {
          for (final price in item.differentPriceList ?? <PriceModel>[]) {
            if (price.code != null) {
              if (price.code!.toLowerCase().contains(pattern.toLowerCase()) ||
                  item.productNumber!
                      .toLowerCase()
                      .contains(pattern.toLowerCase())) {
                matchedP.add(item);
              }
            }
          }
        }
        debugPrint("Mactched P :${matchedP.length}");
        // final dat = typeDatas.where((element){
        //   return element.differentPriceList.where((price) => price.code.toLowerCase().contains(pattern.toLowerCase())
        // }).toList()).toList();
        final matchedData = typeDatas.where((element) {
          if (element.productNumber == null) {
            return element.productName
                    .toLowerCase()
                    .contains(pattern.toLowerCase()) ||
                element.code
                    .toString()
                    .toLowerCase()
                    .contains(pattern.toLowerCase());
          }
          return element.productName
                  .toLowerCase()
                  .contains(pattern.toLowerCase()) ||
              element.code
                  .toString()
                  .toLowerCase()
                  .contains(pattern.toLowerCase()) ||
              element.productNumber!
                  .toLowerCase()
                  .contains(pattern.toLowerCase());
        }).toList();
        debugPrint("Mactched P :${matchedData.length}");
        final List<ProductModel> finalMatchedData = [...matchedData];
        debugPrint("Final Matched Data Count: ${finalMatchedData.length}");
        for (final item in matchedP) {
          if (!finalMatchedData.contains(item)) {
            finalMatchedData.add(item);
          }
        }

        returningData = finalMatchedData.cast<T>().toList();
      } else {
        // for (final item in typeDatas) {
        //   for (final price in item.differentPriceList ?? <PriceModel>[]) {
        //     if (price.code != null) {
        //       if (price.code!.toLowerCase().contains(pattern.toLowerCase())) {
        //         matchedP.add(item);
        //       }
        //     }
        //   }
        // }
        // final dat = typeDatas.where((element){
        //   return element.differentPriceList.where((price) => price.code.toLowerCase().contains(pattern.toLowerCase())
        // }).toList()).toList();
        final matchedData = typeDatas.where((element) {
          if (element.productNumber == null) {
            return element.productName
                        .toLowerCase()
                        .contains(pattern.toLowerCase()) ||
                    element.companyId != null
                ? element.companyId == null
                    ? false
                    : companyDB
                        .getCompanyById(element.companyId!)
                        .name
                        .toLowerCase()
                        .contains(pattern.toLowerCase())
                : false ||
                    element.code.toLowerCase().contains(pattern.toLowerCase());
          }
          // ignore: avoid_bool_literals_in_conditional_expressions
          return element.productName
                      .toLowerCase()
                      .contains(pattern.toLowerCase()) ||
                  element.code.toLowerCase().contains(pattern.toLowerCase()) ||
                  element.companyId == null
              ? true
              : companyDB
                      .getCompanyById(element.companyId!)
                      .name
                      .toLowerCase()
                      .contains(pattern.toLowerCase()) ||
                  element.productNumber!
                      .toLowerCase()
                      .contains(pattern.toLowerCase());
        }).toList();
        final List<ProductModel> finalMatchedData = [...matchedData];
        for (final item in matchedP) {
          if (!finalMatchedData.contains(item)) {
            finalMatchedData.add(item);
          }
        }

        returningData = finalMatchedData.cast<T>().toList();
      }
    } else if (datas.genericType == EmployeeModel) {
      final typeDatas = datas as List<EmployeeModel>;
      final matchedData = typeDatas
          .where(
            (element) =>
                element.name.toLowerCase().contains(pattern.toLowerCase()) ||
                element.mobileNo
                    .toString()
                    .toLowerCase()
                    .contains(pattern.toLowerCase()),
          )
          .toList();
      returningData = matchedData.cast<T>().toList();
    } else if (datas.genericType == CompanyModel) {
      final typeDatas = datas as List<CompanyModel>;
      final matchedData = typeDatas
          .where(
            (element) =>
                element.name.toLowerCase().contains(pattern.toLowerCase()) ||
                element.mobileNoList
                    .toString()
                    .toLowerCase()
                    .contains(pattern.toLowerCase()),
          )
          .toList();
      returningData = matchedData.cast<T>().toList();
    } else if (datas.genericType == CategoryModel) {
      final typeDatas = datas as List<CategoryModel>;
      debugPrint("Your List type is Searching... $pattern");
      try {
        final matchedData = typeDatas
            .where(
              (element) =>
                  element.hsnCode.toString().contains(pattern.toLowerCase()) ||
                  element.category
                      .toString()
                      .toLowerCase()
                      .contains(pattern.toLowerCase()),
            )
            .toList();
        debugPrint("Your List type is : ${matchedData.length}");
        returningData = matchedData.cast<T>().toList();
      } catch (e) {
        return typeDatas.cast<T>().toList();
      }
    } else if (datas.genericType == UnitModel) {
      final typeDatas = datas as List<UnitModel>;
      debugPrint("Your List type is Searching... $pattern");
      try {
        final matchedData = typeDatas
            .where(
              (element) =>
                  element.symbol
                      .toString()
                      .toLowerCase()
                      .contains(pattern.toLowerCase()) ||
                  element.formalName
                      .toString()
                      .toLowerCase()
                      .contains(pattern.toLowerCase()),
            )
            .toList();
        debugPrint("Your List type is Unit: ${matchedData.length}");
        returningData = matchedData.cast<T>().toList();
      } catch (e) {
        return typeDatas.cast<T>().toList();
      }
    }
    return returningData;
  }

  static String getLabel<T>(T? selectedModel, FocusNode focus, T modelType) {
    debugPrint("Generic Type ${modelType.genericType}");
    if (modelType.genericType == ProductModel) {
      // final product = selectedModel as ProductModel?;
      // return product == null || !focus.hasFocus
      //     ? "Enter Product"
      //     : product.productName;
      return "Enter Product";
    } else if (modelType.genericType == CustomerModel) {
      final customer = selectedModel as CustomerModel?;
      return customer == null || !focus.hasFocus
          ? "Enter Customer"
          : customer.name;
    } else if (modelType.genericType == EmployeeModel) {
      final employee = selectedModel as EmployeeModel?;
      return employee == null || !focus.hasFocus
          ? "Enter Employee"
          : employee.name;
    } else if (modelType.genericType == CompanyModel) {
      final company = selectedModel as CompanyModel?;
      return company == null || !focus.hasFocus
          ? "Enter Company"
          : company.name;
    } else if (modelType.genericType == CategoryModel) {
      final category = selectedModel as CategoryModel?;
      return category == null || !focus.hasFocus
          ? "Enter Category"
          : category.category;
    } else if (modelType.genericType == UnitModel) {
      final unit = selectedModel as UnitModel?;
      return unit == null || !focus.hasFocus ? "Enter Unit" : unit.symbol ?? "";
    }
    return "Not Defined";
  }

  static String getHint<T>(T? selectedModel, T modelType) {
    debugPrint("Generic Type ${modelType.genericType}");
    if (modelType.genericType == ProductModel) {
      final product = selectedModel as ProductModel?;
      return product == null ? "" : product.productName;
    } else if (modelType.genericType == CustomerModel) {
      final customer = selectedModel as CustomerModel?;
      return customer == null ? "" : customer.name;
    } else if (modelType.genericType == EmployeeModel) {
      final customer = selectedModel as EmployeeModel?;
      return customer == null ? "" : customer.name;
    } else if (modelType.genericType == CompanyModel) {
      final company = selectedModel as CompanyModel?;
      return company == null ? "" : company.name;
    } else if (modelType.genericType == CategoryModel) {
      final category = selectedModel as CategoryModel?;
      return category == null ? "" : category.category;
    } else if (modelType.genericType == UnitModel) {
      final unit = selectedModel as UnitModel?;
      return unit == null ? "" : unit.symbol ?? "";
    }
    return "Not Defined";
  }
}
