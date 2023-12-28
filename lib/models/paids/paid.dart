import 'package:freezed_annotation/freezed_annotation.dart';

part 'paid.freezed.dart';
part 'paid.g.dart';

@unfreezed
abstract class PaidModel with _$PaidModel {
  factory PaidModel(
    String id,
    String billId,
  ) = _PaidModel;
  factory PaidModel.fromJson(Map<String, dynamic> json) =>
      _$PaidModelFromJson(json);
}
