import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel(
      {required String id,
      required String name,
      String? email,
      required String address,
      required int pincode,
      required String state,
      required String type,
      required bool isPending,
      required int mobileNo,
      String? gstin,
      @Default(0) double pendingAmount,
      DateTime? createdAt}) = _CustomerModel;
  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

List<Map<String, dynamic>> getCustomerListJson(
    List<CustomerModel> customerModelList) {
  return customerModelList.map((e) => e.toJson()).toList();
}
