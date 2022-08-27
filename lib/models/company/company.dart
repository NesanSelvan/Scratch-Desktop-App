import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
abstract class CompanyModel with _$CompanyModel {
  @JsonSerializable(explicitToJson: true)
  const factory CompanyModel(
      {required String id,
      required String name,
      required String address,
      int? companyNo,
      @Default("") String? email,
      @Default("") String? website,
      @Default("") String? licNO,
      @Default("") String? placeOfDispatch,
      @Default("") String? pan,
      required String mobileNoList,
      @Default("") String? gstin,
      @Default("") String? bankId,
      @Default(true) bool? isNormalPurchaseBill,
      required DateTime createdAt}) = _CompanyModel;
  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}

List<Map<String, dynamic>> getCompanyListJson(List<CompanyModel> list) {
  return list.map((e) => e.toJson()).toList();
}
