import 'package:freezed_annotation/freezed_annotation.dart';

part 'paths.freezed.dart';
part 'paths.g.dart';

@unfreezed
class PathsModel with _$PathsModel {
  @JsonSerializable(explicitToJson: true)
  factory PathsModel({
    required String id,
    required String name,
    required String path,
    required DateTime createdAt,
  }) = _PathsModel;
  factory PathsModel.fromJson(Map<String, dynamic> json) =>
      _$PathsModelFromJson(json);
}

List<Map<String, dynamic>> getPathsListJson(List<PathsModel> list) {
  return list.map((e) => e.toJson()).toList();
}
