import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/features/upload_file/domain/usecase/get_file.dart';
import 'package:annai_store/features/upload_file/domain/usecase/upload_file.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:annai_store/utils/file/file.dart';
import 'package:annai_store/utils/folder/folder.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  final UploadFileUseCase uploadFileUseCase;
  final GetFileUseCase getFileUseCase;

  UploadFileCubit(this.uploadFileUseCase, this.getFileUseCase)
      : super(UploadFileInitial());

  Future<void> uploadDBFile() async {
    final dbFile = File(FileUtility.getFullDBFilePath());
    emit(UploadFileLoading());
    final response =
        await uploadFileUseCase.call(UploadFileParams(file: dbFile));
    response.fold((l) {
      emit(UploadFileError(failure: l));
    }, (r) {
      emit(UploadFileLoaded());
    });
  }

  Future<void> getDBFileAndUpdateDB() async {
    emit(UploadFileLoading());
    final dbFileName = FileUtility.getDBFileName();
    log("getDBFileAndUpdateDB: $dbFileName");
    final response = await getFileUseCase.call(dbFileName);
    log("getDBFileAndUpdateDB: $response");
    response.fold((l) {
      emit(UploadFileError(failure: l));
    }, (r) async {
      final file = File("${FolderUtility.getDBFolderLocation()}/$dbFileName");
      await file.writeAsString(jsonEncode(r));
      log("FILE: ${file.readAsStringSync()}");
      Database.instance.initialize();

      emit(GetFileLoaded());
    });
  }
}
