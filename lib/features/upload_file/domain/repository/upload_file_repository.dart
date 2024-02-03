import 'dart:io';

import 'package:annai_store/models/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UploadFileRepository {
  Future<Either<Failure, bool>> uploadFileToServer(File file);
  Future<Either<Failure, Map<String, dynamic>>> getFileFromServer(
    String filePath,
  );
}
