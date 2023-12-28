import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_product_details.freezed.dart';
part 'sub_product_details.g.dart';

@unfreezed
abstract class SubProductDetailsModel with _$SubProductDetailsModel {
  @JsonSerializable(explicitToJson: true)
  factory SubProductDetailsModel(
      {required String id,
      required String productNumber,
      @Default("") String name,
      required int stock,
      @Default([]) List<String> imagesList,
      required DateTime createdAt}) = _SubProductDetailsModel;

  factory SubProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SubProductDetailsModelFromJson(json);
}

List<Map<String, dynamic>> getSubProductDetailsListJson(
    List<SubProductDetailsModel> list) {
  return list.map((e) => e.toJson()).toList();
}
