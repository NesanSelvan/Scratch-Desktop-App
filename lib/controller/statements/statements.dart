import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/enum/statement.dart';
import 'package:annai_store/features/viewer/excel/excel.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/utils/datetime/datetime.dart';
import 'package:annai_store/utils/excel/statement.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatementController extends GetxController {
  DateTime _startDate = DateTimeUtility.getBillStartDate();
  DateTime _endDate = DateTimeUtility.getBillEndDate();
  bool isAllCustomer = true;
  bool isAllHSNCode = true;
  bool isAllCompany = true;
  StatementType statementType = StatementType.Excel;

  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  List<CustomerModel> _allCustomers = [];
  List<CustomerModel> get allCustomers => _allCustomers;
  CustomerModel? _selectedCustomer;
  CustomerModel? get selectedCustomer => _selectedCustomer;

  List<CategoryModel> _allCategory = [];
  List<CategoryModel> get allCategory => _allCategory;
  CategoryModel? _selectedCategory;
  CategoryModel? get selectedCategory => _selectedCategory;

  List<CompanyModel> _allCompanies = [];
  List<CompanyModel> get allCompanies => _allCompanies;
  CompanyModel? _selectedCompany;
  CompanyModel? get selectedCompany => _selectedCompany;

  set setSelectedCustomerModel(CustomerModel value) {
    _selectedCustomer = value;
    update();
  }

  set setSelectedCategoryModel(CategoryModel value) {
    _selectedCategory = value;
    update();
  }

  set setSelectedCompanyModel(CompanyModel value) {
    _selectedCompany = value;
    update();
  }

  List<CategoryModel> allCateory = [];

  void performInit() {
    debugPrint("Statement Init");
    getAllCustomers();
    getAllCatories();
    getAllCompanies();
  }

  @override
  void onInit() {
    performInit();
  }

  set setAllCustomers(List<CustomerModel> data) {
    _allCustomers = data;
    _allCustomers.sort((a, b) => a.name.compareTo(b.name));
    update();
  }

  set setAllCategory(List<CategoryModel> data) {
    _allCategory = data;
    _allCategory.sort((a, b) => a.hsnCode.compareTo(b.hsnCode));
    update();
  }

  set setAllCompanies(List<CompanyModel> data) {
    _allCompanies = data;
    _allCompanies.sort((a, b) => a.name.compareTo(b.name));
    update();
  }

  void getAllCustomers() {
    setAllCustomers = customerDB.getAllCustomer();
  }

  void getAllCatories() {
    setAllCategory = categoryDB.getAllCategory();
  }

  void getAllCompanies() {
    setAllCompanies = companyDB.getAllCompany();
  }

  set setStartDate(DateTime dateTime) {
    _startDate = dateTime;
    update();
  }

  set setAllCustomerCheck(bool val) {
    isAllCustomer = val;
    update();
  }

  set setAllHSNCode(bool val) {
    isAllHSNCode = val;
    update();
  }

  set setAllCompanyCheck(bool val) {
    isAllCompany = val;
    update();
  }

  set setEndDate(DateTime dateTime) {
    _endDate = dateTime;
    update();
  }

  Future<void> handleStatementGeneration(
    StatementEnum statementEnum,
    BuildContext context,
  ) async {
    final excelSheetData = GenerateExcelSheetData();
    switch (statementEnum) {
      case StatementEnum.Sales:
        if (salesStatementBy == SalesStatementBy.customer) {
          if (isAllCustomer) {
            final excel = await excelSheetData.generateSalesStatement(
              _startDate,
              _endDate,
            );
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExcelViewer(
                    excel: excel,
                    fileName: "Sales",
                  ),
                ),
              );
            }
          } else {
            if (_selectedCustomer != null) {
              final excel =
                  await excelSheetData.generateSalesStatementByCustomer(
                _startDate,
                _endDate,
                _selectedCustomer!,
              );
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExcelViewer(
                      excel: excel,
                      fileName: "Sales",
                    ),
                  ),
                );
              }
            } else {
              CustomUtilies.customFailureSnackBar(
                "Error",
                "Please Select Customer",
              );
            }
          }
        } else {
          // generateSalesByHSNCodeStatement
          if (isAllHSNCode) {
            final excel = await excelSheetData.generateSalesStatement(
              _startDate,
              _endDate,
            );
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExcelViewer(
                    excel: excel,
                    fileName: "Sales",
                  ),
                ),
              );
            }
          } else {
            if (_selectedCategory != null) {
              final excel =
                  await excelSheetData.generateSalesByHSNCodeStatement(
                _startDate,
                _endDate,
                (_selectedCategory?.hsnCode ?? '').toString(),
              );
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExcelViewer(
                      excel: excel,
                      fileName: "Sales",
                    ),
                  ),
                );
              }
            } else {
              CustomUtilies.customFailureSnackBar(
                "Error",
                "Please Select Customer",
              );
            }
          }
        }
        break;
      case StatementEnum.Stock:
        final excel = await excelSheetData.generateStockStatement();
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExcelViewer(
                excel: excel,
                fileName: "Stock",
              ),
            ),
          );
        }
        break;
      case StatementEnum.Receipt:
        final excel =
            await excelSheetData.generateReceiptStatement(_startDate, _endDate);
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExcelViewer(
                excel: excel,
                fileName: "Receipt",
              ),
            ),
          );
        }
        break;
      case StatementEnum.Payment:
        final excel =
            await excelSheetData.generatePaymentStatement(_startDate, _endDate);
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExcelViewer(
                excel: excel,
                fileName: "Payment",
              ),
            ),
          );
        }
        break;
      case StatementEnum.Purchase:
        if (isAllCompany) {
          final excel = await excelSheetData.generatePurchaseStatement(
            _startDate,
            _endDate,
            null,
          );
          if (context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExcelViewer(
                  excel: excel,
                  fileName: "Purchase",
                ),
              ),
            );
          }
        } else {
          if (_selectedCompany != null) {
            final excel = await excelSheetData.generatePurchaseStatement(
              _startDate,
              _endDate,
              _selectedCompany,
            );
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExcelViewer(
                    excel: excel,
                    fileName: "Puchase",
                  ),
                ),
              );
            }
          } else {
            CustomUtilies.customFailureSnackBar(
              "Error",
              "Please Select Company",
            );
          }
        }
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Not yet Implemented",
            ),
            backgroundColor: Colors.red,
          ),
        );
        break;
    }
  }

  SalesStatementBy _salesStatementBy = SalesStatementBy.customer;
  SalesStatementBy get salesStatementBy => _salesStatementBy;
  set salesStatementBy(SalesStatementBy value) {
    _salesStatementBy = value;
    update();
  }
}

enum SalesStatementBy {
  customer,
  hsnCode,
}
