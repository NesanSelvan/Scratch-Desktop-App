import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/enum/statement.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/utils/datetime/datetime.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
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

  Future<void> handleCustomerReportStatementGeneration(
    BuildContext context,
  ) async {
    final pdfGenerator = PDFGenerator();
    if (_selectedCustomer != null) {
      final path = await pdfGenerator.generateCustomerReport(
        startDate,
        endDate,
        _selectedCustomer!,
      );
      PDFGenerator.openPdf(path);
    }
  }
}
