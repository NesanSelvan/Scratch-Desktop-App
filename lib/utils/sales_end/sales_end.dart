import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../file/file.dart';
import '../folder/folder.dart';

// ignore: avoid_classes_with_only_static_members
class SalesEnd {
  static final String _dbFolderPath = FolderUtility.getDBFolderLocation();
  static final String _dbName = FileUtility.getDBFileName();
  static Future<void> init() async {
    final todaysDate = DateTime.now();
    if (todaysDate.day == 1 && todaysDate.month == 4) {
      log("Changing to new DB");
      final oldDB = File("$_dbFolderPath/$_dbName");
      final oldDBString = await oldDB.readAsString();
      final oldDBJson = jsonDecode(oldDBString) as Map<String, dynamic>;
      if (oldDBJson.containsKey("is_modified")) {
        if (oldDBJson["is_modified"] == false) {
          _createNewDBFile(todaysDate);
        } else {
          if (todaysDate.day == 2) {
            final g = File("$_dbFolderPath/$_dbName");
            final gStr = await g.readAsString();
            final gJson = jsonDecode(gStr) as Map<String, dynamic>;
            gJson["is_modified"] = false;
            await File("$_dbFolderPath/$_dbName")
                .writeAsString(jsonEncode(gJson));
          }
        }
      } else {
        _createNewDBFile(todaysDate);
      }
    }
  }

  static Future<void> _deleteOldDB() async {
    await File("$_dbFolderPath/$_dbName").delete();
  }

  static File _backupOldDBFile(DateTime dateTime) {
    final newFolderPath =
        "$_dbFolderPath/db-${dateTime.year - 1}-${dateTime.year}/";
    FolderUtility.createDirIfNotExists(newFolderPath);
    File("$_dbFolderPath/$_dbName").copySync("$newFolderPath/$_dbName");
    log("New Copy Created at $newFolderPath/$_dbName");
    return File("$newFolderPath/$_dbName");
  }

  static Future<void> _createNewDBFile(DateTime time) async {
    final newFile = _backupOldDBFile(time);
    await _deleteOldDB();
    final dbString = await newFile.readAsString();
    // log("DB Data : $dbString");
    final dbJson = jsonDecode(dbString) as Map<String, dynamic>;
    // log("DB Json : $dbJson");
    final dbSaveJson = {
      "category": dbJson["category"],
      "customers": dbJson["customers"],
      "employees": dbJson["employees"],
      "company": dbJson["company"],
      "products": dbJson["products"],
      "sales": [],
      "sewing_service": [],
      "quotations": [],
      "stocks": dbJson["stocks"],
      "threads": dbJson["threads"],
      "sub_products": dbJson["sub_products"],
      "orders": [],
      "estimates": [],
      "receipts": [],
      "vouchers": [],
      "purchases": [],
      "payments": [],
      "paths": dbJson["paths"],
      "banks": dbJson["banks"],
      "units": dbJson["units"],
      "is_modified": true,
    };
    log("Saved DB Json : $dbSaveJson");
    log("Saved DB Json : ${dbSaveJson['orders']}");
    File("$_dbFolderPath/$_dbName").writeAsStringSync(jsonEncode(dbSaveJson));
    // .writeAsString()
    // log("Wrote new Data in ${writeFile.path}");
  }
}
