import 'dart:developer';
import 'dart:io';

import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/utils/backup/backup.dart';
import 'package:custom/ftn.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:validators/validators.dart';

import '../../controller/billing/sales/sales.dart';
import '../../core/constants/calculations/basic_cal.dart';
import '../../core/constants/calculations/bills/purchase.dart';
import '../../core/constants/calculations/bills/sales.dart';
import '../../enum/application.dart';
import '../../models/company/company.dart';
import '../../models/purchase/purchase.dart';

class GenerateExcelSheetData {
  void customExcelData(
      {required Sheet sheetObject,
      required String indexByString,
      required dynamic value,
      bool? isBold,
      Underline? underline,
      int? fontSize}) {
    final cell = sheetObject.cell(CellIndex.indexByString(indexByString));
    cell.value = value;
    cell.cellStyle = CellStyle(
      bold: isBold ?? false,
      underline: underline ?? Underline.None,
      fontSize: fontSize,
    );
  }

  Data excelData(
      {required Sheet sheetObject,
      required String indexByString,
      required dynamic value}) {
    final cell = sheetObject.cell(CellIndex.indexByString(indexByString));
    cell.value = value;
    return cell;
  }

  void header(
      {required Sheet sheetObject,
      required String indexByString,
      required dynamic value}) {
    final cell = excelData(
      sheetObject: sheetObject,
      indexByString: indexByString,
      value: value,
    );
    cell.cellStyle = CellStyle(bold: true);
  }

  static Future<String> getExcelFilePath(String fileName) async {
    final path = await getApplicationDocumentsDirectory();
    Directory("${path.path}\\${Application.appName}").createDirIfNotExists();
    final folderPath =
        Directory("${path.path}\\${Application.appName}\\$fileName\\");

    await folderPath.createDirIfNotExists();

    final date = getTodaysDate();
    return "${folderPath.path}/${fileName}_${date.day}-${date.month}_${date.hour}-${date.minute}.xlsx";
  }

  Future<void> generateStockStatement() async {
    print("EXCEL For Stock...");
    final basicCalculation = BasicCalculation();
    final excel = Excel.createExcel();
    final sheetObject = excel['Sheet1'];
    double totalNetTaxableValue = 0;
    double totalNetValue = 0;

    final cellStyle = CellStyle(
      backgroundColorHex: "#1AFF1A",
      fontFamily: getFontFamily(FontFamily.Calibri),
    );

    cellStyle.underline = Underline.Single;

    customExcelData(
      sheetObject: sheetObject,
      indexByString: "C1",
      value: Application.appName,
      fontSize: 14,
      isBold: true,
    );

    excelData(sheetObject: sheetObject, indexByString: "C2", value: "Vallior");
    customExcelData(
      sheetObject: sheetObject,
      indexByString: "C3",
      value: "Stock Report",
      underline: Underline.Single,
      isBold: true,
    );

    header(sheetObject: sheetObject, indexByString: "A5", value: "PCode");
    header(
      sheetObject: sheetObject,
      indexByString: "B5",
      value: "Product Name",
    );
    header(sheetObject: sheetObject, indexByString: "C5", value: "Tax");
    header(sheetObject: sheetObject, indexByString: "D5", value: "Qty");
    header(
      sheetObject: sheetObject,
      indexByString: "E5",
      value: "Net Taxable Value",
    );
    header(sheetObject: sheetObject, indexByString: "F5", value: "Net Value");

    final allCategory = categoryDB.getAllCategory();

    int currentPointer = 6;
    for (final category in allCategory) {
      final allProducts = productDB.getAllProductByCategoryId(category.id);
      header(
        sheetObject: sheetObject,
        indexByString: "A$currentPointer",
        value: category.category,
      );
      currentPointer++;
      for (final product in allProducts) {
        excelData(
          sheetObject: sheetObject,
          indexByString: "A$currentPointer",
          value: product.code,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "B$currentPointer",
          value: product.productName,
        );
        final stock = stocksDB.getStockModelByProductId(product.id);

        final stockQty = stock == null ? 0.0 : stock.qty;

        excelData(
          sheetObject: sheetObject,
          indexByString: "C$currentPointer",
          value: category.tax,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "D$currentPointer",
          value: stockQty,
        );
        final netTaxableAmount = product.sellingPrice * stockQty;
        excelData(
          sheetObject: sheetObject,
          indexByString: "E$currentPointer",
          value: netTaxableAmount,
        );
        totalNetTaxableValue += netTaxableAmount;

        final netValue = basicCalculation.calculateAmountWithTax(
          product,
          category,
          stockQty,
        );
        totalNetValue += netValue;
        excelData(
          sheetObject: sheetObject,
          indexByString: "F$currentPointer",
          value: netValue,
        );

        currentPointer++;
      }
      currentPointer++;
    }
    header(
      sheetObject: sheetObject,
      indexByString: "A $currentPointer",
      value: "Grand Total",
    );
    header(
      sheetObject: sheetObject,
      indexByString: "E$currentPointer",
      value: totalNetTaxableValue,
    );
    header(
      sheetObject: sheetObject,
      indexByString: "F$currentPointer",
      value: totalNetValue,
    );

    final datas = excel.encode();
    if (datas != null) {
      final path = await getExcelFilePath("stock");
      await saveToExcelFile(path, datas);
    }
  }

