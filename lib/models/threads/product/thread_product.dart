import 'package:freezed_annotation/freezed_annotation.dart';

import '../../product/product.dart';
import '../threads.dart';

part 'thread_product.freezed.dart';
part 'thread_product.g.dart';

@unfreezed
class ThreadProductModel with _$ThreadProductModel {
  @JsonSerializable(explicitToJson: true)
  factory ThreadProductModel({
    required String id,
    required ProductModel product,
    @Default([]) List<ThreadsModel> threads,
    required DateTime createdAt,
  }) = _ThreadProductModel;
  factory ThreadProductModel.fromJson(Map<String, dynamic> json) =>
      _$ThreadProductModelFromJson(json);
}

List<Map<String, dynamic>> getThreadProductListJson(
    List<ThreadProductModel> stockModelList) {
  return stockModelList.map((e) => e.toJson()).toList();
}
