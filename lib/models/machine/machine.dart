import 'package:freezed_annotation/freezed_annotation.dart';

part 'machine.freezed.dart';
part 'machine.g.dart';

@unfreezed
abstract class MachineModel with _$MachineModel {
  factory MachineModel(
    String id,
    String machineName,
  ) = _MachineModel;
  factory MachineModel.fromJson(Map<String, dynamic> json) =>
      _$MachineModelFromJson(json);
}
