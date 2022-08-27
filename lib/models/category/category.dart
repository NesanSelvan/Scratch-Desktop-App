import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel(
      {required String id,
      String? catSymbol,
      required int hsnCode,
      int? categoryNo,
      required String category,
      required double tax,
      required DateTime dateTime}) = _CategoryModel;
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

List<Map<String, dynamic>> getCategoryListJson(
    List<CategoryModel> categoryModelList) {
  return categoryModelList.map((e) => e.toJson()).toList();
}
