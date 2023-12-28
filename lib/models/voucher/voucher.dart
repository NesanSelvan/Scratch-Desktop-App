import 'package:freezed_annotation/freezed_annotation.dart';

import '../persons/employee/employee.dart';

part 'voucher.freezed.dart';
part 'voucher.g.dart';

@unfreezed
abstract class VoucherModel with _$VoucherModel {
  @JsonSerializable(explicitToJson: true)
  factory VoucherModel(
      {required String id,
      required String voucherNo,
      required double givenAmount,
      required String paymentMethod,
      required String description,
      required EmployeeModel givenTo,
      required String paymentId,
      @Default(false) bool isAdvance,
      required DateTime createdAt}) = _VoucherModel;
  factory VoucherModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherModelFromJson(json);
}

List<Map<String, dynamic>> getVoucherListJson(List<VoucherModel> list) {
  return list.map((e) => e.toJson()).toList();
}