  Future<void> saveToExcelFile(String path, List<int> datas) async {
    File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(datas);
    try {
      final excelPath = pathsDB.getExcelPath()!;
      debugPrint('process start');
      // C://Program Files (x86)/Microsoft Office/root/Office16/EXCEL.EXE
      final processResult = await Process.run(excelPath, [path]);
      debugPrint("ProcessResult : $processResult");
    } catch (e) {
      print("Error : $e");
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Error in Exporting the excel $e",
      );
    }
  }

  Future<void> generateReceiptStatement(
      DateTime startDate, DateTime endDate) async {
    final receipts =
        receiptDB.getReceiptByDate(startDate, endDate).reversed.toList();
    final excel = Excel.createExcel();
    final sheetObject = excel['Sheet1'];
    double totalGivenAmount = 0;
    double totalAdvanceAmount = 0;

    customExcelData(
      sheetObject: sheetObject,
      indexByString: "C1",
      value: Application.appName,
      fontSize: 14,
      isBold: true,
    );

    excelData(sheetObject: sheetObject, indexByString: "C2", value: "Vallior");
    customExcelData(
      sheetObject: sheetObject,
      indexByString: "C3",
      value: "Receipt Report",
      underline: Underline.Single,
      isBold: true,
    );

    header(sheetObject: sheetObject, indexByString: "A5", value: "Date");
    header(sheetObject: sheetObject, indexByString: "B5", value: "Receipt No");
    header(
      sheetObject: sheetObject,
      indexByString: "C5",
      value: "Customer Name",
    );
    header(
      sheetObject: sheetObject,
      indexByString: "D5",
      value: "Given Amount",
    );
    header(
      sheetObject: sheetObject,
      indexByString: "E5",
      value: "Advance Amount",
    );
    header(
      sheetObject: sheetObject,
      indexByString: "F5",
      value: "Payment Method",
    );
    header(sheetObject: sheetObject, indexByString: "G5", value: "Payment ID");

    int currentPointer = 6;
    for (final receipt in receipts) {
      totalGivenAmount += receipt.givenAmount;
      totalAdvanceAmount += receipt.advanceAmount;
      excelData(
        sheetObject: sheetObject,
        indexByString: "A$currentPointer",
        value: getFormattedDate(receipt.createdAt),
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "B$currentPointer",
        value: receipt.receiptNo,
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "C$currentPointer",
        value: receipt.customerModel.name,
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "D$currentPointer",
        value: receipt.givenAmount,
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "E$currentPointer",
        value: receipt.advanceAmount,
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "F$currentPointer",
        value: receipt.paymentMethod,
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "G$currentPointer",
        value: receipt.paymentId,
      );
      currentPointer++;
    }
    header(
      sheetObject: sheetObject,
      indexByString: "A $currentPointer",
      value: "Grand Total",
    );
    header(
      sheetObject: sheetObject,
      indexByString: "D$currentPointer",
      value: totalGivenAmount,
    );
    header(
      sheetObject: sheetObject,
      indexByString: "E$currentPointer",
      value: totalAdvanceAmount,
    );

    final datas = excel.encode();
    if (datas != null) {
      final path = await getExcelFilePath("receipt");
      await saveToExcelFile(path, datas);
      // File(path)
      //   ..createSync(recursive: true)
      //   ..writeAsBytesSync(datas);
      // try {
      //   const excelPath =
      //       "C://Program Files (x86)/Microsoft Office/root/Office16/EXCEL.EXE";
      //   print('process start');
      //   Process.run(excelPath, [path]).then((ProcessResult results) {
      //     print(results.stdout);
      //   });
      // } catch (e) {
      //   print(e);
      // }
    }
  }

  Future<void> generatePaymentStatement(
      DateTime startDate, DateTime endDate) async {
    final payments =
        paymentDB.getPaymentByDate(startDate, endDate).reversed.toList();
    final excel = Excel.createExcel();
    final sheetObject = excel['Sheet1'];
    double totalGivenAmount = 0;

    customExcelData(
      sheetObject: sheetObject,
      indexByString: "C1",
      value: Application.appName,
      fontSize: 14,
      isBold: true,
    );

    excelData(sheetObject: sheetObject, indexByString: "C2", value: "Vallior");
    customExcelData(
      sheetObject: sheetObject,
      indexByString: "C3",
      value: "Payment Report",
      underline: Underline.Single,
      isBold: true,
    );

    header(sheetObject: sheetObject, indexByString: "A5", value: "Date");
    header(sheetObject: sheetObject, indexByString: "B5", value: "Payment No");
    header(
      sheetObject: sheetObject,
      indexByString: "C5",
      value: "Company Name",
    );
    header(
      sheetObject: sheetObject,
      indexByString: "D5",
      value: "Given Amount",
    );
    header(
      sheetObject: sheetObject,
      indexByString: "E5",
      value: "Purchase Bill No",
    );
    header(
      sheetObject: sheetObject,
      indexByString: "F5",
      value: "Payment Method",
    );
    header(sheetObject: sheetObject, indexByString: "G5", value: "Payment ID");

    int currentPointer = 6;
    for (final receipt in payments) {
      CompanyModel? companyModel;
      final _purchase = purchaseDB.getPurchaseModelById(receipt.purchaseId);
      if (receipt.purchaseModel == null) {
        if (_purchase != null) {
          companyModel = _purchase.companyModel;
        }
      } else {
        companyModel = receipt.purchaseModel!.companyModel;
      }
      String purchaseBillNo = "";
      if (receipt.purchaseModel == null) {
        if (_purchase != null) {
          purchaseBillNo = _purchase.billNo;
        } else {
          purchaseBillNo = "Purchase Bill might be deleted";
        }
      } else {
        purchaseBillNo = "${receipt.purchaseModel?.billNo}";
      }
      totalGivenAmount += receipt.givenAmount;
      excelData(
        sheetObject: sheetObject,
        indexByString: "A$currentPointer",
        value: getFormattedDate(receipt.createdAt),
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "B$currentPointer",
        value: receipt.paymentNo,
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "C$currentPointer",
        value: "${companyModel?.name}",
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "D$currentPointer",
        value: receipt.givenAmount,
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "E$currentPointer",
        value: purchaseBillNo,
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "F$currentPointer",
        value: receipt.paymentMethod,
      );
      excelData(
        sheetObject: sheetObject,
        indexByString: "G$currentPointer",
        value: receipt.paymentID,
      );
      currentPointer++;
    }
    header(
      sheetObject: sheetObject,
      indexByString: "A $currentPointer",
      value: "Grand Total",
    );
    header(
      sheetObject: sheetObject,
      indexByString: "D$currentPointer",
      value: totalGivenAmount,
    );

    final datas = excel.encode();
    if (datas != null) {
      final path = await getExcelFilePath("payment");
      await saveToExcelFile(path, datas);
      // File(path)
      //   ..createSync(recursive: true)
      //   ..writeAsBytesSync(datas);
      // try {
      //   const excelPath =
      //       "C://Program Files (x86)/Microsoft Office/root/Office16/EXCEL.EXE";
      //   print('process start');
      //   Process.run(excelPath, [path]).then((ProcessResult results) {
      //     print(results.stdout);
      //   });
      // } catch (e) {
      //   print(e);
      // }
    }
  }

  Future<void> generateSalesStatement(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final bills = salesDB.getBillByDate(startDate, endDate).reversed.toList();
    log("Sales Statement Count ${bills.length}");
    final excel = Excel.createExcel();
    final sheetObject = excel['Sheet1'];

    final cellStyle = CellStyle(
      backgroundColorHex: "#1AFF1A",
      fontFamily: getFontFamily(FontFamily.Calibri),
    );

    cellStyle.underline = Underline.Single;

    customExcelData(
      sheetObject: sheetObject,
      indexByString: "D1",
      value: Application.appName,
      fontSize: 14,
      isBold: true,
    );

    excelData(sheetObject: sheetObject, indexByString: "D2", value: "Vallior");
    customExcelData(
      sheetObject: sheetObject,
      indexByString: "D3",
      value: "Sales Report",
      underline: Underline.Single,
      isBold: true,
    );

    excelData(sheetObject: sheetObject, indexByString: "A5", value: "From");
    excelData(
      sheetObject: sheetObject,
      indexByString: "B5",
      value: getFormattedDate(startDate),
    );

    excelData(sheetObject: sheetObject, indexByString: "D5", value: "TO");
    excelData(
      sheetObject: sheetObject,
      indexByString: "E5",
      value: getFormattedDate(endDate),
    );

    header(sheetObject: sheetObject, indexByString: "A7", value: "GSTIN No");
    header(sheetObject: sheetObject, indexByString: "B7", value: "Invoice No");
    header(sheetObject: sheetObject, indexByString: "C7", value: "Date");
    header(sheetObject: sheetObject, indexByString: "D7", value: "Party Name");
    header(
      sheetObject: sheetObject,
      indexByString: "E7",
      value: "Invoice Amount",
    );
    header(sheetObject: sheetObject, indexByString: "F7", value: "Tax");
    header(
      sheetObject: sheetObject,
      indexByString: "G7",
      value: "Taxable Value",
    );

    int currentPoint = 8;

    debugPrint("Bills Length: ${bills.length}");

    double totalInvoiceAmount = 0;
    String previousBillNo = "";
    double totalTaxableValue = 0;

    for (var i = 0; i < bills.length; i++) {
      final taxCalModel = SalesCalculation.getTaxCalModel(bills[i]);
      for (final taxData in taxCalModel) {
        excelData(
          sheetObject: sheetObject,
          indexByString: "B$currentPoint",
          value: bills[i].billNo,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "A$currentPoint",
          value: bills[i].customerModel.gstin == ""
              ? "-"
              : bills[i].customerModel.gstin!,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "C$currentPoint",
          value: bills[i].dateTime == null
              ? ""
              : getFormattedDate(bills[i].dateTime),
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "D$currentPoint",
          value: bills[i].customerModel.name,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "E$currentPoint",
          value: bills[i].price,
        );
        if (previousBillNo != bills[i].billNo) {
          totalInvoiceAmount += bills[i].price;
        }
        previousBillNo = bills[i].billNo;
        excelData(
          sheetObject: sheetObject,
          indexByString: "F$currentPoint",
          value: taxData.rate,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "G$currentPoint",
          value: taxData.taxableVal,
        );
        totalTaxableValue += taxData.taxableVal;
        currentPoint++;
      }
    }

    header(
      sheetObject: sheetObject,
      indexByString: "A${currentPoint + 1}",
      value: "Grand Total",
    );

    header(
      sheetObject: sheetObject,
      indexByString: "E${currentPoint + 1}",
      value: totalInvoiceAmount,
    );

    header(
      sheetObject: sheetObject,
      indexByString: "G${currentPoint + 1}",
      value: totalTaxableValue,
    );

    final invoiceTotalCell =
        sheetObject.cell(CellIndex.indexByString("E${currentPoint + 1}"));
    invoiceTotalCell.value = totalInvoiceAmount;
    invoiceTotalCell.cellStyle = CellStyle(bold: true);

    final taxableTotalCell =
        sheetObject.cell(CellIndex.indexByString("G${currentPoint + 1}"));
    taxableTotalCell.value = totalTaxableValue;
    taxableTotalCell.cellStyle = CellStyle(bold: true);

    final datas = excel.encode();
    if (datas != null) {
      final path = await getExcelFilePath("sales");
      await saveToExcelFile(path, datas);
    }
  }

  Future<void> generatePurchaseStatement(
      DateTime startDate, DateTime endDate, CompanyModel? companyModel) async {
    List<PurchaseModel> bills =
        purchaseDB.getBillByDate(startDate, endDate).reversed.toList();
    if (companyModel != null) {
      bills.clear();
      bills = purchaseDB
          .getBillByDateAndCompany(startDate, endDate, companyModel)
          .reversed
          .toList();
    }
    final excel = Excel.createExcel();
    final sheetObject = excel['Sheet1'];

    final cellStyle = CellStyle(
      backgroundColorHex: "#1AFF1A",
      fontFamily: getFontFamily(FontFamily.Calibri),
    );

    cellStyle.underline = Underline.Single;

    customExcelData(
      sheetObject: sheetObject,
      indexByString: "D1",
      value: Application.appName,
      fontSize: 14,
      isBold: true,
    );

    excelData(sheetObject: sheetObject, indexByString: "D2", value: "Vallior");
    customExcelData(
      sheetObject: sheetObject,
      indexByString: "D3",
      value: "Purchase Report",
      underline: Underline.Single,
      isBold: true,
    );

    excelData(sheetObject: sheetObject, indexByString: "A5", value: "From");
    excelData(
      sheetObject: sheetObject,
      indexByString: "B5",
      value: getFormattedDate(startDate),
    );

    excelData(sheetObject: sheetObject, indexByString: "D5", value: "TO");
    excelData(
      sheetObject: sheetObject,
      indexByString: "E5",
      value: getFormattedDate(endDate),
    );

    header(sheetObject: sheetObject, indexByString: "A7", value: "GSTIN No");
    header(sheetObject: sheetObject, indexByString: "B7", value: "Invoice No");
    header(sheetObject: sheetObject, indexByString: "C7", value: "Date");
    header(sheetObject: sheetObject, indexByString: "D7", value: "Party Name");
    header(
      sheetObject: sheetObject,
      indexByString: "E7",
      value: "Invoice Amount",
    );
    header(sheetObject: sheetObject, indexByString: "F7", value: "Tax");
    header(
      sheetObject: sheetObject,
      indexByString: "G7",
      value: "Taxable Value",
    );

    int currentPoint = 8;

    debugPrint("Bills Length: ${bills.length}");

    double totalInvoiceAmount = 0;
    double totalTaxableValue = 0;
    String previousBillNo = "";

    for (var i = 0; i < bills.length; i++) {
      final taxCalModel = PurchaseCalculation.getTaxCalModel(bills[i]);
      for (final taxData in taxCalModel) {
        excelData(
          sheetObject: sheetObject,
          indexByString: "B$currentPoint",
          value: bills[i].billNo,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "A$currentPoint",
          value: bills[i].companyModel.gstin == ""
              ? "-"
              : bills[i].companyModel.gstin!,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "C$currentPoint",
          value: bills[i].dateTime == null
              ? ""
              : getFormattedDate(bills[i].dateTime),
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "D$currentPoint",
          value: bills[i].companyModel.name,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "E$currentPoint",
          value: bills[i].grandTotal,
        );
        if (previousBillNo != bills[i].billNo) {
          totalInvoiceAmount += bills[i].grandTotal;
        }
        previousBillNo = bills[i].billNo;
        excelData(
          sheetObject: sheetObject,
          indexByString: "F$currentPoint",
          value: taxData.rate,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "G$currentPoint",
          value: taxData.taxableVal,
        );
        totalTaxableValue += taxData.taxableVal;
        currentPoint++;
      }
    }

    header(
      sheetObject: sheetObject,
      indexByString: "A${currentPoint + 1}",
      value: "Grand Total",
    );

    header(
      sheetObject: sheetObject,
      indexByString: "E${currentPoint + 1}",
      value: totalInvoiceAmount,
    );

    header(
      sheetObject: sheetObject,
      indexByString: "G${currentPoint + 1}",
      value: totalTaxableValue,
    );

    final invoiceTotalCell =
        sheetObject.cell(CellIndex.indexByString("E${currentPoint + 1}"));
    invoiceTotalCell.value = totalInvoiceAmount;
    invoiceTotalCell.cellStyle = CellStyle(bold: true);

    final taxableTotalCell =
        sheetObject.cell(CellIndex.indexByString("G${currentPoint + 1}"));
    taxableTotalCell.value = totalTaxableValue;
    taxableTotalCell.cellStyle = CellStyle(bold: true);

    final datas = excel.encode();
    if (datas != null) {
      final path = await getExcelFilePath("purchase");
      await saveToExcelFile(path, datas);
      // File(path)
      //   ..createSync(recursive: true)
      //   ..writeAsBytesSync(datas);
      // try {
      //   const excelPath =
      //       "C://Program Files (x86)/Microsoft Office/root/Office16/EXCEL.EXE";
      //   print('process start');
      //   Process.run(excelPath, [path]).then((ProcessResult results) {
      //     print(results.stdout);
      //   });
      // } catch (e) {
      //   print(e);
      // }
    }
  }

  Future<void> generateSalesStatementByCustomer(
      DateTime startDate, DateTime endDate, CustomerModel customerModel) async {
    final bills = salesDB
        .getBillByDateAndCustomer(startDate, endDate, customerModel)
        .reversed
        .toList();
    final excel = Excel.createExcel();
    final sheetObject = excel['Sheet1'];

    final cellStyle = CellStyle(
      backgroundColorHex: "#1AFF1A",
      fontFamily: getFontFamily(FontFamily.Calibri),
    );

    cellStyle.underline = Underline.Single;

    customExcelData(
      sheetObject: sheetObject,
      indexByString: "D1",
      value: Application.appName,
      fontSize: 14,
      isBold: true,
    );

    excelData(sheetObject: sheetObject, indexByString: "D2", value: "Vallior");
    customExcelData(
      sheetObject: sheetObject,
      indexByString: "D3",
      value: "Sales Report",
      underline: Underline.Single,
      isBold: true,
    );

    excelData(sheetObject: sheetObject, indexByString: "A5", value: "From");
    excelData(
      sheetObject: sheetObject,
      indexByString: "B5",
      value: getFormattedDate(startDate),
    );

    excelData(sheetObject: sheetObject, indexByString: "D5", value: "TO");
    excelData(
      sheetObject: sheetObject,
      indexByString: "E5",
      value: getFormattedDate(endDate),
    );

    header(sheetObject: sheetObject, indexByString: "A7", value: "GSTIN No");
    header(sheetObject: sheetObject, indexByString: "B7", value: "Invoice No");
    header(sheetObject: sheetObject, indexByString: "C7", value: "Date");
    header(sheetObject: sheetObject, indexByString: "D7", value: "Party Name");
    header(
      sheetObject: sheetObject,
      indexByString: "E7",
      value: "Invoice Amount",
    );
    header(sheetObject: sheetObject, indexByString: "F7", value: "Tax");
    header(
      sheetObject: sheetObject,
      indexByString: "G7",
      value: "Taxable Value",
    );

    int currentPoint = 8;

    debugPrint("Bills Length: ${bills.length}");

    double totalInvoiceAmount = 0;
    double totalTaxableValue = 0;
    String previousBillNo = "";

    for (var i = 0; i < bills.length; i++) {
      final taxCalModel = SalesCalculation.getTaxCalModel(bills[i]);
      for (final taxData in taxCalModel) {
        excelData(
          sheetObject: sheetObject,
          indexByString: "B$currentPoint",
          value: bills[i].billNo,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "A$currentPoint",
          value: bills[i].customerModel.gstin == ""
              ? "-"
              : bills[i].customerModel.gstin!,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "C$currentPoint",
          value: bills[i].dateTime == null
              ? ""
              : getFormattedDate(bills[i].dateTime),
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "D$currentPoint",
          value: bills[i].customerModel.name,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "E$currentPoint",
          value: bills[i].price,
        );
        if (previousBillNo != bills[i].billNo) {
          totalInvoiceAmount += bills[i].price;
        }
        previousBillNo = bills[i].billNo;
        excelData(
          sheetObject: sheetObject,
          indexByString: "F$currentPoint",
          value: taxData.rate,
        );
        excelData(
          sheetObject: sheetObject,
          indexByString: "G$currentPoint",
          value: taxData.taxableVal,
        );
        totalTaxableValue += taxData.taxableVal;
        currentPoint++;
      }
    }

    header(
      sheetObject: sheetObject,
      indexByString: "A${currentPoint + 1}",
      value: "Grand Total",
    );

    header(
      sheetObject: sheetObject,
      indexByString: "E${currentPoint + 1}",
      value: totalInvoiceAmount,
    );

    header(
      sheetObject: sheetObject,
      indexByString: "G${currentPoint + 1}",
      value: totalTaxableValue,
    );

    final invoiceTotalCell =
        sheetObject.cell(CellIndex.indexByString("E${currentPoint + 1}"));
    invoiceTotalCell.value = totalInvoiceAmount;
    invoiceTotalCell.cellStyle = CellStyle(bold: true);

    final taxableTotalCell =
        sheetObject.cell(CellIndex.indexByString("G${currentPoint + 1}"));
    taxableTotalCell.value = totalTaxableValue;
    taxableTotalCell.cellStyle = CellStyle(bold: true);

    final datas = excel.encode();
    if (datas != null) {
      final path = await getExcelFilePath("sales");
      await saveToExcelFile(path, datas);
      // File(path)
      //   ..createSync(recursive: true)
      //   ..writeAsBytesSync(datas);
      // try {
      //   const excelPath =
      //       "C://Program Files (x86)/Microsoft Office/root/Office16/EXCEL.EXE";
      //   print('process start');
      //   Process.run(excelPath, [path]).then((ProcessResult results) {
      //     print(results.stdout);
      //   });
      // } catch (e) {
      //   print(e);
      // }
    }
  }
}
