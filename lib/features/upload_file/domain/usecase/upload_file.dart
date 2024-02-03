import 'dart:io';

import 'package:annai_store/core/usecases/usecase.dart';
import 'package:annai_store/features/upload_file/domain/repository/upload_file_repository.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:dartz/dartz.dart';

class UploadFileUseCase extends UseCase<bool, UploadFileParams> {
  final UploadFileRepository repository;

  UploadFileUseCase({required this.repository});
  @override
  Future<Either<Failure, bool>> call(UploadFileParams params) {
    return repository.uploadFileToServer(params.file);
  }
}

class UploadFileParams {
  final File file;

  UploadFileParams({required this.file});
}
