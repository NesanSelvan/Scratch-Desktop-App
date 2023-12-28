import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';
part 'bank.g.dart';

@unfreezed
class BankModel with _$BankModel {
  @JsonSerializable(explicitToJson: true)
  factory BankModel({
    required String id,
    required String accountNo,
    required String bankHolderName,
    required String ifscCode,
    required String bankName,
    @Default("") String? branch,
    required DateTime createdAt,
  }) = _BankModel;
  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);
}

List<Map<String, dynamic>> getBanksListJson(List<BankModel> list) {
  return list.map((e) => e.toJson()).toList();
}
