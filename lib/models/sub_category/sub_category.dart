import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category.freezed.dart';
part 'sub_category.g.dart';

@freezed
abstract class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel(String? id, int? hsnCode,
      String? subCategoryName, DateTime createdAt) = _SubCategoryModel;
  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}
