import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statement_by_hsn.freezed.dart';
part 'statement_by_hsn.g.dart';

@unfreezed
abstract class StatementByHSN with _$StatementByHSN {
  factory StatementByHSN(
    String id,
    BillModel billModel,
    CategoryModel categoryModel,
    double amount,
    double tax,
    double taxableValue,
    DateTime createdAt,
  ) = _StatementByHSN;
  factory StatementByHSN.fromJson(Map<String, dynamic> json) =>
      _$StatementByHSNFromJson(json);
}

List<Map<String, dynamic>> getStockListJson(
  List<StatementByHSN> stockModelList,
) {
  return stockModelList.map((e) => e.toJson()).toList();
}
