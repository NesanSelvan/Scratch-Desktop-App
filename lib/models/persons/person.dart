import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enum/person/person.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@unfreezed
abstract class PersonModel with _$PersonModel {
  factory PersonModel(
      {required String id,
      required String name,
      required String email,
      required String address,
      required int pincode,
      required String state,
      @Default(PersonEnum.Customer) PersonEnum type,
      required int mobileNo,
      DateTime? createdAt}) = _PersonModel;
  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}

List<Map<String, dynamic>> getPersonListJson(
    List<PersonModel> personModelList) {
  return personModelList.map((e) => e.toJson()).toList();
}
