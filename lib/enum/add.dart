import 'package:flutter/material.dart';

import '../screens/add/category/category.dart';
import '../screens/add/company/company.dart';
import '../screens/add/customer/customer.dart';
import '../screens/add/employee/employee.dart';
import '../screens/add/product/product.dart';
import '../screens/add/stock/stock.dart';
import '../screens/add/unit/unit.dart';

enum AddEnum { Product, Unit, Category, Customer, Stock, Company, Employee }

Widget getWidgetOfAdd(AddEnum addEnum) {
  switch (addEnum) {
    case AddEnum.Category:
      return const AddCategoryScreen();
    case AddEnum.Product:
      return const AddProductScreen();
    case AddEnum.Unit:
      return const AddUnitScreen();
    case AddEnum.Customer:
      return const AddCustomerScreen();
    case AddEnum.Stock:
      return const AddStockScreen();
    case AddEnum.Company:
      return const AddCompanyScreen();
    default:
      return const AddEmployeeScreen();
  }
}

String getStrofAddEnum(AddEnum addEnum) {
  switch (addEnum) {
    case AddEnum.Category:
      return "Category";
    case AddEnum.Product:
      return "Product";
    case AddEnum.Unit:
      return "Unit";
    case AddEnum.Customer:
      return "Customer";
    case AddEnum.Stock:
      return "Stock";
    case AddEnum.Company:
      return "Company";
    default:
      return "Employee";
  }
}
