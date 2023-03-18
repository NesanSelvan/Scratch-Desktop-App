import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/product/product.dart';

class BasicCalculation {
  double calculateAmountWithTax(
    ProductModel productModel,
    CategoryModel categoryModel,
    double qty,
  ) {
    final amount = qty * productModel.sellingPrice;
    return amount + (amount * (categoryModel.tax / 100));
  }

  static double calculateTax(double tax, double price) {
    return price + (price * (tax / 100));
  }

  double calculateAmountWithoutTax(double tax, double price) {
    return price / (1 + (tax / 100));
  }
}
