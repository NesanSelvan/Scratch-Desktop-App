import 'dart:io';
import 'dart:typed_data';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/features/barcode_printer/cubit/barcode_printer_cubit.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

// ignore: avoid_classes_with_only_static_members
class PrinterUtility {
  static Printer? _getPrinterByName(List<Printer> printers, String name) {
    for (final item in printers) {
      if (item.name == name) {
        return item;
      }
    }
    return null;
  }

  static Printer? _getPrinterByUrl(List<Printer> printers, String url) {
    for (final item in printers) {
      if (item.url == url) {
        return item;
      }
    }
    return null;
  }

  static Printer? _getPrinterByModel(List<Printer> printers, String model) {
    for (final item in printers) {
      if (item.model == model) {
        return item;
      }
    }
    return null;
  }

  static Printer? _getPrinterByLocation(
    List<Printer> printers,
    String location,
  ) {
    for (final item in printers) {
      if (item.location == location) {
        return item;
      }
    }
    return null;
  }

  static Printer? _getSpecificPrinter(
    List<Printer> printers,
    String printerDataFromDB,
  ) {
    for (final item in printers) {
      if (item.name == printerDataFromDB ||
          item.model == printerDataFromDB ||
          item.url == printerDataFromDB ||
          item.location == printerDataFromDB) {
        return item;
      }
    }
    return null;
    // if (getPrinterByName(printers, printerDataFromDB) == null) {
    //   if (getPrinterByModel(printers, printerDataFromDB) == null) {
    //     if (getPrinterByUrl(printers, printerDataFromDB) == null) {
    //       if (getPrinterByLocation(printers, printerDataFromDB) == null) {
    //         return null;
    //       } else {
    //         return getPrinterByLocation(printers, printerDataFromDB);
    //       }
    //     } else {
    //       return getPrinterByUrl(printers, printerDataFromDB);
    //     }
    //   } else {
    //     return getPrinterByModel(printers, printerDataFromDB);
    //   }
    // } else {
    //   return getPrinterByName(printers, printerDataFromDB);
    // }
  }

  static Future thermalPrint(File file) async {
    final printersList = await Printing.listPrinters();
    final thermalDataFromDB = pathsDB.getThermalPrinterPath();
    if (thermalDataFromDB == null) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Please add Thermal Printer name in Path Section",
      );
      return;
    }
    final printer = _getSpecificPrinter(printersList, thermalDataFromDB);
    if (printer == null) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "$thermalDataFromDB Printer not found",
      );
      PDFGenerator.openPdf(file.path);
    } else {
      final val = await Printing.directPrintPdf(
        printer: printer,
        onLayout: (_) async => file.readAsBytes(),
      );
      if (val) {
        CustomUtilies.customSuccessSnackBar("Success", "Printed Successfully");
      } else {
        CustomUtilies.customFailureSnackBar(
          "Error",
          "Something went wrong in printing",
        );
      }
    }
  }

  static Future normalPrint(File file) async {
    final printersList = await Printing.listPrinters();
    final normalPrinterDataFromDB = pathsDB.getNormalPrinterPath();
    if (normalPrinterDataFromDB == null) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Please add Thermal Printer name in Path Section",
      );
      return;
    }
    final printer = _getSpecificPrinter(printersList, normalPrinterDataFromDB);
    if (printer == null) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "$normalPrinterDataFromDB Printer not found",
      );
      PDFGenerator.openPdf(file.path);
    } else {
      final val = await Printing.directPrintPdf(
        printer: printer,
        onLayout: (_) async => file.readAsBytes(),
      );
      if (val) {
        CustomUtilies.customSuccessSnackBar("Success", "Printed Successfully");
      } else {
        CustomUtilies.customFailureSnackBar(
          "Error",
          "Something went wrong in printing",
        );
      }
    }
  }

  static Future barcodePrint(
    List<BarcodeAndPrice> allData,
    BuildContext context,
  ) async {
    final printersList = await Printing.listPrinters();

    final barcodePrinterDataFromDB = pathsDB.getBarcodePrinterPath();
    if (barcodePrinterDataFromDB == null) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Please add Thermal Printer name in Path Section",
      );
      return;
    }
    final printer = _getSpecificPrinter(printersList, barcodePrinterDataFromDB);
    if (printer == null) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "$barcodePrinterDataFromDB Printer not found",
      );
      // PDFGenerator.openPdf(file.path);
    } else {
      final count = (allData.length / 4).ceil();
      // final height = barcodePdfFormat.height * count;
      // final pdfFormat = PdfPageFormat(barcodePdfFormat.width, height);
      for (var i = 0; i < count; i++) {
        int lastImg = (i + 1) * 4;
        if (allData.length < lastImg) {
          lastImg = allData.length;
        }
        int start = i;

        start = i * 4;

        final reqImg = allData.sublist(start, lastImg);

        final barcodePdfFormat = PdfPageFormat(
          2.5 * PdfPageFormat.cm * 4,
          2 * PdfPageFormat.cm * (allData.length % 4 + 1),
        );
        final pdfData = await PDFGenerator.generateBarcodePdf(
          barcodePdfFormat,
          reqImg,
        );

        final val = await Printing.directPrintPdf(
          printer: printer,
          onLayout: (format) {
            return pdfData;
          },
          format: barcodePdfFormat,
        );
        // final path = await PDFGenerator.getPDFFilePath(count: i);
        // final file = File(path);
        // try {
        //   file.writeAsBytesSync(pdfData);
        //   PDFGenerator.openPdf(file.path);
        // } catch (e) {
        //   rethrow;
        // }
      }

      // if (val) {
      //   CustomUtilies.customSuccessSnackBar("Success", "Printed Successfully");
      // } else {
      //   CustomUtilies.customFailureSnackBar(
      //     "Error",
      //     "Something went wrong in printing",
      //   );
      // }
      // }
      // final val = await PDFGenerator.generateBarcodePdf(
      //     PdfPageFormat(101.6 * PdfPageFormat.mm, 20 * PdfPageFormat.mm),
      //     allData);
      // final path = await PDFGenerator.getPDFFilePath();
      // final file = File(path);
      // try {
      //   file.writeAsBytesSync(pdfData!);
      //   PDFGenerator.openPdf(file.path);
      // } catch (e) {
      //   rethrow;
      // }
    }
  }

  static Future normalA5Print(File file) async {
    final printersList = await Printing.listPrinters();
    final normalPrinterDataFromDB = pathsDB.getNormalPrinterPath();
    if (normalPrinterDataFromDB == null) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Please add Thermal Printer name in Path Section",
      );
      return;
    }
    final printer = _getSpecificPrinter(printersList, normalPrinterDataFromDB);
    if (printer == null) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "$normalPrinterDataFromDB Printer not found",
      );
      PDFGenerator.openPdf(file.path);
    } else {
      final val = await Printing.directPrintPdf(
        format: PdfPageFormat.a5,
        printer: printer,
        onLayout: (_) async => file.readAsBytes(),
      );
      if (val) {
        CustomUtilies.customSuccessSnackBar("Success", "Printed Successfully");
      } else {
        CustomUtilies.customFailureSnackBar(
          "Error",
          "Something went wrong in printing",
        );
      }
    }
  }
}
