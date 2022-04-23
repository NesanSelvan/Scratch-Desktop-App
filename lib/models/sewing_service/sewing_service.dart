import 'package:freezed_annotation/freezed_annotation.dart';

import '../customer/customer.dart';

part 'sewing_service.freezed.dart';
part 'sewing_service.g.dart';

@freezed
abstract class SewingService with _$SewingService {
  @JsonSerializable(explicitToJson: true)
  const factory SewingService(
      {required String id,
      required String billNo,
      required CustomerModel? customerModel,
      required DateTime dateTime}) = _SewingService;
  factory SewingService.fromJson(Map<String, dynamic> json) =>
      _$SewingServiceFromJson(json);
}

List<Map<String, dynamic>> getSewingServiceListJson(List<SewingService> list) {
  return list.map((e) => e.toJson()).toList();
}
