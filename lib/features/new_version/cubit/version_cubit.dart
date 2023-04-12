import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:annai_store/features/loader/cubit/cubit/loader_cubit.dart';
import 'package:annai_store/features/new_version/models/version.dart';
import 'package:annai_store/utils/file/file.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

part 'version_state.dart';

class VersionCubit extends Cubit<VersionState> {
  VersionCubit() : super(VersionState());

  Future<void> fetchLatestVersion() async {
    try {
      final strData = await Utility().checkCurrentVersion();

      final jsonData = jsonDecode(strData) as Map<String, dynamic>;
      final version = NewVersionModel.fromJson(jsonData);
      emit(state.copyWith(versionModel: version));
    } catch (e, s) {
      print(s);
    }
  }

  Future<void> downloadNewVersion(BuildContext context) async {
    final dio = Dio();
    final fileDownloadPath =
        "${(await getApplicationDocumentsDirectory()).path}/${FileUtility.getAppsFileName()}.exe";
    context.read<LoaderCubit>().updateLoading(1);
    await dio.download(
      "https://github.com/AgnelSelvan/AgnelSelvan.github.io/raw/main/${FileUtility.getAppsFileName()}/${FileUtility.getGithubExeName()}.exe",
      fileDownloadPath,
      onReceiveProgress: (received, total) {
        final progress = (received / total) * 100;
      },
    );
    if (context.mounted) {
      context.read<LoaderCubit>().updateLoading(100);
    }
    await openExeFile(fileDownloadPath);
  }

  Future<void> openExeFile(String filePath) async {
    log("filePath: $filePath");
    await Process.start(filePath, ["-t", "-l", "1000"]).then((value) {});
  }
}
