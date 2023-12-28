import 'package:freezed_annotation/freezed_annotation.dart';

part 'borrow.freezed.dart';
part 'borrow.g.dart';

@unfreezed
abstract class BorrowModel with _$BorrowModel {
  factory BorrowModel(
    String id,
    String billId,
  ) = _BorrowModel;
  factory BorrowModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowModelFromJson(json);
}
