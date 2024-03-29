import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/core/constants/calculations/bills/estimate.dart';
import 'package:annai_store/core/constants/calculations/bills/order.dart';
import 'package:annai_store/core/constants/calculations/bills/quotation.dart';
import 'package:annai_store/core/constants/calculations/bills/sales.dart';
import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/core/constants/calculations/report.dart';
import 'package:annai_store/enum/application.dart';
import 'package:annai_store/enum/operation.dart';
import 'package:annai_store/enum/payments/payment.dart';
import 'package:annai_store/extensions/string.dart';
import 'package:annai_store/extensions/type.dart';
import 'package:annai_store/features/barcode_printer/cubit/barcode_printer_cubit.dart';
import 'package:annai_store/features/viewer/pdf/screens/pdf_viewer.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/estimate/estimate.dart';
import 'package:annai_store/models/orders/order.dart';
import 'package:annai_store/models/payment/payment.dart';
import 'package:annai_store/models/quotations/quotations.dart';
import 'package:annai_store/models/receipts/receipt.dart';
import 'package:annai_store/models/report/customer.dart';
import 'package:annai_store/models/sewing_service/sewing_service.dart';
import 'package:annai_store/models/tax_cal/tax_cal.dart';
import 'package:annai_store/models/voucher/voucher.dart';
import 'package:annai_store/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:validators/validators.dart';

// ignore: avoid_classes_with_only_static_members
class PDFGenerator {
  static const PdfPageFormat getA4Size =
      PdfPageFormat(20.5 * PdfPageFormat.cm, 29 * PdfPageFormat.cm);

  static const PdfPageFormat getA5Size =
      PdfPageFormat(14.5 * PdfPageFormat.cm, 20.5 * PdfPageFormat.cm);

  static pw.Border getBorder() {
    return const pw.Border(
      left: pw.BorderSide(width: 0.8),
      right: pw.BorderSide(width: 0.8),
      top: pw.BorderSide(width: 0.8),
      bottom: pw.BorderSide(width: 0.8),
    );
  }

