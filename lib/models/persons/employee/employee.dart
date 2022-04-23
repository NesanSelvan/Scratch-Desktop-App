import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
abstract class EmployeeModel with _$EmployeeModel {
  const factory EmployeeModel(
      {required String id,
      required String name,
      required String email,
      required String address,
      required int pincode,
      required String state,
      required String type,
      required int mobileNo,
      required String password,
      DateTime? createdAt}) = _EmployeeModel;
  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}

List<Map<String, dynamic>> getEmployeeListJson(
    List<EmployeeModel> personModelList) {
  return personModelList.map((e) => e.toJson()).toList();
}
