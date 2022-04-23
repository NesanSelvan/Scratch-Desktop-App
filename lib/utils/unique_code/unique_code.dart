import 'package:annai_store/models/category/category.dart';
import 'package:custom/ftn.dart';

import '../../models/company/company.dart';
import '../../models/unit/unit.dart';

class UniqueCode {
  String? getBarcodeUniqueCode(
      int? productNumber,
      CategoryModel categoryModel,
      UnitModel unitModel,
      double purchasePrice,
      double wholesalePrice,
      double retailPrice,
      double mrpPrice,
      CompanyModel companyModel) {
    if (productNumber == null ||
        categoryModel.categoryNo == null ||
        unitModel.unitNo == null ||
        companyModel.companyNo == null) {
      CustomUtilies.customFailureSnackBar(
        "Error",
        "Error in getting Barcode Please check Whether the number is mentioned properly",
      );
      return null;
    } else {
      return "$productNumber|${categoryModel.categoryNo}|${unitModel.unitNo}|${companyModel.companyNo}|$purchasePrice|$wholesalePrice|$retailPrice|$mrpPrice";
    }
  }
}
