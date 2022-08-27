import 'package:freezed_annotation/freezed_annotation.dart';

part 'borrow.freezed.dart';
part 'borrow.g.dart';

@freezed
abstract class BorrowModel with _$BorrowModel {
  const factory BorrowModel(
    String id,
    String billId,
  ) = _BorrowModel;
  factory BorrowModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowModelFromJson(json);
}
