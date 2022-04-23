import 'package:freezed_annotation/freezed_annotation.dart';

part 'threads.freezed.dart';
part 'threads.g.dart';

@freezed
class ThreadsModel with _$ThreadsModel {
  @JsonSerializable(explicitToJson: true)
  factory ThreadsModel({
    required String number,
    required int stock,
    required DateTime createdAt,
  }) = _ThreadsModel;
  factory ThreadsModel.fromJson(Map<String, dynamic> json) =>
      _$ThreadsModelFromJson(json);
}

List<Map<String, dynamic>> getStockListJson(List<ThreadsModel> stockModelList) {
  return stockModelList.map((e) => e.toJson()).toList();
}