  static pw.Container tableTopRightContainer(String bText, String text) {
    return pw.Container(
      width: (getA4Size.width / 2 - 5) / 2,
      height: 40,
      padding: const pw.EdgeInsets.all(3),
      decoration: pw.BoxDecoration(border: getBorder()),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          normalText(text),
          boldText(bText),
        ],
      ),
    );
  }

  static pw.Text bigText(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
    );
  }

  static pw.Text boldText(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
    );
  }

  static pw.Text boldSmallText(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
    );
  }

  static pw.Text normalText(String text) {
    return pw.Text(text, style: const pw.TextStyle(fontSize: 11));
  }

  static pw.Text smallText(String text) {
    return pw.Text(text, style: const pw.TextStyle(fontSize: 9));
  }

  static pw.Text vSmallText(String text) {
    return pw.Text(text, style: const pw.TextStyle(fontSize: 8));
  }

  static pw.Text vvSmallText(String text) {
    return pw.Text(text, style: const pw.TextStyle(fontSize: 6));
  }

  static pw.Text smallBoldText(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
    );
  }

  static pw.Container tableCellContText(String text) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(5),
      decoration: pw.BoxDecoration(border: pw.Border.all()),
      child: normalText(text),
    );
  }

  static pw.Container tableCellWithContText(
    String text,
    double width,
    bool isRateAmount,
  ) {
    return pw.Container(
      width: width,
      height: 40,
      decoration: pw.BoxDecoration(border: pw.Border.all()),
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Container(
            padding: const pw.EdgeInsets.all(5),
            alignment: pw.Alignment.center,
            width: width,
            child: normalText(text),
          ),
          if (isRateAmount)
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Container(
                  width: width / 2,
                  alignment: pw.Alignment.center,
                  padding: const pw.EdgeInsets.all(2),
                  decoration: pw.BoxDecoration(border: pw.Border.all()),
                  child: normalText("Rate"),
                ),
                pw.Container(
                  width: width / 2,
                  alignment: pw.Alignment.center,
                  padding: const pw.EdgeInsets.all(2),
                  decoration: pw.BoxDecoration(border: pw.Border.all()),
                  child: normalText("Amount"),
                ),
              ],
            )
          else
            pw.Container(),
        ],
      ),
    );
  }

  static pw.Widget buildBankAndSignature(double width, String? upiString) {
    return pw.Row(
      children: [
        bankContainer(
          width: width * 0.3,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              boldText(Application.bankDetails.bankName),
              normalText("Acc No: ${Application.bankDetails.accountNo}"),
              normalText("IFSC Code: ${Application.bankDetails.ifscCode}"),
              normalText("Branch: ${Application.bankDetails.branch}"),
            ],
          ),
        ),
        pw.Container(
          height: 80,
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              left: pw.BorderSide(width: 0.8),
              bottom: pw.BorderSide(width: 0.8),
            ),
          ),
          width: width * 0.1,
        ),
        pw.Container(
          width: width * 0.25,
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(width: 0.8),
            ),
          ),
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              getUPIBarcodeImage(upiString) ?? pw.Container(),
              vSmallText("Scan the barcode to pay"),
            ],
          ),
          height: 80,
        ),
        pw.Container(
          height: 80,
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(width: 0.8),
            ),
          ),
          width: width * 0.1,
        ),
        pw.Container(
          width: width * 0.25,
          height: 80,
          alignment: pw.Alignment.center,
          decoration: pw.BoxDecoration(border: getBorder()),
          padding: const pw.EdgeInsets.symmetric(vertical: 2),
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              boldText("For ${Application.appName}"),
              normalText("Authorized Signature"),
            ],
          ),
        ),
      ],
    );
  }

  static pw.Container bankContainer({
    required double width,
    double? height,
    required pw.Widget child,
    bool? isBottomBorder = true,
  }) {
    return pw.Container(
      width: width,
      height: height ?? 80,
      alignment: pw.Alignment.centerLeft,
      decoration: pw.BoxDecoration(
        border: pw.Border(
          left: const pw.BorderSide(width: 0.8),
          // right: pw.BorderSide(width: 0.8),
          top: const pw.BorderSide(width: 0.8),
          bottom: isBottomBorder!
              ? const pw.BorderSide(width: 0.8)
              : pw.BorderSide.none,
        ),
      ),
      padding: const pw.EdgeInsets.only(left: 10),
      child: child,
    );
  }

  static Future<String> getPDFFilePath({int? count}) async {
    final path = await getApplicationDocumentsDirectory();
    return "${path.path}/example_${count ?? ''}.pdf";
  }

  static pw.Container taxCalBodyData({
    bool isHalf = false,
    required pw.Widget child,
    required double width,
    bool dynamicHeight = false,
  }) {
    return pw.Container(
      width: isHalf ? width / 2 : width,
      alignment: pw.Alignment.centerLeft,
      padding: const pw.EdgeInsets.all(5),
      height: dynamicHeight ? null : 70,
      decoration: pw.BoxDecoration(border: getBorder()),
      child: child,
    );
  }

  static pw.Container taxCalFooterData({
    bool isHalf = false,
    bool isRight = false,
    required pw.Widget child,
    required double width,
  }) {
    return pw.Container(
      width: isHalf ? width / 2 : width,
      height: 15,
      alignment: isRight ? pw.Alignment.centerRight : pw.Alignment.centerLeft,
      padding: const pw.EdgeInsets.all(2),
      decoration: pw.BoxDecoration(border: getBorder()),
      child: child,
    );
  }

  static pw.Container customizedTableData({
    required double width,
    required pw.Widget child,
    double? height,
    bool? isInnerTextCenter = false,
    pw.Widget? insideText,
  }) {
    return pw.Container(
      width: width,
      height: height ?? 225,
      padding: const pw.EdgeInsets.only(top: 5),
      decoration: pw.BoxDecoration(border: getBorder()),
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          child,
          pw.Container(
            width: width,
            height: 20,
            alignment: isInnerTextCenter!
                ? pw.Alignment.center
                : pw.Alignment.centerRight,
            padding: const pw.EdgeInsets.only(right: 2),
            decoration: pw.BoxDecoration(border: getBorder()),
            child: insideText,
          ),
        ],
      ),
    );
  }

  static Future<String> generateBarcode(
    List<Uint8List> imageBytes,
    double price, {
    bool isPotrait = false,
  }) async {
    final pdf = pw.Document(deflate: zlib.encode);

    final List<pw.MemoryImage> memImages = [];
    for (final element in imageBytes) {
      memImages.add(
        pw.MemoryImage(
          element,
        ),
      );
    }
    // final memImg = pw.MemoryImage(
    //   imageBytes,
    // );
    const width = 2.55 * PdfPageFormat.cm;
    const height = 2 * PdfPageFormat.cm;
    final pageFormat = PdfPageFormat(
      isPotrait ? height : width,
      !isPotrait ? height : width,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: pageFormat,
        margin: const pw.EdgeInsets.all(2),
        orientation: pw.PageOrientation.landscape,
        build: (pw.Context context) {
          return pw.Row(
            children: memImages
                .map(
                  (e) => pw.Container(
                    width: width,
                    margin: const pw.EdgeInsets.symmetric(horizontal: 2),
                    child: pw.Column(
                      children: [
                        pw.Container(
                          color: PdfColor.fromHex("#000000"),
                          margin: const pw.EdgeInsets.only(top: 4, bottom: 4),
                          child: pw.Container(
                            alignment: pw.Alignment.center,
                            child: pw.Text(
                              "Pairav Products",
                              style: pw.TextStyle(
                                fontSize: 6,
                                color: PdfColor.fromHex("#FFFFFF"),
                              ),
                            ),
                          ),
                        ),
                        pw.Container(
                          child: pw.Image(e),
                          width: 100,
                          height: 50,
                        ),
                        // pw.Container(child: pw.Image(memImg), width: 100, height: 50),
                        pw.Text(
                          "Rs. $price",
                          style: pw.TextStyle(
                            fontSize: 7,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          );
          // pw.Image(image)
        },
      ),
    );

    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(await pdf.save());
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateQuotationBuffer(
    QuotationModel billModel,
  ) async {
    final taxCalModel =
        QuoatationCalculations.getQuotationTaxCalModel(billModel);
    final pdf = pw.Document();

    final serialNoWidth = getA4Size.width * 0.05;
    final descriptionWidth = getA4Size.width * 0.365;
    final hsnWidth = getA4Size.width * 0.089;
    final qtyWidth = getA4Size.width * 0.089;
    final rateWidth = getA4Size.width * 0.089;
    final priceWidth = getA4Size.width * 0.099;
    final discountWidth = getA4Size.width * 0.079;
    final amountWidth = getA4Size.width * 0.089;
    final roundOff = getRoundOff(
      getGrandTotal(
        billModel.productList,
        billModel.customerModel,
      ),
    );

    final grandTotal =
        getGrandTotal(billModel.productList, billModel.customerModel);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: getA4Size,
        margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        mainAxisAlignment: pw.MainAxisAlignment.center,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Container(
              margin: const pw.EdgeInsets.only(top: 2, bottom: 4),
              child: pw.Container(
                alignment: pw.Alignment.center,
                child: smallText("Quotation".toUpperCase()),
              ),
            ),
            pw.Container(
              width: getA4Size.width * 0.95,
              height: getA4Size.height * 0.885 - 10,
              decoration: const pw.BoxDecoration(
                border: pw.Border(
                  left: pw.BorderSide(width: 0.8),
                  right: pw.BorderSide(width: 0.8),
                  top: pw.BorderSide(width: 0.8),
                  bottom: pw.BorderSide(width: 0.8),
                ),
              ),
              alignment: pw.Alignment.center,
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      if (Application.gstinNo != '')
                        pw.Container(
                          child: normalText("GSTIN : ${Application.gstinNo}"),
                          padding: const pw.EdgeInsets.all(8),
                        ),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Column(
                          children: [
                            normalText("Mobile No.: 9488327699"),
                            normalText("Email: annai.charlinf@gmail.com"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        bigText(Application.appName),
                        normalText(Application.address.split(r'\').first),
                        pw.SizedBox(height: 23),
                      ],
                    ),
                  ),
                  pw.Divider(height: 2),
                  pw.Row(
                    children: [
                      pw.Container(
                        width: getA4Size.width * 0.6,
                        alignment: pw.Alignment.centerLeft,
                        padding: const pw.EdgeInsets.only(left: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            normalText(
                              "Buyer : ${billModel.customerModel.name}",
                            ),
                            normalText(billModel.customerModel.address),
                            normalText(
                              "GSTIN : ${billModel.customerModel.gstin}",
                            ),
                            normalText(
                              "Mobile No : ${billModel.customerModel.mobileNo}",
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        width: 1,
                        height: 60,
                        color: PdfColor.fromHex("#000000"),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        child: normalText(
                          "Date : ${getFormattedDate(billModel.dateTime)}",
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(height: 2),
                  pw.Column(
                    children: [
                      pw.Row(
                        children: [
                          pw.Container(
                            width: serialNoWidth,
                            child: tableCellContText("No."),
                          ),
                          pw.Container(
                            width: descriptionWidth,
                            child: tableCellContText("Description"),
                          ),
                          pw.Container(
                            width: hsnWidth,
                            child: tableCellContText("HSN"),
                          ),
                          pw.Container(
                            width: qtyWidth,
                            child: tableCellContText("Qty"),
                          ),
                          pw.Container(
                            width: rateWidth,
                            child: tableCellContText("Rate"),
                          ),
                          pw.Container(
                            width: priceWidth,
                            child: tableCellContText("Price"),
                          ),
                          pw.Container(
                            width: discountWidth,
                            child: tableCellContText("Dis"),
                          ),
                          pw.Container(
                            width: amountWidth,
                            child: tableCellContText("Amount"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      customizedTableData(
                        width: serialNoWidth,
                        height: 265,
                        child: pw.Column(
                          children: billModel.productList
                              .map(
                                (e) => vSmallText(
                                  "${billModel.productList.indexOf(e) + 1}",
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      customizedTableData(
                        width: descriptionWidth,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 5, left: 5),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              ...billModel.productList.map(
                                (e) => vSmallText(e.productModel!.productName),
                              ),
                              pw.SizedBox(height: 30),
                              if (billModel.customerModel.state == "Tamil Nadu")
                                pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Column(
                                    children: [
                                      smallBoldText("Output CGST"),
                                      smallBoldText("Output SGST"),
                                    ],
                                  ),
                                )
                              else
                                pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Column(
                                    children: [smallBoldText("Output IGST")],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        insideText: boldText("Total"),
                      ),
                      customizedTableData(
                        height: 265,
                        width: hsnWidth,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: billModel.productList
                                .map(
                                  (e) =>
                                      vSmallText("${e.categoryModel!.hsnCode}"),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: qtyWidth,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: billModel.productList
                                .map((e) => vSmallText("${e.qty}"))
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: rateWidth,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: billModel.productList
                                .map(
                                  (e) => vSmallText(
                                    "${e.rate}",
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: priceWidth,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: billModel.productList
                                .map(
                                  (e) => vSmallText(
                                    SalesCalculation.getSalesPrice(
                                      e,
                                      billModel.customerModel,
                                    ).toStringAsFixed(2),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: discountWidth,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: billModel.productList
                                .map(
                                  (e) => vSmallText(
                                    "${getDiscountAmount(e, billModel.customerModel)}",
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: amountWidth,
                        height: 265,
                        isInnerTextCenter: true,
                        insideText: smallBoldText(
                          grandTotal.round().toStringAsFixed(2),
                        ),
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              ...billModel.productList.map(
                                (e) => vSmallText(
                                  getAmount(e, billModel.customerModel)
                                      .toStringAsFixed(2),
                                ),
                              ),
                              pw.Divider(),
                              //
                              vSmallText(
                                calculateAmountWithoutTax(
                                  billModel.productList,
                                  billModel.customerModel,
                                ).toStringAsFixed(2),
                              ),
                              pw.SizedBox(height: 2),
                              if (billModel.customerModel.state == "Tamil Nadu")
                                pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.end,
                                  children: [
                                    vSmallText(
                                      (getTotalTaxableAndTotalTaxValue(
                                                taxCalModel,
                                              )[1] /
                                              2)
                                          .toStringAsFixed(2),
                                    ),
                                    vSmallText(
                                      (getTotalTaxableAndTotalTaxValue(
                                                taxCalModel,
                                              )[1] /
                                              2)
                                          .toStringAsFixed(2),
                                    ),
                                  ],
                                )
                              else
                                vSmallText(
                                  getTotalTaxableAndTotalTaxValue(
                                    taxCalModel,
                                  )[1]
                                      .toStringAsFixed(2),
                                ),
                              vSmallText(
                                "${roundOff.operation == OperationEnum.Add ? ' ' : '- '} ${roundOff.roundOffAmount.toStringAsFixed(2)}",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    width: getA4Size.width,
                    decoration: pw.BoxDecoration(
                      border: getBorder(),
                    ),
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        normalText("Amount Chargeable (in words)"),
                        boldText(
                          "INR ${NumberToWord().convert('en-in', grandTotal.round())} ",
                        ),
                      ],
                    ),
                  ),
                  pw.Column(
                    children: [
                      pw.Column(
                        children: [
                          pw.Row(
                            children: [
                              tableCellWithContText(
                                "HSN Code",
                                getA4Size.width * 0.1968,
                                false,
                              ),
                              tableCellWithContText(
                                "Taxable Value",
                                getA4Size.width * 0.1968,
                                false,
                              ),
                              if (billModel.customerModel.state == "Tamil Nadu")
                                pw.Row(
                                  children: [
                                    tableCellWithContText(
                                      "Central Tax",
                                      getA4Size.width * 0.1968,
                                      true,
                                    ),
                                    tableCellWithContText(
                                      "State Tax",
                                      getA4Size.width * 0.1968,
                                      true,
                                    ),
                                  ],
                                )
                              else
                                tableCellWithContText(
                                  "Central Tax",
                                  getA4Size.width * (0.1968 * 2),
                                  true,
                                ),
                              tableCellWithContText(
                                "Total Tax Amount",
                                getA4Size.width * 0.163,
                                false,
                              ),
                            ],
                          ),
                        ],
                      ),
                      pw.Row(
                        children: [
                          taxCalBodyData(
                            width: getA4Size.width * 0.1968,
                            child: pw.Column(
                              children: taxCalModel
                                  .map((e) => smallText("${e.hsnCode}"))
                                  .toList(),
                            ),
                          ),
                          taxCalBodyData(
                            width: getA4Size.width * 0.1968,
                            child: pw.Column(
                              children: taxCalModel
                                  .map(
                                    (e) => smallText(
                                      e.taxableVal.toStringAsFixed(2),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          if (billModel.customerModel.state == "Tamil Nadu")
                            pw.Row(
                              children: [
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            "${(e.rate / 2).toStringAsFixed(2)} %",
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            (e.amount / 2).toStringAsFixed(2),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            "${(e.rate / 2).toStringAsFixed(2)} %",
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            (e.amount / 2).toStringAsFixed(2),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            )
                          else
                            pw.Row(
                              children: [
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            "${e.rate.toStringAsFixed(2)} %",
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            e.amount.toStringAsFixed(2),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          taxCalBodyData(
                            width: getA4Size.width * 0.163,
                            child: pw.Column(
                              children: taxCalModel
                                  .map(
                                    (e) => smallText(
                                      e.totalTaxAmount.toStringAsFixed(2),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      pw.Row(
                        children: [
                          taxCalFooterData(
                            width: getA4Size.width * 0.1968,
                            child: smallBoldText("Total"),
                            isRight: true,
                          ),
                          taxCalFooterData(
                            width: getA4Size.width * 0.1968,
                            child: smallText(
                              getTotalTaxableAndTotalTaxValue(taxCalModel)[0]
                                  .toStringAsFixed(2),
                            ),
                          ),
                          if (billModel.customerModel.state == "Tamil Nadu")
                            pw.Row(
                              children: [
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: pw.Container(),
                                ),
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: smallText(
                                    (getTotalTaxableAndTotalTaxValue(
                                              taxCalModel,
                                            )[1] /
                                            2)
                                        .toStringAsFixed(2),
                                  ),
                                ),
                              ],
                            )
                          else
                            taxCalFooterData(
                              width: getA4Size.width * 0.19 * 2.13,
                              isHalf: true,
                              child: smallText(
                                "",
                              ),
                            ),
                          if (billModel.customerModel.state == "Tamil Nadu")
                            pw.Row(
                              children: [
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: pw.Container(),
                                ),
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: smallText(
                                    (getTotalTaxableAndTotalTaxValue(
                                              taxCalModel,
                                            )[1] /
                                            2)
                                        .toStringAsFixed(2),
                                  ),
                                ),
                              ],
                            )
                          else
                            taxCalFooterData(
                              width: getA4Size.width * 0.19 * 2,
                              isHalf: true,
                              child: smallText(
                                getTotalTaxableAndTotalTaxValue(
                                  taxCalModel,
                                )[1]
                                    .toStringAsFixed(2),
                              ),
                            ),
                          taxCalFooterData(
                            width: getA4Size.width * 0.163,
                            child: smallText(
                              getTotalTaxableAndTotalTaxValue(taxCalModel)[1]
                                  .toStringAsFixed(2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      bankContainer(
                        width: getA4Size.width * 0.3,
                        height: 87,
                        isBottomBorder: false,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            boldText(Application.bankDetails.bankName),
                            normalText(
                              "Acc No: ${Application.bankDetails.accountNo}",
                            ),
                            normalText(
                              "IFSC Code: ${Application.bankDetails.ifscCode}",
                            ),
                            normalText(
                              "Branch: ${Application.bankDetails.branch}",
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        width: (getA4Size.width * 0.2) +
                            (2 * getA4Size.width * 0.1),
                        height: 87,
                      ),
                      pw.Container(
                        width: getA4Size.width * 0.25,
                        height: 87,
                        alignment: pw.Alignment.center,
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            left: pw.BorderSide(width: 0.8),
                          ),
                        ),
                        padding: const pw.EdgeInsets.symmetric(vertical: 2),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            boldText("For ${Application.appName}"),
                            normalText("Authorized Signature"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
      ),
    );
    return pdf.save();
  }

  static Future<String> generateQuotation(QuotationModel billModel) async {
    final buffer = await generateQuotationBuffer(billModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateOrderBuffer(OrderModel billModel) async {
    final taxCalModel = OrderCalculations().getOrderTaxCalModel(billModel);
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: getA4Size,
        margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        mainAxisAlignment: pw.MainAxisAlignment.center,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Container(
              margin: const pw.EdgeInsets.only(top: 2, bottom: 4),
              child: pw.Container(
                alignment: pw.Alignment.center,
                child: smallText("Order".toUpperCase()),
              ),
            ),
            pw.Container(
              width: getA4Size.width * 0.95,
              height: getA4Size.height * 0.885 - 10,
              decoration: const pw.BoxDecoration(
                border: pw.Border(
                  left: pw.BorderSide(width: 0.8),
                  right: pw.BorderSide(width: 0.8),
                  top: pw.BorderSide(width: 0.8),
                  bottom: pw.BorderSide(width: 0.8),
                ),
              ),
              alignment: pw.Alignment.center,
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      if (Application.gstinNo != '')
                        pw.Container(
                          child: normalText("GSTIN : ${Application.gstinNo}"),
                          padding: const pw.EdgeInsets.all(8),
                        ),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Column(
                          children: [
                            normalText("Mobile No.: 9488327699"),
                            normalText("Email: annai.charlinf@gmail.com"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        bigText(Application.appName),
                        normalText(Application.address.split(r'\').first),
                        pw.SizedBox(height: 13),
                      ],
                    ),
                  ),
                  pw.Divider(height: 2),
                  pw.Row(
                    children: [
                      pw.Container(
                        width: getA4Size.width * 0.6,
                        alignment: pw.Alignment.centerLeft,
                        padding: const pw.EdgeInsets.only(left: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            normalText(
                              "Buyer : ${billModel.customerModel.name}",
                            ),
                            normalText(billModel.customerModel.address),
                            normalText(
                              "GSTIN : ${billModel.customerModel.gstin}",
                            ),
                            normalText(
                              "Mobile No : ${billModel.customerModel.mobileNo}",
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        width: 1,
                        height: 60,
                        color: PdfColor.fromHex("#000000"),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        child: normalText(
                          "Date : ${getFormattedDate(billModel.dateTime)}",
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(height: 2),
                  pw.Column(
                    children: [
                      pw.Row(
                        children: [
                          pw.Container(
                            width: getA4Size.width * 0.05,
                            child: tableCellContText("No."),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.365,
                            child: tableCellContText("Description"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("HSN"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Qty"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Rate"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Price"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Dis"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Amount"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      customizedTableData(
                        width: getA4Size.width * 0.05,
                        height: 265,
                        child: pw.Column(
                          children: billModel.productList
                              .map(
                                (e) => smallText(
                                  "${billModel.productList.indexOf(e) + 1}",
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.365,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 1, left: 1),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              ...billModel.productList.map(
                                (e) => smallText(e.productModel!.productName),
                              ),
                              pw.SizedBox(height: 30),
                              if (billModel.customerModel.state == "Tamil Nadu")
                                pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Column(
                                    children: [
                                      smallBoldText("Output CGST"),
                                      smallBoldText("Output SGST"),
                                    ],
                                  ),
                                )
                              else
                                pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Column(
                                    children: [smallBoldText("Output IGST")],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        insideText: boldText("Total"),
                      ),
                      customizedTableData(
                        height: 265,
                        width: getA4Size.width * 0.089,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: billModel.productList
                                .map(
                                  (e) =>
                                      smallText("${e.categoryModel!.hsnCode}"),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: billModel.productList
                                .map((e) => smallText("${e.qty}"))
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: billModel.productList
                                .map(
                                  (e) => smallText(
                                    "${e.rate}",
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: billModel.productList
                                .map(
                                  (e) => smallText(
                                    "${e.price}",
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: billModel.productList
                                .map(
                                  (e) => smallText(
                                    "${getDiscountAmount(e, billModel.customerModel)}",
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        isInnerTextCenter: true,
                        insideText: smallBoldText(
                          "${getGrandTotal(billModel.productList, billModel.customerModel)}",
                        ),
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 2, left: 2),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              ...billModel.productList.map(
                                (e) => smallText(
                                  "${getAmount(e, billModel.customerModel)}",
                                ),
                              ),
                              pw.Divider(),
                              //
                              pw.Column(
                                children: [
                                  smallText(
                                    "${calculateAmountWithoutTax(billModel.productList, billModel.customerModel)}",
                                  ),
                                  pw.SizedBox(height: 2),
                                  if (billModel.customerModel.state ==
                                      "Tamil Nadu")
                                    pw.Column(
                                      children: [
                                        smallText(
                                          (getTotalTaxableAndTotalTaxValue(
                                                    taxCalModel,
                                                  )[1] /
                                                  2)
                                              .toStringAsFixed(2),
                                        ),
                                        smallText(
                                          (getTotalTaxableAndTotalTaxValue(
                                                    taxCalModel,
                                                  )[1] /
                                                  2)
                                              .toStringAsFixed(2),
                                        ),
                                      ],
                                    )
                                  else
                                    smallText(
                                      getTotalTaxableAndTotalTaxValue(
                                        taxCalModel,
                                      )[1]
                                          .toStringAsFixed(2),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    width: getA4Size.width,
                    decoration: pw.BoxDecoration(
                      border: getBorder(),
                    ),
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        normalText("Amount Chargeable (in words)"),
                        boldText(
                          "INR ${NumberToWord().convert('en-in', getGrandTotal(billModel.productList, billModel.customerModel).round())} ",
                        ),
                      ],
                    ),
                  ),
                  pw.Column(
                    children: [
                      pw.Column(
                        children: [
                          pw.Row(
                            children: [
                              tableCellWithContText(
                                "HSN Code",
                                getA4Size.width * 0.1968,
                                false,
                              ),
                              tableCellWithContText(
                                "Taxable Value",
                                getA4Size.width * 0.1968,
                                false,
                              ),
                              if (billModel.customerModel.state == "Tamil Nadu")
                                pw.Row(
                                  children: [
                                    tableCellWithContText(
                                      "Central Tax",
                                      getA4Size.width * 0.1968,
                                      true,
                                    ),
                                    tableCellWithContText(
                                      "State Tax",
                                      getA4Size.width * 0.1968,
                                      true,
                                    ),
                                  ],
                                )
                              else
                                tableCellWithContText(
                                  "Central Tax",
                                  getA4Size.width * (0.1968 * 2),
                                  true,
                                ),
                              tableCellWithContText(
                                "Total Tax Amount",
                                getA4Size.width * 0.163,
                                false,
                              ),
                            ],
                          ),
                        ],
                      ),
                      pw.Row(
                        children: [
                          taxCalBodyData(
                            width: getA4Size.width * 0.1968,
                            child: pw.Column(
                              children: taxCalModel
                                  .map((e) => smallText("${e.hsnCode}"))
                                  .toList(),
                            ),
                          ),
                          taxCalBodyData(
                            width: getA4Size.width * 0.1968,
                            child: pw.Column(
                              children: taxCalModel
                                  .map(
                                    (e) => smallText(
                                      e.taxableVal.toStringAsFixed(2),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          if (billModel.customerModel.state == "Tamil Nadu")
                            pw.Row(
                              children: [
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            "${(e.rate / 2).toStringAsFixed(2)} %",
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            (e.amount / 2).toStringAsFixed(2),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            "${(e.rate / 2).toStringAsFixed(2)} %",
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            (e.amount / 2).toStringAsFixed(2),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            )
                          else
                            pw.Row(
                              children: [
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            "${e.rate.toStringAsFixed(2)} %",
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            e.amount.toStringAsFixed(2),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          taxCalBodyData(
                            width: getA4Size.width * 0.163,
                            child: pw.Column(
                              children: taxCalModel
                                  .map(
                                    (e) => smallText(
                                      e.totalTaxAmount.toStringAsFixed(2),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      pw.Row(
                        children: [
                          taxCalFooterData(
                            width: getA4Size.width * 0.1968,
                            child: smallBoldText("Total"),
                            isRight: true,
                          ),
                          taxCalFooterData(
                            width: getA4Size.width * 0.1968,
                            child: smallText(
                              getTotalTaxableAndTotalTaxValue(taxCalModel)[0]
                                  .toStringAsFixed(2),
                            ),
                          ),
                          if (billModel.customerModel.state == "Tamil Nadu")
                            pw.Row(
                              children: [
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: pw.Container(),
                                ),
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: smallText(
                                    (getTotalTaxableAndTotalTaxValue(
                                              taxCalModel,
                                            )[0] /
                                            2)
                                        .toStringAsFixed(2),
                                  ),
                                ),
                              ],
                            )
                          else
                            taxCalFooterData(
                              width: getA4Size.width * 0.19 * 2.13,
                              isHalf: true,
                              child: smallText(
                                "",
                              ),
                            ),
                          if (billModel.customerModel.state == "Tamil Nadu")
                            pw.Row(
                              children: [
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: pw.Container(),
                                ),
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: smallText(
                                    (getTotalTaxableAndTotalTaxValue(
                                              taxCalModel,
                                            )[1] /
                                            2)
                                        .toStringAsFixed(2),
                                  ),
                                ),
                              ],
                            )
                          else
                            taxCalFooterData(
                              width: getA4Size.width * 0.19 * 2,
                              isHalf: true,
                              child: smallText(
                                getTotalTaxableAndTotalTaxValue(
                                  taxCalModel,
                                )[1]
                                    .toStringAsFixed(2),
                              ),
                            ),
                          taxCalFooterData(
                            width: getA4Size.width * 0.163,
                            child: smallText(
                              getTotalTaxableAndTotalTaxValue(taxCalModel)[1]
                                  .toStringAsFixed(2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      bankContainer(
                        width: getA4Size.width * 0.3,
                        height: 87,
                        isBottomBorder: false,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            boldText(Application.bankDetails.bankName),
                            normalText(
                              "Acc No: ${Application.bankDetails.accountNo}",
                            ),
                            normalText(
                              "IFSC Code: ${Application.bankDetails.ifscCode}",
                            ),
                            normalText(
                              "Branch: ${Application.bankDetails.branch}",
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        width: (getA4Size.width * 0.2) +
                            (2 * getA4Size.width * 0.1),
                        height: 87,
                      ),
                      pw.Container(
                        width: getA4Size.width * 0.25,
                        height: 87,
                        alignment: pw.Alignment.center,
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            left: pw.BorderSide(width: 0.8),
                          ),
                        ),
                        padding: const pw.EdgeInsets.symmetric(vertical: 2),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            boldText("For ${Application.appName}"),
                            normalText("Authorized Signature"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
      ),
    );
    return pdf.save();
  }

  static Future<String> generateOrder(OrderModel billModel) async {
    final buffer = await generateOrderBuffer(billModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateEstimateBuffer(EstimateModel billModel) {
    final taxCalModel =
        EstimateCalculations().getEstimateTaxCalModel(billModel);
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: getA4Size,
        margin: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        mainAxisAlignment: pw.MainAxisAlignment.center,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Container(
              margin: const pw.EdgeInsets.only(top: 2, bottom: 4),
              child: pw.Container(
                alignment: pw.Alignment.center,
                child: smallText("Quotation".toUpperCase()),
              ),
            ),
            pw.Container(
              width: getA4Size.width * 0.95,
              height: getA4Size.height * 0.885 - 10,
              decoration: const pw.BoxDecoration(
                border: pw.Border(
                  left: pw.BorderSide(width: 0.8),
                  right: pw.BorderSide(width: 0.8),
                  top: pw.BorderSide(width: 0.8),
                  bottom: pw.BorderSide(width: 0.8),
                ),
              ),
              alignment: pw.Alignment.center,
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      if (Application.gstinNo != '')
                        pw.Container(
                          child: normalText("GSTIN : ${Application.gstinNo}"),
                          padding: const pw.EdgeInsets.all(8),
                        ),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Column(
                          children: [
                            normalText("Mobile No.: 9488327699"),
                            normalText("Email: annai.charlinf@gmail.com"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        bigText(Application.appName),
                        normalText(Application.address.split(r'\').first),
                        pw.SizedBox(height: 23),
                      ],
                    ),
                  ),
                  pw.Divider(height: 2),
                  pw.Row(
                    children: [
                      pw.Container(
                        width: getA4Size.width * 0.6,
                        alignment: pw.Alignment.centerLeft,
                        padding: const pw.EdgeInsets.only(left: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            normalText(
                              "Buyer : ${billModel.customerModel.name}",
                            ),
                            normalText(billModel.customerModel.address),
                            normalText(
                              "GSTIN : ${billModel.customerModel.gstin}",
                            ),
                            normalText(
                              "Mobile No : ${billModel.customerModel.mobileNo}",
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        width: 1,
                        height: 60,
                        color: PdfColor.fromHex("#000000"),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        child: normalText(
                          "Date : ${getFormattedDate(billModel.dateTime)}",
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(height: 2),
                  pw.Column(
                    children: [
                      pw.Row(
                        children: [
                          pw.Container(
                            width: getA4Size.width * 0.05,
                            child: tableCellContText("No."),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.365,
                            child: tableCellContText("Description"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("HSN"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Qty"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Rate"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Price"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Dis"),
                          ),
                          pw.Container(
                            width: getA4Size.width * 0.089,
                            child: tableCellContText("Amount"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      customizedTableData(
                        width: getA4Size.width * 0.05,
                        height: 265,
                        child: pw.Column(
                          children: billModel.productList
                              .map(
                                (e) => smallText(
                                  "${billModel.productList.indexOf(e) + 1}",
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.365,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 5, left: 5),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              ...billModel.productList.map(
                                (e) => smallText(e.productModel!.productName),
                              ),
                              pw.SizedBox(height: 30),
                              if (billModel.customerModel.state == "Tamil Nadu")
                                pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Column(
                                    children: [
                                      smallBoldText("Output CGST"),
                                      smallBoldText("Output SGST"),
                                    ],
                                  ),
                                )
                              else
                                pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Column(
                                    children: [smallBoldText("Output IGST")],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        insideText: boldText("Total"),
                      ),
                      customizedTableData(
                        height: 265,
                        width: getA4Size.width * 0.089,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 5, left: 5),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: billModel.productList
                                .map(
                                  (e) =>
                                      smallText("${e.categoryModel!.hsnCode}"),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 5, left: 5),
                          child: pw.Container(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 5),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: billModel.productList
                                  .map((e) => smallText("${e.qty}"))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 5, left: 5),
                          child: pw.Container(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 5),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: billModel.productList
                                  .map(
                                    (e) => smallText(
                                      "${e.rate}",
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 5, left: 5),
                          child: pw.Container(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 5),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: billModel.productList
                                  .map(
                                    (e) => smallText(
                                      SalesCalculation.getSalesPrice(
                                        e,
                                        billModel.customerModel,
                                      ).toStringAsFixed(2),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 5, left: 5),
                          child: pw.Container(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 5),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: billModel.productList
                                  .map(
                                    (e) => smallText(
                                      "${getDiscountAmount(e, billModel.customerModel)}",
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      customizedTableData(
                        width: getA4Size.width * 0.089,
                        height: 265,
                        isInnerTextCenter: true,
                        insideText: smallBoldText(
                          "${getGrandTotal(billModel.productList, billModel.customerModel)}",
                        ),
                        child: pw.Container(
                          padding: const pw.EdgeInsets.only(right: 5, left: 5),
                          child: pw.Container(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 5),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                ...billModel.productList.map(
                                  (e) => smallText(
                                    "${getAmount(e, billModel.customerModel)}",
                                  ),
                                ),
                                pw.Divider(),
                                //
                                pw.Column(
                                  children: [
                                    smallText(
                                      "${calculateAmountWithoutTax(billModel.productList, billModel.customerModel)}",
                                    ),
                                    pw.SizedBox(height: 2),
                                    if (billModel.customerModel.state ==
                                        "Tamil Nadu")
                                      pw.Column(
                                        children: [
                                          smallText(
                                            (getTotalTaxableAndTotalTaxValue(
                                                      taxCalModel,
                                                    )[1] /
                                                    2)
                                                .toStringAsFixed(2),
                                          ),
                                          smallText(
                                            (getTotalTaxableAndTotalTaxValue(
                                                      taxCalModel,
                                                    )[1] /
                                                    2)
                                                .toStringAsFixed(2),
                                          ),
                                        ],
                                      )
                                    else
                                      smallText(
                                        getTotalTaxableAndTotalTaxValue(
                                          taxCalModel,
                                        )[1]
                                            .toStringAsFixed(2),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    width: getA4Size.width,
                    decoration: pw.BoxDecoration(
                      border: getBorder(),
                    ),
                    padding: const pw.EdgeInsets.all(5),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        normalText("Amount Chargeable (in words)"),
                        boldText(
                          "INR ${NumberToWord().convert('en-in', getGrandTotal(billModel.productList, billModel.customerModel).round())} ",
                        ),
                      ],
                    ),
                  ),
                  pw.Column(
                    children: [
                      pw.Column(
                        children: [
                          pw.Row(
                            children: [
                              tableCellWithContText(
                                "HSN Code",
                                getA4Size.width * 0.1968,
                                false,
                              ),
                              tableCellWithContText(
                                "Taxable Value",
                                getA4Size.width * 0.1968,
                                false,
                              ),
                              if (billModel.customerModel.state == "Tamil Nadu")
                                pw.Row(
                                  children: [
                                    tableCellWithContText(
                                      "Central Tax",
                                      getA4Size.width * 0.1968,
                                      true,
                                    ),
                                    tableCellWithContText(
                                      "State Tax",
                                      getA4Size.width * 0.1968,
                                      true,
                                    ),
                                  ],
                                )
                              else
                                tableCellWithContText(
                                  "Central Tax",
                                  getA4Size.width * (0.1968 * 2),
                                  true,
                                ),
                              tableCellWithContText(
                                "Total Tax Amount",
                                getA4Size.width * 0.163,
                                false,
                              ),
                            ],
                          ),
                        ],
                      ),
                      pw.Row(
                        children: [
                          taxCalBodyData(
                            width: getA4Size.width * 0.1968,
                            child: pw.Column(
                              children: taxCalModel
                                  .map((e) => smallText("${e.hsnCode}"))
                                  .toList(),
                            ),
                          ),
                          taxCalBodyData(
                            width: getA4Size.width * 0.1968,
                            child: pw.Column(
                              children: taxCalModel
                                  .map(
                                    (e) => smallText(
                                      e.taxableVal.toStringAsFixed(2),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          if (billModel.customerModel.state == "Tamil Nadu")
                            pw.Row(
                              children: [
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            "${(e.rate / 2).toStringAsFixed(2)} %",
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            (e.amount / 2).toStringAsFixed(2),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            "${(e.rate / 2).toStringAsFixed(2)} %",
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  isHalf: true,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            (e.amount / 2).toStringAsFixed(2),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            )
                          else
                            pw.Row(
                              children: [
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            "${e.rate.toStringAsFixed(2)} %",
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                taxCalBodyData(
                                  width: getA4Size.width * 0.1968,
                                  child: pw.Column(
                                    children: taxCalModel
                                        .map(
                                          (e) => smallText(
                                            e.amount.toStringAsFixed(2),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          taxCalBodyData(
                            width: getA4Size.width * 0.163,
                            child: pw.Column(
                              children: taxCalModel
                                  .map(
                                    (e) => smallText(
                                      e.totalTaxAmount.toStringAsFixed(2),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      pw.Row(
                        children: [
                          taxCalFooterData(
                            width: getA4Size.width * 0.1968,
                            child: smallBoldText("Total"),
                            isRight: true,
                          ),
                          taxCalFooterData(
                            width: getA4Size.width * 0.1968,
                            child: smallText(
                              getTotalTaxableAndTotalTaxValue(taxCalModel)[0]
                                  .toStringAsFixed(2),
                            ),
                          ),
                          if (billModel.customerModel.state == "Tamil Nadu")
                            pw.Row(
                              children: [
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: pw.Container(),
                                ),
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: smallText(
                                    (getTotalTaxableAndTotalTaxValue(
                                              taxCalModel,
                                            )[1] /
                                            2)
                                        .toStringAsFixed(2),
                                  ),
                                ),
                              ],
                            )
                          else
                            taxCalFooterData(
                              width: getA4Size.width * 0.19 * 2.13,
                              isHalf: true,
                              child: smallText(
                                "",
                              ),
                            ),
                          if (billModel.customerModel.state == "Tamil Nadu")
                            pw.Row(
                              children: [
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: pw.Container(),
                                ),
                                taxCalFooterData(
                                  width: getA4Size.width * 0.197,
                                  isHalf: true,
                                  child: smallText(
                                    (getTotalTaxableAndTotalTaxValue(
                                              taxCalModel,
                                            )[1] /
                                            2)
                                        .toStringAsFixed(2),
                                  ),
                                ),
                              ],
                            )
                          else
                            taxCalFooterData(
                              width: getA4Size.width * 0.19 * 2,
                              isHalf: true,
                              child: smallText(
                                getTotalTaxableAndTotalTaxValue(
                                  taxCalModel,
                                )[1]
                                    .toStringAsFixed(2),
                              ),
                            ),
                          taxCalFooterData(
                            width: getA4Size.width * 0.163,
                            child: smallText(
                              getTotalTaxableAndTotalTaxValue(taxCalModel)[1]
                                  .toStringAsFixed(2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      bankContainer(
                        width: getA4Size.width * 0.3,
                        height: 87,
                        isBottomBorder: false,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            boldText(Application.bankDetails.bankName),
                            normalText(
                              "Acc No: ${Application.bankDetails.accountNo}",
                            ),
                            normalText(
                              "IFSC Code: ${Application.bankDetails.ifscCode}",
                            ),
                            normalText(
                              "Branch: ${Application.bankDetails.branch}",
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        width: (getA4Size.width * 0.2) +
                            (2 * getA4Size.width * 0.1),
                        height: 87,
                      ),
                      pw.Container(
                        width: getA4Size.width * 0.25,
                        height: 87,
                        alignment: pw.Alignment.center,
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                            left: pw.BorderSide(width: 0.8),
                          ),
                        ),
                        padding: const pw.EdgeInsets.symmetric(vertical: 2),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            boldText("For ${Application.appName}"),
                            normalText("Authorized Signature"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
      ),
    );
    return pdf.save();
  }

  static Future<String> generateEstimate(EstimateModel billModel) async {
    final pdfBuffer = await generateEstimateBuffer(billModel);

    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(pdfBuffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static pw.Column _getFotterTaxColumn(
    BillModel billModel,
    List<TaxCalModel> taxCalModel, {
    bool dynamicHeight = false,
  }) {
    print("taxCalModel: ${taxCalModel.length}");
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Column(
          children: [
            pw.Row(
              children: [
                tableCellWithContText(
                  "HSN Code",
                  getA4Size.width * 0.1968,
                  false,
                ),
                tableCellWithContText(
                  "Taxable Value",
                  getA4Size.width * 0.1968,
                  false,
                ),
                if (billModel.customerModel.state == "Tamil Nadu")
                  pw.Row(
                    children: [
                      tableCellWithContText(
                        "Central Tax",
                        getA4Size.width * 0.1968,
                        true,
                      ),
                      tableCellWithContText(
                        "State Tax",
                        getA4Size.width * 0.1968,
                        true,
                      ),
                    ],
                  )
                else
                  tableCellWithContText(
                    "Central Tax",
                    getA4Size.width * (0.1968 * 2),
                    true,
                  ),
                tableCellWithContText(
                  "Total Tax Amount",
                  getA4Size.width * 0.17,
                  false,
                ),
              ],
            ),
          ],
        ),
        pw.Row(
          children: [
            taxCalBodyData(
              dynamicHeight: dynamicHeight,
              width: getA4Size.width * 0.1968,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children:
                    taxCalModel.map((e) => smallText("${e.hsnCode}")).toList(),
              ),
            ),
            taxCalBodyData(
              dynamicHeight: dynamicHeight,
              width: getA4Size.width * 0.1968,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: taxCalModel
                    .map((e) => smallText(e.taxableVal.toStringAsFixed(2)))
                    .toList(),
              ),
            ),
            if (billModel.customerModel.state == "Tamil Nadu")
              pw.Row(
                children: [
                  taxCalBodyData(
                    dynamicHeight: dynamicHeight,
                    width: getA4Size.width * 0.1968,
                    isHalf: true,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: taxCalModel
                          .map(
                            (e) => smallText(
                              "${(e.rate / 2).toStringAsFixed(2)} %",
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  taxCalBodyData(
                    dynamicHeight: dynamicHeight,
                    width: getA4Size.width * 0.1968,
                    isHalf: true,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: taxCalModel
                          .map(
                            (e) => smallText((e.amount / 2).toStringAsFixed(2)),
                          )
                          .toList(),
                    ),
                  ),
                  taxCalBodyData(
                    dynamicHeight: dynamicHeight,
                    width: getA4Size.width * 0.1968,
                    isHalf: true,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: taxCalModel
                          .map(
                            (e) => smallText(
                              "${(e.rate / 2).toStringAsFixed(2)} %",
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  taxCalBodyData(
                    dynamicHeight: dynamicHeight,
                    width: getA4Size.width * 0.1968,
                    isHalf: true,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: taxCalModel
                          .map(
                            (e) => smallText((e.amount / 2).toStringAsFixed(2)),
                          )
                          .toList(),
                    ),
                  ),
                ],
              )
            else
              pw.Row(
                children: [
                  taxCalBodyData(
                    dynamicHeight: dynamicHeight,
                    width: getA4Size.width * 0.1968,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: taxCalModel
                          .map(
                            (e) => smallText("${e.rate.toStringAsFixed(2)} %"),
                          )
                          .toList(),
                    ),
                  ),
                  taxCalBodyData(
                    dynamicHeight: dynamicHeight,
                    width: getA4Size.width * 0.1968,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: taxCalModel
                          .map(
                            (e) => smallText(e.amount.toStringAsFixed(2)),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            taxCalBodyData(
              dynamicHeight: dynamicHeight,
              width: getA4Size.width * 0.17,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: taxCalModel
                    .map((e) => smallText(e.totalTaxAmount.toStringAsFixed(2)))
                    .toList(),
              ),
            ),
          ],
        ),
        pw.Row(
          children: [
            taxCalFooterData(
              width: getA4Size.width * 0.1968,
              child: smallBoldText("Total"),
              isRight: true,
            ),
            taxCalFooterData(
              width: getA4Size.width * 0.1968,
              child: smallText(
                getTotalTaxableAndTotalTaxValue(taxCalModel)[0]
                    .toStringAsFixed(2),
              ),
            ),
            if (billModel.customerModel.state == "Tamil Nadu")
              pw.Row(
                children: [
                  taxCalFooterData(
                    width: getA4Size.width * 0.197,
                    isHalf: true,
                    child: pw.Container(),
                  ),
                  taxCalFooterData(
                    width: getA4Size.width * 0.197,
                    isHalf: true,
                    child: smallText(
                      (getTotalTaxableAndTotalTaxValue(taxCalModel)[1] / 2)
                          .toStringAsFixed(2),
                    ),
                  ),
                ],
              )
            else
              taxCalFooterData(
                width: getA4Size.width * 0.19 * 2.13,
                isHalf: true,
                child: smallText(
                  "",
                ),
              ),
            if (billModel.customerModel.state == "Tamil Nadu")
              pw.Row(
                children: [
                  taxCalFooterData(
                    width: getA4Size.width * 0.197,
                    isHalf: true,
                    child: pw.Container(),
                  ),
                  taxCalFooterData(
                    width: getA4Size.width * 0.197,
                    isHalf: true,
                    child: smallText(
                      (getTotalTaxableAndTotalTaxValue(taxCalModel)[1] / 2)
                          .toStringAsFixed(2),
                    ),
                  ),
                ],
              )
            else
              taxCalFooterData(
                width: getA4Size.width * 0.19 * 2,
                isHalf: true,
                child: smallText(
                  getTotalTaxableAndTotalTaxValue(taxCalModel)[1]
                      .toStringAsFixed(2),
                ),
              ),
            taxCalFooterData(
              width: getA4Size.width * 0.17,
              child: smallText(
                getTotalTaxableAndTotalTaxValue(taxCalModel)[1]
                    .toStringAsFixed(2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static String removeTrailingZeros(String n) {
    return n.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }

  static Future<Uint8List> generateBillBuffer(
    BillModel billModel,
    String? upiString,
  ) async {
    final customerData =
        customerDB.getCustomerModelById(billModel.customerModel.id);
    final taxCalModel = SalesCalculation.getTaxCalModel(billModel);
    final pdf = pw.Document();
    final roundOff = getRoundOff(
      getGrandTotal(
        billModel.productList!,
        billModel.customerModel,
      ),
    );

    const maxBillHeight = 29;
    const minBillHeight = 11;
    final billHeight = 11 + (billModel.productList!.length * 1.5);
    //Max product capacity is 12
    final bankCont = buildBankAndSignature(getA4Size.width - 25, upiString);

    final amountInWordsCont = pw.Container(
      width: getA4Size.width - 25,
      decoration: pw.BoxDecoration(
        border: getBorder(),
      ),
      padding: const pw.EdgeInsets.all(5),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          normalText("Amount Chargeable (in words)"),
          boldText(
            "INR ${NumberToWord().convert('en-in', getGrandTotal(billModel.productList!, billModel.customerModel).round())} ",
          ),
        ],
      ),
    );

    final bigScreenHeight = getA4Size.height * 0.54;
    final serialNoWidth = getA4Size.width * 0.05;
    final productNameWidth = getA4Size.width * 0.3795;
    final hsnCodeWidth = getA4Size.width * 0.089;
    final qtyWidth = getA4Size.width * 0.06;
    final rateWidth = getA4Size.width * 0.089;
    final priceWidth = getA4Size.width * 0.099;
    final discountWidth = getA4Size.width * 0.080;
    final grandTotalWidth = getA4Size.width * 0.110;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: getA4Size,
        margin: const pw.EdgeInsets.only(
          left: 15,
          top: 5,
          right: 5,
          bottom: 5,
        ),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Container(
              margin: const pw.EdgeInsets.only(top: 16, bottom: 10),
              child: pw.Container(
                alignment: pw.Alignment.center,
                child: smallText("Tax Invoice".toUpperCase()),
              ),
            ),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Column(
                  children: [
                    pw.Container(
                      width: getA4Size.width / 2 - 20,
                      height: 90,
                      padding: const pw.EdgeInsets.all(5),
                      decoration: pw.BoxDecoration(border: getBorder()),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          boldText(Application.appName),
                          normalText(Application.address),
                          if (Application.gstinNo != '')
                            normalText("GSTIN No.: ${Application.gstinNo}"),
                          normalText("Mobile No.: 9488327699"),
                          normalText("Email: annai.charlinf@gmail.com"),
                        ],
                      ),
                    ),
                    pw.Container(
                      width: getA4Size.width / 2 - 20,
                      height: 90,
                      padding: const pw.EdgeInsets.all(5),
                      decoration: pw.BoxDecoration(border: getBorder()),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          normalText("Buyer Details"),
                          boldText(customerData?.name ?? "-"),
                          normalText(
                            "${customerData?.address}, ${customerData?.state} - ${customerData?.pincode}",
                          ),
                          normalText("GSTIN: ${customerData?.gstin}"),
                          normalText("Mobile No.: ${customerData?.mobileNo}"),
                        ],
                      ),
                    ),
                    pw.Container(
                      width: getA4Size.width / 2 - 20,
                      height: 60,
                      padding: const pw.EdgeInsets.all(5),
                      decoration: pw.BoxDecoration(border: getBorder()),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          boldText("Note"),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.Column(
                  children: [
                    pw.Row(
                      children: [
                        tableTopRightContainer(billModel.billNo, "Invoice No"),
                        tableTopRightContainer(
                          getDDMMMMYYYY(billModel.dateTime),
                          "Date",
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        tableTopRightContainer(
                          "${billModel.supplierRef}",
                          "Supplier Ref",
                        ),
                        tableTopRightContainer(
                          billModel.supplierRef!,
                          "Other Ref",
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        tableTopRightContainer(
                          SalesCalculation.getOrderNoIfRequired(
                            billModel,
                          ),
                          "Buyer Order No",
                        ),
                        tableTopRightContainer(
                          SalesCalculation.getOrderDateIfRequired(
                            billModel,
                          ),
                          "Buyer Order Date",
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        tableTopRightContainer(
                          "${billModel.dispatchDocumentNo}",
                          "Dispatch Doc No",
                        ),
                        tableTopRightContainer(
                          "${billModel.dispatchThrough}",
                          "Dispatch Through",
                        ),
                      ],
                    ),
                    pw.Container(
                      width: getA4Size.width / 2 - 5,
                      height: 80,
                      padding: const pw.EdgeInsets.all(5),
                      decoration: pw.BoxDecoration(border: getBorder()),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          normalText("Destination"),
                          normalText(billModel.destination ?? ""),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.Column(
              children: [
                pw.Row(
                  children: [
                    pw.Container(
                      width: serialNoWidth,
                      child: tableCellContText("No."),
                    ),
                    pw.Container(
                      width: productNameWidth,
                      child: tableCellContText("Description"),
                    ),
                    pw.Container(
                      width: hsnCodeWidth,
                      child: tableCellContText("HSN"),
                    ),
                    pw.Container(
                      width: qtyWidth,
                      child: tableCellContText("Qty"),
                    ),
                    pw.Container(
                      width: rateWidth,
                      child: tableCellContText("Rate"),
                    ),
                    pw.Container(
                      width: priceWidth,
                      child: tableCellContText("Price"),
                    ),
                    pw.Container(
                      width: discountWidth,
                      child: tableCellContText("Dis"),
                    ),
                    pw.Container(
                      width: grandTotalWidth,
                      child: tableCellContText("Amount"),
                    ),
                  ],
                ),
              ],
            ),
            pw.Row(
              children: [
                customizedTableData(
                  height: billHeight <= maxBillHeight ? null : bigScreenHeight,
                  width: serialNoWidth,
                  child: pw.Container(
                    child: pw.Column(
                      children: billModel.productList!
                          .map(
                            (e) => smallText(
                              "${billModel.productList!.indexOf(e) + 1}",
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                customizedTableData(
                  height: billHeight <= maxBillHeight ? null : bigScreenHeight,
                  width: productNameWidth,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.only(right: 5, left: 5),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        ...billModel.productList!.map(
                          (e) => pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              smallText(e.productModel!.productName),
                              if (e.qtyMathEqn.containsOperators)
                                vSmallText(
                                  ' ( ${e.qtyMathEqn ?? ''} )',
                                ),
                            ],
                          ),
                        ),
                        pw.SizedBox(height: 30),
                        if (billModel.customerModel.state == "Tamil Nadu")
                          pw.Align(
                            alignment: pw.Alignment.centerRight,
                            child: pw.Column(
                              children: [
                                smallBoldText("Output CGST"),
                                smallBoldText("Output SGST"),
                                if (billModel.billNo != "2865 / 2022 - 2023")
                                  smallBoldText("Round Off"),
                              ],
                            ),
                          )
                        else
                          pw.Align(
                            alignment: pw.Alignment.centerRight,
                            child: pw.Column(
                              children: [smallBoldText("Output IGST")],
                            ),
                          ),
                      ],
                    ),
                  ),
                  insideText: boldText("Total"),
                ),
                customizedTableData(
                  height: billHeight <= maxBillHeight ? null : bigScreenHeight,
                  width: hsnCodeWidth,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.only(right: 5, left: 5),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: billModel.productList!
                          .map(
                            (e) => smallText("${e.categoryModel!.hsnCode}"),
                          )
                          .toList(),
                    ),
                  ),
                ),
                customizedTableData(
                  height: billHeight <= maxBillHeight ? null : bigScreenHeight,
                  width: qtyWidth,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 2),
                    alignment: pw.Alignment.centerRight,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: billModel.productList!
                          .map(
                            (e) => smallText(removeTrailingZeros("${e.qty}")),
                          )
                          .toList(),
                    ),
                  ),
                ),
                customizedTableData(
                  height: billHeight <= maxBillHeight ? null : bigScreenHeight,
                  width: rateWidth,
                  child: pw.Container(
                    child: pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                      alignment: pw.Alignment.centerRight,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: billModel.productList!
                            .map(
                              (e) => smallText(
                                e.rate == null
                                    ? getPriceByCustomer(
                                        e.productModel!,
                                        billModel.customerModel,
                                      ).toString()
                                    : e.rate!.toString(),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                customizedTableData(
                  height: billHeight <= maxBillHeight ? null : bigScreenHeight,
                  width: priceWidth,
                  child: pw.Container(
                    child: pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                      alignment: pw.Alignment.centerRight,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: billModel.productList!
                            .map(
                              (e) => smallText(
                                SalesCalculation.getSalesPrice(
                                  e,
                                  billModel.customerModel,
                                ).toStringAsFixed(2),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                customizedTableData(
                  height: billHeight <= maxBillHeight ? null : bigScreenHeight,
                  width: discountWidth,
                  child: pw.Container(
                    child: pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                      alignment: pw.Alignment.centerRight,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: billModel.productList!
                            .map(
                              (e) => smallText(
                                getDiscountAmount(
                                  e,
                                  billModel.customerModel,
                                ).toStringAsFixed(2),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                customizedTableData(
                  height: billHeight <= maxBillHeight ? null : bigScreenHeight,
                  width: grandTotalWidth,
                  insideText: smallBoldText(
                    billModel.billNo == "2865 / 2022 - 2023"
                        ? getGrandTotal(
                            billModel.productList!,
                            billModel.customerModel,
                          ).toStringAsFixed(2)
                        : getGrandTotal(
                            billModel.productList!,
                            billModel.customerModel,
                          ).round().toStringAsFixed(2),
                  ),
                  child: pw.Container(
                    child: pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                      alignment: pw.Alignment.centerRight,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          ...billModel.productList!.map(
                            (e) => smallText(
                              getAmount(e, billModel.customerModel)
                                  .toStringAsFixed(2),
                            ),
                          ),
                          pw.Divider(),
                          //
                          pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.end,
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              smallText(
                                calculateAmountWithoutTax(
                                  billModel.productList!,
                                  billModel.customerModel,
                                ).toStringAsFixed(2),
                              ),
                              pw.SizedBox(height: 2),
                              if (billModel.customerModel.state == "Tamil Nadu")
                                pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.end,
                                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                                  children: [
                                    smallText(
                                      (getTotalTaxableAndTotalTaxValue(
                                                taxCalModel,
                                              )[1] /
                                              2)
                                          .toStringAsFixed(2),
                                    ),
                                    smallText(
                                      (getTotalTaxableAndTotalTaxValue(
                                                taxCalModel,
                                              )[1] /
                                              2)
                                          .toStringAsFixed(2),
                                    ),
                                  ],
                                )
                              else
                                smallText(
                                  getTotalTaxableAndTotalTaxValue(
                                    taxCalModel,
                                  )[1]
                                      .toStringAsFixed(2),
                                ),
                              if (billModel.billNo != "2865 / 2022 - 2023")
                                smallText(
                                  "${roundOff.operation == OperationEnum.Add ? '+' : '-'} ${roundOff.roundOffAmount.toStringAsFixed(2)}",
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            amountInWordsCont,
            if (billHeight <= maxBillHeight)
              pw.Column(
                children: [
                  _getFotterTaxColumn(
                    billModel,
                    taxCalModel,
                    dynamicHeight: true,
                  ),
                  bankCont,
                ],
              ),

            // pw.Container(
            //     alignment: pw.Alignment.center,
            //     child: normalText("This is Computer Generated Invoice"))
          ];
        },
      ),
    );
    if (billHeight > maxBillHeight) {
      pdf.addPage(
        pw.MultiPage(
          pageFormat: getA4Size,
          margin: const pw.EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Column(
                children: [
                  _getFotterTaxColumn(
                    billModel,
                    taxCalModel,
                    dynamicHeight: true,
                  ),
                  bankCont,
                ],
              ),
            ];
          },
        ),
      );
    }
    return pdf.save();
  }

  static Future<String> generateBill(
    BillModel billModel,
    String? upiString,
  ) async {
    final buffer = await generateBillBuffer(billModel, upiString);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateThermalBillForSalesBuffer(
    BillModel billModel,
    String? upiString,
  ) async {
    final pdf = pw.Document();
    final dataCont = pw.Container(
      child: pw.Center(
        child: pw.Column(
          children: [
            bigText(Application.appName),
            normalText(Application.address),
            // normalText("Vallioor - 627117"),
            normalText("Cell: 9488327699"),
            if (Application.gstinNo != '')
              normalText("GSTIN: ${Application.gstinNo}"),
            pw.SizedBox(height: 5),
            boldText("CASH BILL"),
            pw.SizedBox(height: 5),
            pw.Container(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  boldText(billModel.billNo),
                  boldText(getFormattedDate(billModel.dateTime)),
                ],
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.Container(
              padding: const pw.EdgeInsets.all(3),
              child: generateProductTable<BillModel>(billModel),
            ),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.Container(
              child: pw.Table(
                columnWidths: {},
                children: [
                  pw.TableRow(
                    children: [
                      normalText("Total Amount"),
                      normalText(""),
                      normalText(""),
                      normalText(
                        "${SalesCalculation.getTotalAmountForTaxThermal(billModel)}",
                      ),
                    ],
                  ),
                  if (SalesCalculation.getTotalDiscountForTaxThermal(
                        billModel,
                      ) !=
                      0)
                    pw.TableRow(
                      children: [
                        normalText("Discount"),
                        normalText(""),
                        normalText(""),
                        normalText(
                          "- ${SalesCalculation.getTotalDiscountForTaxThermal(billModel)}",
                        ),
                      ],
                    ),
                ],
              ),
            ),
            boldText(
              "CASH  Rs ${(SalesCalculation.getTotalAmountForTaxThermal(billModel) - SalesCalculation.getTotalDiscountForTaxThermal(billModel)).round()}",
            ),
            if (getUPIBarcodeImage(upiString) == null)
              pw.Container()
            else
              pw.Column(
                children: [
                  pw.SizedBox(height: 5),
                  getUPIBarcodeImage(upiString)!,
                  vSmallText("Scan to pay the bill"),
                ],
              ),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            boldText("Thank you! Visit Again!"),
          ],
        ),
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(
          75 * PdfPageFormat.mm,
          (150 + (billModel.productList!.length * 7)) * PdfPageFormat.mm,
        ),
        build: (pw.Context context) {
          return dataCont; // Center
        },
      ),
    );

    return pdf.save();
  }

  static Future<String> generateThermalBillForSales(
    BillModel billModel,
    String? upiString,
  ) async {
    final buffer =
        await generateThermalBillForSalesBuffer(billModel, upiString);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static pw.BarcodeWidget? getUPIBarcodeImage(
    String? upiString, {
    double? width,
  }) {
    if (upiString == null) {
      return null;
    }
    return pw.BarcodeWidget(
      barcode: pw.Barcode.qrCode(),
      data: upiString,
      width: width ?? 60,
      height: width ?? 60,
    );
    // if (imageData != null) {
    //   final memImg = pw.MemoryImage(
    //     imageData,
    //   );
    //   return pw.Image(memImg, width: width ?? 75 * PdfPageFormat.mm / 2.5);
    // }
    // final path = PathsDB().getUPIImagePrinterPath();
    // if (path == null) {
    //   return null;
    // }
    // final file = File(path);
    // final memImg = pw.MemoryImage(
    //   file.readAsBytesSync(),
    // );
    // return pw.Image(memImg, width: 75 * PdfPageFormat.mm / 2.5);
  }

  static Future<String> generateThermalBillForSewingService(
    SewingService sewingService,
  ) async {
    final pdf = pw.Document();
    final dataCont = pw.Container(
      child: pw.Center(
        child: pw.Column(
          children: [
            bigText(Application.appName),
            normalText(Application.address),
            // normalText("Vallioor - 627117"),
            normalText("Cell: 9488327699"),
            if (Application.gstinNo != '')
              normalText("GSTIN:${Application.gstinNo}"),
            pw.SizedBox(height: 5),
            boldText("Sewing Service BILL"),
            pw.SizedBox(height: 5),
            pw.Container(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  boldText(sewingService.billNo),
                  boldText(getFormattedDate(sewingService.dateTime)),
                ],
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.Container(
              padding: const pw.EdgeInsets.all(3),
              child: pw.Table(
                columnWidths: {
                  0: const pw.FlexColumnWidth(3),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(1.5),
                },
                children: [
                  pw.TableRow(
                    children: [
                      boldText("Product"),
                      boldText("Qty"),
                      boldText("Rate"),
                      boldText("Amount"),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Half Shirt"),
                      normalText("   "),
                      normalText("10"),
                      normalText("  "),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Full Shirt"),
                      normalText(""),
                      normalText("12"),
                      normalText("  "),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Half Shirt Model"),
                      normalText("   "),
                      normalText("12"),
                      normalText("  "),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Full Shirt Model"),
                      normalText("   "),
                      normalText("15"),
                      normalText("  "),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Govt School Uniform"),
                      normalText("   "),
                      normalText(""),
                      normalText("  "),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Biding"),
                      normalText("   "),
                      normalText(""),
                      normalText("  "),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Overlock"),
                      normalText("   "),
                      normalText(""),
                      normalText("  "),
                    ],
                  ),
                ],
              ),
            ),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            boldText("Thank you! Visit Again!"),
          ],
        ),
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: const PdfPageFormat(
          75 * PdfPageFormat.mm,
          (80 + (6 * 7)) * PdfPageFormat.mm,
        ),
        build: (pw.Context context) {
          return dataCont; // Center
        },
      ),
    );
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(await pdf.save());
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<String> generateThermalBillForSewingServiceForCustomer(
    SewingService sewingService,
  ) async {
    final pdf = pw.Document();
    final dataCont = pw.Container(
      child: pw.Center(
        child: pw.Column(
          children: [
            bigText(Application.appName),
            normalText(Application.address),
            normalText("Cell: 9488327699"),
            if (Application.gstinNo != '')
              normalText("GSTIN:${Application.gstinNo}"),
            pw.SizedBox(height: 5),
            boldText("Sewing Service BILL"),
            pw.SizedBox(height: 5),
            pw.Container(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  boldText(sewingService.billNo),
                  boldText(getFormattedDate(sewingService.dateTime)),
                ],
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.SizedBox(height: 5),
            pw.Container(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text(
                "NOTE: Please use this ${sewingService.billNo} for reference",
                style: const pw.TextStyle(fontSize: 10),
              ),
            ),
            if (getUPIBarcodeImage(null) == null)
              pw.Container()
            else
              pw.Column(
                children: [
                  pw.SizedBox(height: 5),
                  getUPIBarcodeImage(null)!,
                  vSmallText("Scan to pay the bill"),
                ],
              ),
            boldText("Thank you! Visit Again!"),
          ],
        ),
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat:
            const PdfPageFormat(75 * PdfPageFormat.mm, 80 * PdfPageFormat.mm),
        build: (pw.Context context) {
          return dataCont; // Center
        },
      ),
    );
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(await pdf.save());
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateThermalBillForQuotationBuffer(
    QuotationModel billModel,
  ) async {
    final pdf = pw.Document();
    final dataCont = pw.Container(
      child: pw.Center(
        child: pw.Column(
          children: [
            bigText(Application.appName),
            normalText(Application.address),
            // normalText("Vallioor - 627117"),
            normalText("Cell: 9488327699"),
            if (Application.gstinNo != '')
              normalText("GSTIN:${Application.gstinNo}"),
            pw.SizedBox(height: 5),
            boldText("Quotation"),
            pw.SizedBox(height: 5),
            pw.Container(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  boldText(billModel.quotationNo),
                  boldText(getFormattedDate(billModel.dateTime)),
                ],
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.Container(
              padding: const pw.EdgeInsets.all(3),
              child: generateProductTable<QuotationModel>(billModel),
            ),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.Container(
              child: pw.Table(
                columnWidths: {},
                children: [
                  pw.TableRow(
                    children: [
                      normalText("Total Amount"),
                      normalText(""),
                      normalText(""),
                      normalText(
                        "${QuoatationCalculations.getTotalAmountForTaxThermal(billModel)}",
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Discount"),
                      normalText(""),
                      normalText(""),
                      normalText(
                        "- ${QuoatationCalculations.getTotalDiscountForTaxThermal(billModel)}",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            boldText(
              "CASH  Rs ${(QuoatationCalculations.getTotalAmountForTaxThermal(billModel) - QuoatationCalculations.getTotalDiscountForTaxThermal(billModel)).round()}",
            ),
            if (getUPIBarcodeImage(null) == null)
              pw.Container()
            else
              pw.Column(
                children: [
                  pw.SizedBox(height: 5),
                  getUPIBarcodeImage(null)!,
                  vSmallText("Scan to pay the bill"),
                ],
              ),
            boldText("Thank you! Visit Again!"),
          ],
        ),
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(
          75 * PdfPageFormat.mm,
          (120 + (billModel.productList.length * 7)) * PdfPageFormat.mm,
        ),
        build: (pw.Context context) {
          return dataCont; // Center
        },
      ),
    );

    return pdf.save();
  }

  static Future<String> generateThermalBillForQuotation(
    QuotationModel billModel,
  ) async {
    final buffer = await generateThermalBillForQuotationBuffer(billModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateThermalBillForOrdersBuffer(
    OrderModel billModel,
  ) async {
    final pdf = pw.Document();
    final dataCont = pw.Container(
      child: pw.Center(
        child: pw.Column(
          children: [
            bigText(Application.appName),
            normalText(Application.address),
            // normalText("Vallioor - 627117"),
            normalText("Cell: 9488327699"),
            if (Application.gstinNo != '')
              normalText("GSTIN:${Application.gstinNo}"),
            pw.SizedBox(height: 5),
            boldText("Orders"),
            pw.SizedBox(height: 5),
            pw.Container(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  boldText(billModel.orderNo),
                  boldText(getFormattedDate(billModel.dateTime)),
                ],
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.Container(
              padding: const pw.EdgeInsets.all(3),
              child: generateProductTable<OrderModel>(billModel),
            ),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.Container(
              child: pw.Table(
                columnWidths: {},
                children: [
                  pw.TableRow(
                    children: [
                      normalText("Total Amount"),
                      normalText(""),
                      normalText(""),
                      normalText(
                        "${OrderCalculations.getTotalAmountForTaxThermal(billModel)}",
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Discount"),
                      normalText(""),
                      normalText(""),
                      normalText(
                        "- ${OrderCalculations.getTotalDiscountForTaxThermal(billModel)}",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            boldText(
              "CASH  Rs ${(OrderCalculations.getTotalAmountForTaxThermal(billModel) - OrderCalculations.getTotalDiscountForTaxThermal(billModel)).round()}",
            ),
            if (getUPIBarcodeImage(null) == null)
              pw.Container()
            else
              pw.Column(
                children: [
                  pw.SizedBox(height: 5),
                  getUPIBarcodeImage(null)!,
                  vSmallText("Scan to pay the bill"),
                ],
              ),
            boldText("Thank you! Visit Again!"),
          ],
        ),
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(
          75 * PdfPageFormat.mm,
          (120 + (billModel.productList.length * 7)) * PdfPageFormat.mm,
        ),
        build: (pw.Context context) {
          return dataCont; // Center
        },
      ),
    );
    return pdf.save();
  }

  static Future<String> generateThermalBillForOrders(
    OrderModel billModel,
  ) async {
    final buffer = await generateThermalBillForOrdersBuffer(billModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static pw.Table? generateProductTable<T>(T bill) {
    return pw.Table(
      columnWidths: {
        0: const pw.FlexColumnWidth(3),
        1: const pw.FlexColumnWidth(),
        2: const pw.FlexColumnWidth(),
        3: const pw.FlexColumnWidth(1.5),
      },
      children: [
        pw.TableRow(
          children: [
            boldText("Product"),
            boldText("Qty"),
            boldText("Rate"),
            boldText("Amount"),
          ],
        ),
        ...generateThermalProductTableRow<T>(bill),
      ],
    );
  }

  static List<pw.TableRow> generateThermalProductTableRow<T>(T bill) {
    if (bill.genericType == EstimateModel) {
      final billModel = bill as EstimateModel;
      return billModel.productList
          .map(
            (e) => pw.TableRow(
              children: [
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    smallText(e.productModel!.productName),
                    if (e.qtyMathEqn.containsOperators)
                      vSmallText(' ( ${e.qtyMathEqn ?? ''} )'),
                  ],
                ),
                normalText("${e.qty}"),
                normalText(
                  "${EstimateCalculations.getTaxThermalEstimateBillRate(e, billModel)}",
                ),
                normalText(
                  (e.qty! *
                          EstimateCalculations.getTaxThermalEstimateBillRate(
                            e,
                            billModel,
                          ))
                      .toStringAsFixed(2),
                ),
              ],
            ),
          )
          .toList();
    } else if (bill.genericType == QuotationModel) {
      final billModel = bill as QuotationModel;
      return billModel.productList
          .map(
            (e) => pw.TableRow(
              children: [
                normalText(e.productModel!.productName),
                normalText("${e.qty}"),
                normalText(
                  "${QuoatationCalculations.getTaxThermalBillRate(e, billModel)}",
                ),
                normalText(
                  (e.qty! *
                          QuoatationCalculations.getTaxThermalBillRate(
                            e,
                            billModel,
                          ))
                      .toStringAsFixed(2),
                ),
              ],
            ),
          )
          .toList();
    } else if (bill.genericType == OrderModel) {
      final billModel = bill as OrderModel;
      return billModel.productList
          .map(
            (e) => pw.TableRow(
              children: [
                normalText(e.productModel!.productName),
                normalText("${e.qty}"),
                normalText(
                  "${OrderCalculations.getTaxThermalBillRate(e, billModel)}",
                ),
                normalText(
                  (e.qty! *
                          OrderCalculations.getTaxThermalBillRate(e, billModel))
                      .toStringAsFixed(2),
                ),
              ],
            ),
          )
          .toList();
    } else {
      final billModel = bill as BillModel;
      return billModel.productList!
          .map(
            (e) => pw.TableRow(
              children: [
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    smallText(e.productModel!.productName),
                    if (e.qtyMathEqn.containsOperators)
                      vSmallText(' ( ${e.qtyMathEqn ?? ''} )'),
                  ],
                ),
                normalText("${e.qty}"),
                normalText(
                  "${SalesCalculation.getTaxThermalBillRate(e, billModel)}",
                ),
                normalText(
                  (e.qty! *
                          SalesCalculation.getTaxThermalBillRate(e, billModel))
                      .toStringAsFixed(2),
                ),
              ],
            ),
          )
          .toList();
    }
  }

  static Future<Uint8List> generateThermalBillForEstimateBuffer(
    EstimateModel billModel,
  ) async {
    final pdf = pw.Document();
    final dataCont = pw.Container(
      child: pw.Center(
        child: pw.Column(
          children: [
            bigText(Application.appName),
            normalText(Application.address),
            // normalText("Vallioor - 627117"),
            normalText("Cell: 9488327699"),
            if (Application.gstinNo != '')
              normalText("GSTIN:${Application.gstinNo}"),
            pw.SizedBox(height: 5),
            boldText("CASH Bill"),
            pw.SizedBox(height: 5),
            pw.Container(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  boldText(billModel.estimateNo),
                  boldText(getFormattedDate(billModel.dateTime)),
                ],
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.Container(
              padding: const pw.EdgeInsets.all(3),
              child: generateProductTable<EstimateModel>(billModel),
            ),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            pw.Container(
              child: pw.Table(
                columnWidths: {},
                children: [
                  pw.TableRow(
                    children: [
                      normalText("Total Amount"),
                      normalText(""),
                      normalText(""),
                      normalText(
                        "${EstimateCalculations.getTotalAmountForTaxThermal(billModel)}",
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      normalText("Discount"),
                      normalText(""),
                      normalText(""),
                      normalText(
                        "- ${EstimateCalculations.getTotalDiscountForTaxThermal(billModel)}",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pw.Divider(borderStyle: pw.BorderStyle.dashed),
            boldText(
              "CASH  Rs ${(EstimateCalculations.getTotalAmountForTaxThermal(billModel) - EstimateCalculations.getTotalDiscountForTaxThermal(billModel)).round()}",
            ),
            if (getUPIBarcodeImage(null) == null)
              pw.Container()
            else
              pw.Column(
                children: [
                  pw.SizedBox(height: 5),
                  getUPIBarcodeImage(null)!,
                  vSmallText("Scan to pay the bill"),
                ],
              ),
            boldText("Thank you! Visit Again!"),
          ],
        ),
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(
          75 * PdfPageFormat.mm,
          (120 + (billModel.productList.length * 7)) * PdfPageFormat.mm,
        ),
        build: (pw.Context context) {
          return dataCont; // Center
        },
      ),
    );
    return await pdf.save();
  }

  static Future<String> generateThermalBillForEstimate(
    EstimateModel billModel,
  ) async {
    final pdfBuffer = await generateThermalBillForEstimateBuffer(billModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(pdfBuffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateA5VoucherBuffer(
    VoucherModel voucherModel,
  ) async {
    final pdf = pw.Document();

    final todayDateStr =
        "${getTodaysDate().day}/${getTodaysDate().month}/${getTodaysDate().year}";

// pdf.orientation = PdfPageOrientation.landscape;

    pdf.addPage(
      pw.MultiPage(
        orientation: pw.PageOrientation.landscape,
        pageFormat: getA5Size,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Stack(
              children: [
                pw.Container(
                  height: getA5Size.width - 20,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColor.fromHex("#A0A0A0"),
                      style: pw.BorderStyle.dashed,
                    ),
                  ),
                  margin: const pw.EdgeInsets.all(10),
                  padding: const pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: [
                      pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: normalText("Date: $todayDateStr"),
                      ),
                      pw.SizedBox(height: 90),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Column(
                          children: [
                            pw.Row(
                              children: [
                                boldText("Voucher no: "),
                                normalText(voucherModel.voucherNo),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Row(
                                  children: [
                                    boldText("Given To: "),
                                    pw.Container(
                                      padding: const pw.EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border(
                                          bottom: pw.BorderSide(
                                            color: PdfColor.fromHex(
                                              "#000",
                                            ),
                                          ),
                                        ),
                                      ),
                                      child:
                                          normalText(voucherModel.givenTo.name),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    boldText("Amount "),
                                    pw.Container(
                                      width: 100,
                                      padding: const pw.EdgeInsets.all(5),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      child: normalText(
                                        "${voucherModel.givenAmount}",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              children: [
                                boldText("Amount(in words): "),
                                pw.Container(
                                  padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border(
                                      bottom: pw.BorderSide(
                                        color: PdfColor.fromHex("#000"),
                                      ),
                                    ),
                                  ),
                                  child: normalText(
                                    NumberToWord()
                                            .convert(
                                              'en-in',
                                              voucherModel.givenAmount.round(),
                                            )
                                            .capitalize ??
                                        "",
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Container(),
                                pw.Row(
                                  children: [
                                    boldText("Paid through: "),
                                    pw.Container(
                                      padding: const pw.EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border(
                                          bottom: pw.BorderSide(
                                            color: PdfColor.fromHex(
                                              "#000",
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: voucherModel.paymentId == ""
                                          ? normalText(
                                              voucherModel.paymentMethod,
                                            )
                                          : normalText(
                                              "${voucherModel.paymentMethod} ( ${voucherModel.paymentId} )",
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            pw.Container(
                              height: 120,
                              padding:
                                  const pw.EdgeInsets.symmetric(horizontal: 20),
                              child: pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Column(
                                    mainAxisAlignment: pw.MainAxisAlignment.end,
                                    children: [
                                      normalText(Application.appName),
                                      boldText("Received by "),
                                    ],
                                  ),
                                  boldText("Authorized Signature"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.all(5),
                  color: PdfColor.fromHex("#FFFFFF"),
                  child: boldText("RECEIPT"),
                ),
              ],
            ),
          ];
        },
      ),
    );
    return pdf.save();
  }

  static Future<String> generateA5Voucher(VoucherModel voucherModel) async {
    final buffer = await generateA5VoucherBuffer(voucherModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateA5PaymentModelBuffer(
    PaymentModel paymentModel,
  ) async {
    final pdf = pw.Document();

    final todayDateStr =
        "${getTodaysDate().day}/${getTodaysDate().month}/${getTodaysDate().year}";

// pdf.orientation = PdfPageOrientation.landscape;
    const companyName = "";
    final pur = purchaseDB.getPurchaseModelById(paymentModel.purchaseId);
    if (pur != null) {
      final companyName = companyDB.getCompanyById(pur.companyModel.id).name;
    }
    pdf.addPage(
      pw.MultiPage(
        orientation: pw.PageOrientation.landscape,
        pageFormat: getA5Size,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Stack(
              children: [
                pw.Container(
                  height: getA5Size.width - 20,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColor.fromHex("#A0A0A0"),
                      style: pw.BorderStyle.dashed,
                    ),
                  ),
                  margin: const pw.EdgeInsets.all(10),
                  padding: const pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: [
                      pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: normalText("Date: $todayDateStr"),
                      ),
                      pw.SizedBox(height: 90),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Column(
                          children: [
                            pw.Row(
                              children: [
                                boldText("Voucher no: "),
                                normalText(paymentModel.paymentNo),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Row(
                                  children: [
                                    boldText("Given To: "),
                                    pw.Container(
                                      padding: const pw.EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border(
                                          bottom: pw.BorderSide(
                                            color: PdfColor.fromHex(
                                              "#000",
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: normalText(companyName),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    boldText("Amount "),
                                    pw.Container(
                                      width: 100,
                                      padding: const pw.EdgeInsets.all(5),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      child: normalText(
                                        "${paymentModel.givenAmount}",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              children: [
                                boldText("Amount(in words): "),
                                pw.Container(
                                  padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border(
                                      bottom: pw.BorderSide(
                                        color: PdfColor.fromHex("#000"),
                                      ),
                                    ),
                                  ),
                                  child: normalText(
                                    NumberToWord()
                                            .convert(
                                              'en-in',
                                              paymentModel.givenAmount.round(),
                                            )
                                            .capitalize ??
                                        "",
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Container(),
                                pw.Row(
                                  children: [
                                    boldText("Paid through: "),
                                    pw.Container(
                                      padding: const pw.EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border(
                                          bottom: pw.BorderSide(
                                            color: PdfColor.fromHex(
                                              "#000",
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: paymentModel.paymentID == ""
                                          ? normalText(
                                              paymentModel.paymentMethod,
                                            )
                                          : normalText(
                                              "${paymentModel.paymentMethod} ( ${paymentModel.paymentID} )",
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            pw.Container(
                              height: 120,
                              padding:
                                  const pw.EdgeInsets.symmetric(horizontal: 20),
                              child: pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Column(
                                    mainAxisAlignment: pw.MainAxisAlignment.end,
                                    children: [
                                      normalText(Application.appName),
                                      boldText("Received by "),
                                    ],
                                  ),
                                  boldText("Authorized Signature"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.all(5),
                  color: PdfColor.fromHex("#FFFFFF"),
                  child: boldText("RECEIPT"),
                ),
              ],
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  static Future<String> generateA5PaymentModel(
    PaymentModel paymentModel,
  ) async {
    final pdfBuffer = await generateA5PaymentModelBuffer(paymentModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(pdfBuffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateA5ReceiptBuffer(
    ReceiptModel receiptModel,
  ) async {
    // const double inch = 72.0;
    // const double cm = inch / 2.54;
    // const double mm = cm / 10;

    final pdf = pw.Document();

    final todayDateStr =
        "${getTodaysDate().day}/${getTodaysDate().month}/${getTodaysDate().year}";

// pdf.orientation = PdfPageOrientation.landscape;

    pdf.addPage(
      pw.MultiPage(
        orientation: pw.PageOrientation.landscape,
        pageFormat: getA5Size,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Stack(
              children: [
                pw.Container(
                  height: getA5Size.width - 20,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColor.fromHex("#A0A0A0"),
                      style: pw.BorderStyle.dashed,
                    ),
                  ),
                  margin: const pw.EdgeInsets.all(10),
                  padding: const pw.EdgeInsets.all(5),
                  child: pw.Column(
                    children: [
                      pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: normalText("Date: $todayDateStr"),
                      ),
                      pw.SizedBox(height: 90),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Column(
                          children: [
                            pw.Row(
                              children: [
                                boldText("Receipt no: "),
                                normalText(receiptModel.receiptNo),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Row(
                                  children: [
                                    boldText("Received from: "),
                                    pw.Container(
                                      padding: const pw.EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border(
                                          bottom: pw.BorderSide(
                                            color: PdfColor.fromHex(
                                              "#000",
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: normalText(
                                        receiptModel.receivedFrom == null
                                            ? receiptModel.customerModel.name
                                            : "${receiptModel.customerModel.name} ( ${receiptModel.receivedFrom} )",
                                      ),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    boldText("Amount "),
                                    pw.Container(
                                      width: 100,
                                      padding: const pw.EdgeInsets.all(5),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      child: normalText(
                                        "${receiptModel.givenAmount}",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              children: [
                                boldText("Amount(in words): "),
                                pw.Container(
                                  padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border(
                                      bottom: pw.BorderSide(
                                        color: PdfColor.fromHex("#000"),
                                      ),
                                    ),
                                  ),
                                  child: normalText(
                                    NumberToWord()
                                            .convert(
                                              'en-in',
                                              receiptModel.givenAmount.round(),
                                            )
                                            .capitalize ??
                                        "",
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Container(),
                                pw.Row(
                                  children: [
                                    boldText("Paid through: "),
                                    pw.Container(
                                      padding: const pw.EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border(
                                          bottom: pw.BorderSide(
                                            color: PdfColor.fromHex(
                                              "#000",
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: receiptModel.paymentId == ""
                                          ? normalText(
                                              receiptModel.paymentMethod,
                                            )
                                          : normalText(
                                              "${receiptModel.paymentMethod} ( ${receiptModel.paymentId} )",
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            pw.Container(
                              height: 120,
                              padding:
                                  const pw.EdgeInsets.symmetric(horizontal: 20),
                              child: pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Column(
                                    mainAxisAlignment: pw.MainAxisAlignment.end,
                                    children: [
                                      normalText(Application.appName),
                                      boldText("Received by "),
                                    ],
                                  ),
                                  boldText("Authorized Signature"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  margin: const pw.EdgeInsets.all(5),
                  color: PdfColor.fromHex("#FFFFFF"),
                  child: boldText("RECEIPT"),
                ),
              ],
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  static Future<String> generateA5Receipt(ReceiptModel receiptModel) async {
    final buffer = await generateA5ReceiptBuffer(receiptModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static Future<Uint8List> generateThermalReceiptBuffer(
    ReceiptModel receiptModel,
  ) async {
    final pdf = pw.Document();
    final dataCont = pw.Container(
      // padding: const pw.EdgeInsets.all(5),
      child: pw.Stack(
        children: [
          // pw.Center(
          //     child: pw.Container(
          //         child: pw.Text("Paid",
          //             style: pw.TextStyle(
          //                 fontSize: 20, fontWeight: pw.FontWeight.bold)))),
          pw.Center(
            child: pw.Column(
              children: [
                bigText(Application.appName),
                normalText(Application.address),
                normalText("Cell: 9488327699"),
                if (Application.gstinNo != '')
                  normalText("GSTIN:${Application.gstinNo}"),
                pw.SizedBox(height: 5),
                boldText("Receipt"),
                pw.SizedBox(height: 5),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      boldText(receiptModel.receiptNo),
                      boldText(getFormattedDate(receiptModel.createdAt)),
                    ],
                  ),
                ),
                pw.SizedBox(height: 5),
                pw.Divider(borderStyle: pw.BorderStyle.dashed),
                pw.Container(
                  width: 71 * PdfPageFormat.mm,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            smallText("Received From "),
                            smallText("Received By "),
                            smallText("Paid Through "),
                            if (getPaymentMethodFromStr(
                                  receiptModel.paymentMethod,
                                ) !=
                                PaymentMethodEnum.CASH)
                              smallText("Payment ID"),
                          ],
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            boldSmallText(receiptModel.customerModel.name),
                            boldSmallText(Application.appName),
                            boldSmallText(receiptModel.paymentMethod),
                            if (getPaymentMethodFromStr(
                                  receiptModel.paymentMethod,
                                ) !=
                                PaymentMethodEnum.CASH)
                              boldSmallText(receiptModel.paymentId),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // if (getPaymentMethodFromStr(receiptModel.paymentMethod) !=
                //       PaymentMethodEnum.CASH)
                //       pw.Container(
                //     padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                //     child: pw.Row(
                //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                //         children: [
                //             boldText(receiptModel.paymentId)

                //         ])),

                pw.Divider(borderStyle: pw.BorderStyle.dashed),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 2),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      boldText("Cash "),
                      boldText("Rs. ${receiptModel.givenAmount.round()}"),
                    ],
                  ),
                ),

                // pw.SizedBox(height: 10),
                // pw.Container(
                //     padding: const pw.EdgeInsets.symmetric(horizontal: 2),
                //     child: boldText(NumberToWord()
                //             .convert('en-in', receiptModel.givenAmount.round())
                //             .capitalize ??
                //         "")),
                // pw.Divider(borderStyle: pw.BorderStyle.dashed),
                boldText("Thank you! Visit Again!"),
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: const PdfPageFormat(
          75 * PdfPageFormat.mm,
          (115) * PdfPageFormat.mm,
        ),
        build: (pw.Context context) {
          return dataCont; // Center
        },
      ),
    );
    return pdf.save();
  }

  static Future<String> generateThermalReceipt(
    ReceiptModel receiptModel,
  ) async {
    final buffer = await generateThermalReceiptBuffer(receiptModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      return 'textfieldError';
    }
  }

  static void openBufferPdf(Uint8List buffer, String fileName) {
    Navigator.push(
      NavigationService.navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => PdfViewer(
          pdfBuffer: buffer,
          fileName: fileName,
        ),
      ),
    );
  }

  static void openPdf(String pdfPath) {
    final chromePath = pathsDB.getChromePath();
    debugPrint("Chrome Path : $chromePath");
    Navigator.push(
      NavigationService.navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => PdfViewer(
          filePath: pdfPath,
          fileName: pdfPath.split("/").last.split(".").first,
        ),
      ),
    );
    // try {
    //   Process.run(chromePath!, [pdfPath]).then((ProcessResult results) {
    //     debugPrint("${results.stdout}");
    //   });
    // } catch (e) {
    //   CustomUtilies.customFailureSnackBar("Error", "Error in opening the pdf");
    // }
  }

  static Future<Uint8List> generateStatementByCustomerBuffer(
    CustomerModel customerModel,
    CategoryModel categoryModel,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final bills = salesDB.getBillByDateAndCustomer(
      startDate,
      endDate,
      customerModel.id,
    );
    final receipts = receiptDB.getReceiptByDateAndCustomerId(
      startDate,
      endDate,
      customerModel.id,
    );
    final pdf = pw.Document();
    final dataCont = pw.Container(
      // padding: const pw.EdgeInsets.all(5),
      child: pw.Stack(
        children: [
          // pw.Center(
          //     child: pw.Container(
          //         child: pw.Text("Paid",
          //             style: pw.TextStyle(
          //                 fontSize: 20, fontWeight: pw.FontWeight.bold)))),
          pw.Center(
            child: pw.Column(
              children: [
                bigText(Application.appName),
                normalText(Application.address),
                normalText("Cell: ${Application.mobileNo}"),
                if (Application.gstinNo != '')
                  normalText("GSTIN:${Application.gstinNo}"),
                pw.Container(
                  width: 400,
                  child: pw.Divider(color: PdfColor.fromHex("#E0E0E0")),
                ),
                pw.SizedBox(height: 5),
                boldText(customerModel.name),
                normalText(customerModel.address),
                normalText("${customerModel.state} - ${customerModel.pincode}"),
                normalText("Cell: ${customerModel.mobileNo}"),
                if (customerModel.gstin != null && customerModel.gstin != "")
                  normalText("GSTIN: ${customerModel.gstin}"),
                pw.SizedBox(height: 5),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      boldText("Receipt No"),
                      boldText("Date"),
                    ],
                  ),
                ),
                pw.SizedBox(height: 5),
                pw.Divider(borderStyle: pw.BorderStyle.dashed),
                pw.Container(
                  width: 71 * PdfPageFormat.mm,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            smallText("Received From "),
                            smallText("Received By "),
                            smallText("Paid Through "),
                            smallText("Payment ID"),
                          ],
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            boldSmallText("customerModel.name"),
                            boldSmallText(Application.appName),
                            boldSmallText("receiptModel.paymentMethod"),
                            if (getPaymentMethodFromStr(
                                  "receiptModel.paymentMethod",
                                ) !=
                                PaymentMethodEnum.CASH)
                              boldSmallText("receiptModel.paymentId"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // if (getPaymentMethodFromStr(receiptModel.paymentMethod) !=
                //       PaymentMethodEnum.CASH)
                //       pw.Container(
                //     padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                //     child: pw.Row(
                //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                //         children: [
                //             boldText(receiptModel.paymentId)

                //         ])),

                pw.Divider(borderStyle: pw.BorderStyle.dashed),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 2),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      boldText("Cash "),
                      boldText("Rs. "),
                    ],
                  ),
                ),

                // pw.SizedBox(height: 10),
                // pw.Container(
                //     padding: const pw.EdgeInsets.symmetric(horizontal: 2),
                //     child: boldText(NumberToWord()
                //             .convert('en-in', receiptModel.givenAmount.round())
                //             .capitalize ??
                //         "")),
                // pw.Divider(borderStyle: pw.BorderStyle.dashed),
                boldText("Thank you! Visit Again!"),
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: getA4Size,
        build: (pw.Context context) {
          return dataCont; // Center
        },
      ),
    );

    return pdf.save();
  }

  static Future<String> generateStatementByCustomer(
    CustomerModel customerModel,
    CategoryModel categoryModel,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final buffer = await generateStatementByCustomerBuffer(
      customerModel,
      categoryModel,
      startDate,
      endDate,
    );
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      rethrow;
    }
  }

  pw.Widget boldTextWithPadding(
    String text, {
    pw.Alignment? alignment,
    double? rightPadding,
    pw.Border? border,
  }) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        border: border,
      ),
      child: pw.Padding(
        padding: pw.EdgeInsets.fromLTRB(0, 8, rightPadding ?? 0, 8),
        child: pw.Align(
          alignment: alignment ?? pw.Alignment.centerLeft,
          child: pw.Text(
            text,
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  pw.Widget textWithPadding(
    String text, {
    pw.Alignment? alignment,
    double? rightPadding,
    pw.Border? border,
  }) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        border: border,
      ),
      child: pw.Padding(
        padding: pw.EdgeInsets.fromLTRB(0, 8, rightPadding ?? 0, 8),
        child: pw.Align(
          alignment: alignment ?? pw.Alignment.centerLeft,
          child: pw.Text(text),
        ),
      ),
    );
  }

  Future<Uint8List> generateCustomerReportBuffer(
    DateTime startDate,
    DateTime endDate,
    CustomerModel customerModel, {
    double? previousAmountManually,
  }) async {
    if (previousAmountManually != null) {
      await customerDB.updateCustomer(
        customerModel.copyWith(openingBalance: previousAmountManually),
      );
    }
    final previousAmount =
        (previousAmountManually ?? customerModel.openingBalance) +
            ReportCalculations.getPreviousBalance(
              startDate,
              customerModel.id,
            );

    log("customersReport: $previousAmountManually ${customerModel.openingBalance} $previousAmount");
    final bills = salesDB.getBillByDateAndCustomer(
      startDate,
      endDate,
      customerModel.id,
    );
    final receipts = receiptDB.getReceiptByDateAndCustomerId(
      startDate,
      endDate,
      customerModel.id,
    );
    double totalDebit = 0;
    double totalCredit = 0;
    final List<CustomerReport> customersReport = [];
    for (final bill in bills) {
      final customerReport = CustomerReport(
        bill.dateTime,
        "GST Sales",
        VchType.gst,
        bill.billNo,
        bill.price,
        0,
      );
      totalDebit += bill.price;
      customersReport.add(customerReport);
    }
    totalDebit += previousAmount;

    for (final receipt in receipts) {
      final customerReport = CustomerReport(
        receipt.createdAt,
        "Receipt",
        VchType.receipt,
        receipt.receiptNo,
        0,
        receipt.givenAmount,
      );
      totalCredit += receipt.givenAmount;
      customersReport.add(customerReport);
    }

    customersReport.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        maxPages: 120,
        pageFormat: getA4Size,
        build: (pw.Context context) {
          return [
            pw.Center(
              child: pw.Column(
                children: [
                  bigText(Application.appName),
                  normalText(Application.address),
                  normalText("Cell: ${Application.mobileNo}"),
                  if (Application.gstinNo != '')
                    normalText("GSTIN:${Application.gstinNo}"),
                  pw.Container(
                    width: 400,
                    child: pw.Divider(color: PdfColor.fromHex("#E0E0E0")),
                  ),
                  pw.SizedBox(height: 5),
                  boldText(customerModel.name),
                  normalText(customerModel.address),
                  normalText(
                    "${customerModel.state} - ${customerModel.pincode}",
                  ),
                  normalText("Cell: ${customerModel.mobileNo}"),
                  if (customerModel.gstin != null && customerModel.gstin != "")
                    normalText("GSTIN: ${customerModel.gstin}"),
                  pw.SizedBox(height: 15),
                  normalText(
                    "${DateFormat('dd-MM-yyyy').format(startDate)} to ${DateFormat('dd-MM-yyyy').format(endDate)}",
                  ),
                  pw.SizedBox(height: 15),
                ],
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(25),
              child: pw.Table(
                children: [
                  pw.TableRow(
                    children: [
                      textWithPadding("Date"),
                      textWithPadding("Particulars"),
                      textWithPadding("Vch Type"),
                      textWithPadding("Vch No."),
                      textWithPadding("Debit"),
                      textWithPadding("Credit"),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      boldTextWithPadding(
                        DateFormat('dd-MM-yyyy').format(startDate),
                      ),
                      boldTextWithPadding("Opening balance"),
                      textWithPadding(""),
                      textWithPadding(""),
                      boldTextWithPadding(previousAmount.toStringAsFixed(2)),
                      textWithPadding(""),
                    ],
                  ),
                  ...customersReport.map(
                    (e) => pw.TableRow(
                      children: [
                        textWithPadding(
                          DateFormat('dd-MM-yyyy').format(e.createdAt),
                        ),
                        textWithPadding(e.particulars),
                        textWithPadding(e.vchType.type),
                        textWithPadding(e.vchNo),
                        textWithPadding(
                          e.debit == 0 ? '' : e.debit.toStringAsFixed(2),
                          alignment: pw.Alignment.centerRight,
                          rightPadding: 4,
                        ),
                        textWithPadding(
                          e.credit == 0 ? '' : e.credit.toStringAsFixed(2),
                          alignment: pw.Alignment.centerRight,
                          rightPadding: 4,
                        ),
                      ],
                    ),
                  ),
                  pw.TableRow(
                    children: [
                      textWithPadding(""),
                      boldTextWithPadding("Closing balance"),
                      textWithPadding(""),
                      textWithPadding(""),
                      textWithPadding(
                        totalDebit == 0 ? '' : totalDebit.toStringAsFixed(2),
                        alignment: pw.Alignment.centerRight,
                        rightPadding: 4,
                        border: const pw.Border(
                          top: pw.BorderSide(),
                        ),
                      ),
                      textWithPadding(
                        totalCredit == 0 ? '' : totalCredit.toStringAsFixed(2),
                        alignment: pw.Alignment.centerRight,
                        rightPadding: 4,
                        border: const pw.Border(
                          top: pw.BorderSide(),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      textWithPadding(""),
                      boldTextWithPadding(""),
                      textWithPadding(""),
                      textWithPadding(""),
                      textWithPadding(
                        "",
                      ),
                      textWithPadding(
                        (totalDebit - totalCredit).toStringAsFixed(2),
                        alignment: pw.Alignment.centerRight,
                        rightPadding: 4,
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      textWithPadding(""),
                      boldTextWithPadding(""),
                      textWithPadding(""),
                      textWithPadding(""),
                      boldTextWithPadding(
                        totalDebit == 0 ? '' : totalDebit.toStringAsFixed(2),
                        alignment: pw.Alignment.centerRight,
                        rightPadding: 4,
                        border: const pw.Border(
                          top: pw.BorderSide(),
                          bottom: pw.BorderSide(),
                        ),
                      ),
                      boldTextWithPadding(
                        ((totalDebit - totalCredit) + totalCredit)
                            .toStringAsFixed(2),
                        alignment: pw.Alignment.centerRight,
                        rightPadding: 4,
                        border: const pw.Border(
                          top: pw.BorderSide(),
                          bottom: pw.BorderSide(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]; // Center
        },
      ),
    );
    return pdf.save();
  }

  Future<String> generateCustomerReport(
    DateTime startDate,
    DateTime endDate,
    CustomerModel customerModel, {
    double? previousAmountManually,
  }) async {
    final buffer =
        await generateCustomerReportBuffer(startDate, endDate, customerModel);
    final path = await getPDFFilePath();
    final file = File(path);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Uint8List> generateBarcodePdf(
    PdfPageFormat format,
    List<BarcodeAndPrice> imagesBuffer,
  ) async {
    final pdf = pw.Document();
    final List<pw.MemoryImage> memImages = [];
    for (final element in imagesBuffer) {
      if (element.barcodeBuffer != null) {
        memImages.add(
          pw.MemoryImage(
            element.barcodeBuffer!,
          ),
        );
      }
    }
    // final height = format.height * (imagesBuffer.length / 4).ceil();
    // final pdfFormat = PdfPageFormat(format.width, height);
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.GridView(
            crossAxisCount: 4,
            children: imagesBuffer
                .asMap()
                .map(
                  (key, value) => MapEntry(
                    key,
                    pw.Container(
                      width: format.width,
                      margin: const pw.EdgeInsets.only(left: 10, right: 2),
                      child: pw.Column(
                        children: [
                          pw.Container(
                            margin: const pw.EdgeInsets.only(top: 2, bottom: 2),
                            child: pw.Container(
                              alignment: pw.Alignment.center,
                              child: pw.Text(
                                "Pairav Products",
                                style: pw.TextStyle(
                                  fontSize: 6,
                                  color: PdfColor.fromHex("#0000001A"),
                                ),
                              ),
                            ),
                          ),
                          pw.Container(
                            height: 16,
                            width: format.width - 10,
                            child: pw.BarcodeWidget(
                              color: PdfColor.fromHex("#0000001A"),
                              barcode: pw.Barcode.code128(),
                              data: imagesBuffer[key].barcodeValue,
                              textStyle: const pw.TextStyle(
                                fontSize: 6,
                              ),
                              drawText: false,
                            ),
                          ),
                          pw.Text(
                            imagesBuffer[key].barcodeValue,
                            style: pw.TextStyle(
                              fontSize: 4,
                              color: PdfColor.fromHex("#0000001A"),
                            ),
                          ),
                          pw.SizedBox(height: 2),
                          if (imagesBuffer[key].barcodeType ==
                              BarcodeType.singleProduct)
                            pw.Text(
                              "Rs. ${imagesBuffer[key].amount}",
                              style: pw.TextStyle(
                                fontSize: 8,
                                color: PdfColor.fromHex("#0000001A"),
                                // fontWeight: pw.FontWeight.bold,
                              ),
                            )
                          else
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: imagesBuffer[key]
                                  .prices
                                  .map(
                                    (e) => pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text(
                                          "${e.unitModel.formalName}",
                                          style: pw.TextStyle(
                                            fontSize: 6,
                                            color:
                                                PdfColor.fromHex("#0000001A"),
                                          ),
                                        ),
                                        pw.Text(
                                          "Rs. ${e.mrp}",
                                          style: pw.TextStyle(
                                            fontSize: 6,
                                            color:
                                                PdfColor.fromHex("#0000001A"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                        ],
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          );
        },
      ),
    );
    print(pdf.document.pdfPageList.pages.first.pageFormat);
    return pdf.save();
  }
}
