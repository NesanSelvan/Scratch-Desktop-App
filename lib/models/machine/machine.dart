import 'package:freezed_annotation/freezed_annotation.dart';

part 'machine.freezed.dart';
part 'machine.g.dart';

@freezed
abstract class MachineModel with _$MachineModel {
  const factory MachineModel(
    String id,
    String machineName,
  ) = _MachineModel;
  factory MachineModel.fromJson(Map<String, dynamic> json) =>
      _$MachineModelFromJson(json);
}
