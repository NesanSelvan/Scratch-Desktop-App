import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:annai_store/models/tax_cal/tax_cal.dart';

class PurchaseCalculation {
  double getDiscountCal(double amount, double disPer) {
    return double.parse((amount * (disPer / 100)).toStringAsFixed(2));
  }

  double getDiscountAmount(double amount, double discountPer) {
    return double.parse("${amount - discountPer}");
  }

  double taxAmount(double amount, double tax) {
    return amount * (tax / 100);
  }

  static List<TaxCalModel> getTaxCalModel(PurchaseModel billModel) {
    final List<TaxCalModel> taxCalList = [];

    for (final item in billModel.productList) {
      final amount = item.qty * item.amount;
      final taxCalModel = TaxCalModel(
        tax: item.categoryModel.tax,
        hsnCode: item.categoryModel.hsnCode,
        taxableVal: item.amount,
        amount: double.parse(calculateTax(amount, item.tax).toStringAsFixed(2)),
        rate: item.categoryModel.tax,
        totalTaxAmount:
            double.parse(calculateTax(amount, item.tax).toStringAsFixed(2)),
      );
      taxCalList.add(taxCalModel);
    }

    return taxCalList;
  }
}
