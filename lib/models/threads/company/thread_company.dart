import 'package:freezed_annotation/freezed_annotation.dart';

import '../../company/company.dart';
import '../product/thread_product.dart';

part 'thread_company.freezed.dart';
part 'thread_company.g.dart';

@freezed
class ThreadCompanyModel with _$ThreadCompanyModel {
  @JsonSerializable(explicitToJson: true)
  factory ThreadCompanyModel({
    required String id,
    required CompanyModel companyModel,
    required ThreadProductModel threadProduct,
    required DateTime createdAt,
  }) = _ThreadCompanyModel;
  factory ThreadCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ThreadCompanyModelFromJson(json);
}

List<Map<String, dynamic>> getThreadCompanyListJson(
    List<ThreadCompanyModel> stockModelList) {
  return stockModelList.map((e) => e.toJson()).toList();
}
