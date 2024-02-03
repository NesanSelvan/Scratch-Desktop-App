import 'package:annai_store/core/util/network/network.dart';
import 'package:annai_store/features/upload_file/data/data_source/remote_data_source.dart';
import 'package:annai_store/features/upload_file/data/repository/upload_file_repository.dart';
import 'package:annai_store/features/upload_file/domain/repository/upload_file_repository.dart';
import 'package:annai_store/features/upload_file/domain/usecase/get_file.dart';
import 'package:annai_store/features/upload_file/domain/usecase/upload_file.dart';
import 'package:annai_store/features/upload_file/presentation/manager/upload_file_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory<NetworkHandler>(() => NetworkHandler());
  sl.registerFactory<UploadFileRemoteDataSource>(
    () => UploadFileRemoteDataSourceImpl(networkHandler: sl()),
  );
  sl.registerFactory<UploadFileRepository>(
    () => UploadFileRepositoryImpl(dataSource: sl()),
  );
  sl.registerFactory<UploadFileUseCase>(
    () => UploadFileUseCase(repository: sl()),
  );
  sl.registerFactory<GetFileUseCase>(
    () => GetFileUseCase(repository: sl()),
  );
  sl.registerFactory<UploadFileCubit>(() => UploadFileCubit(sl(), sl()));
}
