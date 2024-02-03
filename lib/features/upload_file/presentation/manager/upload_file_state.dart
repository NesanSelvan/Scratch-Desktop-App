part of 'upload_file_cubit.dart';

sealed class UploadFileState extends Equatable {
  const UploadFileState();

  @override
  List<Object> get props => [];
}

final class UploadFileInitial extends UploadFileState {}

final class UploadFileLoading extends UploadFileState {}

final class UploadFileLoaded extends UploadFileState {}

final class GetFileLoaded extends UploadFileState {}

final class UploadFileError extends UploadFileState {
  final Failure failure;

  const UploadFileError({required this.failure});
}
