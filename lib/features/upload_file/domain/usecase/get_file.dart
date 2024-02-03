import 'package:annai_store/core/usecases/usecase.dart';
import 'package:annai_store/features/upload_file/domain/repository/upload_file_repository.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:dartz/dartz.dart';

class GetFileUseCase extends UseCase<Map<String, dynamic>, String> {
  final UploadFileRepository repository;

  GetFileUseCase({required this.repository});
  @override
  Future<Either<Failure, Map<String, dynamic>>> call(String params) {
    return repository.getFileFromServer(params);
  }
}
