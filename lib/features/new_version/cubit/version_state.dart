// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'version_cubit.dart';

class VersionState {
  final NewVersionModel? versionModel;

  VersionState({
    this.versionModel,
  });

  VersionState copyWith({
    NewVersionModel? versionModel,
  }) {
    return VersionState(
      versionModel: versionModel ?? this.versionModel,
    );
  }

  @override
  String toString() => 'VersionState(versionModel: $versionModel)';

  @override
  bool operator ==(covariant VersionState other) {
    if (identical(this, other)) return true;

    return other.versionModel == versionModel;
  }

  @override
  int get hashCode => versionModel.hashCode;
}
