import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_cal.freezed.dart';
part 'tax_cal.g.dart';

@freezed
class TaxCalModel with _$TaxCalModel {
  factory TaxCalModel({
    required int hsnCode,
    required double taxableVal,
    required double tax,
    required double amount,
    required double rate,
    required double totalTaxAmount,
  }) = _TaxCalModel;
  factory TaxCalModel.fromJson(Map<String, dynamic> json) =>
      _$TaxCalModelFromJson(json);
}
