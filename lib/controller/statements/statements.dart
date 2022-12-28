import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/enum/statement.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/utils/datetime/datetime.dart';
import 'package:annai_store/utils/excel/statement.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatementController extends GetxController {
  DateTime _startDate = DateTimeUtility.getBillStartDate();
  DateTime _endDate = DateTimeUtility.getBillEndDate();
  bool isAllCustomer = true;
  bool isAllCompany = true;
  StatementType statementType = StatementType.Excel;

  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  List<CustomerModel> _allCustomers = [];
  List<CustomerModel> get allCustomers => _allCustomers;
  CustomerModel? _selectedCustomer;
  CustomerModel? get selectedCustomer => _selectedCustomer;

  List<CompanyModel> _allCompanies = [];
  List<CompanyModel> get allCompanies => _allCompanies;
  CompanyModel? _selectedCompany;
  CompanyModel? get selectedCompany => _selectedCompany;

  set setSelectedCustomerModel(CustomerModel value) {
    _selectedCustomer = value;
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

  set setAllCompanies(List<CompanyModel> data) {
    _allCompanies = data;
    _allCompanies.sort((a, b) => a.name.compareTo(b.name));
    update();
  }

  void getAllCustomers() {
    setAllCustomers = customerDB.getAllCustomer();
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
        if (isAllCustomer) {
          await excelSheetData.generateSalesStatement(_startDate, _endDate);
        } else {
          if (_selectedCustomer != null) {
            await excelSheetData.generateSalesStatementByCustomer(
              _startDate,
              _endDate,
              _selectedCustomer!,
            );
          } else {
            CustomUtilies.customFailureSnackBar(
              "Error",
              "Please Select Customer",
            );
          }
        }
        break;
      case StatementEnum.Stock:
        await excelSheetData.generateStockStatement();
        break;
      case StatementEnum.Receipt:
        await excelSheetData.generateReceiptStatement(_startDate, _endDate);
        break;
      case StatementEnum.Payment:
        await excelSheetData.generatePaymentStatement(_startDate, _endDate);
        break;
      case StatementEnum.Purchase:
        if (isAllCompany) {
          await excelSheetData.generatePurchaseStatement(
            _startDate,
            _endDate,
            null,
          );
        } else {
          if (_selectedCompany != null) {
            await excelSheetData.generatePurchaseStatement(
              _startDate,
              _endDate,
              _selectedCompany,
            );
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
}
