import 'dart:io';

import 'package:annai_store/features/upload_file/data/data_source/remote_data_source.dart';
import 'package:annai_store/features/upload_file/domain/repository/upload_file_repository.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:dartz/dartz.dart';

class UploadFileRepositoryImpl extends UploadFileRepository {
  final UploadFileRemoteDataSource dataSource;

  UploadFileRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, bool>> uploadFileToServer(File file) async {
    try {
      await dataSource.uploadFileToServer(file);
      return const Right(true);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getFileFromServer(
    String filePath,
  ) async {
    try {
      final response = await dataSource.getFileFromServer(filePath);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
