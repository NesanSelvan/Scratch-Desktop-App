import 'dart:io';

import 'package:flutter/foundation.dart';

import '../file/file.dart';
import '../folder/folder.dart';

class BackupUtility {
  String filePath = FolderUtility.getDBFolderLocation();
  String imagesPath = "${FolderUtility.getDBFolderLocation()}\\images";
  String databasePath = FileUtility.getFullDBFilePath();

  Future<void> backup(String backup) async {
    final filesList = Directory(imagesPath).listSync();
    final List<File> imagesList = [];
    for (final file in filesList) {
      imagesList.add(File(file.path));
    }
    final backupDirPath = "$backup\\${FolderUtility.getAppsFolderName()}\\";
    final backupDir = Directory(backupDirPath);
    backupDir.createDirIfNotExists();

    final backupDirImagePath = backupDirPath + r"\images\";
    final backupImagesDir = Directory(backupDirImagePath);
    await backupImagesDir.createDirIfNotExists();

    for (final file in imagesList) {
      // backupDirImagePath + file.path.split(r"\").last
      debugPrint(file.path);
      await File(file.path)
          .copy(backupDirImagePath + file.path.split(r"\").last);
    }

    await File(databasePath)
        .copy(backupDirPath + databasePath.split(r"\").last);
  }

  Future<void> restore(String restore) async {
    final filesList =
        Directory("$restore\\${FolderUtility.getAppsFolderName()}\\images")
            .listSync();
    final List<File> imagesList = [];
    for (final file in filesList) {
      imagesList.add(File(file.path));
    }

    for (final file in imagesList) {
      // backupDirImagePath + file.path.split(r"\").last
      debugPrint(file.path);
      await File(file.path).copy(imagesPath + file.path.split(r"\").last);
    }
    await File(restore + FileUtility.getFullDBFilePath()).copy(databasePath);
  }
}

extension CreateDirIfNotExists on Directory {
  Future<void> createDirIfNotExists() async {
    if (!(await exists())) {
      await create();
    }
  }
}
