import 'dart:developer';

import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/models/unit/new_unit.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/utils/encrypt.dart';
import 'package:annai_store/utils/file/file.dart';
import 'package:annai_store/utils/folder/folder.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppHiveDB {
  static final AppHiveDB _instance = AppHiveDB._();

  AppHiveDB._();

  static AppHiveDB get instance => _instance;

  BoxCollection? boxCollection;
  CollectionBox<Unit>? unitBox;

  Future<void> initialize() async {
    final key = await EncryptData.getDBKey();
    final fileName = "\\${FileUtility.getAppsFileName()}";
    final folderPath = "${FolderUtility.getDBFolderLocation()}\\";
    log("fileName: $fileName, folderPath: $folderPath");
    boxCollection = await BoxCollection.open(
      fileName,
      {"units"},
      key: HiveAesCipher(key),
      path: folderPath,
    );
    log("boxCollection: $boxCollection");
    unitBox = await boxCollection?.openBox<Unit>('units');
  }

  Future<void> migrateDBToHive() async {
    final allUnits = Database.instance.getAllUnits();
    await unitBox?.flush();
    for (final unit in allUnits) {
      // log(unit.symbol ?? "No Symbiol");
      // log("unitBox: ${unitBox?.name}");
      await unitBox?.put(unit.id!, unit.unit);
    }
  }

  Future<Map<String, Unit>> get getAllUnits async {
    return unitBox!.getAllValues();
  }
}
