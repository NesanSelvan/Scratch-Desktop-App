import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../enum/paths/paths.dart';
import '../../../models/failure/failure.dart';
import '../../../models/paths/paths.dart';

class PathsDB {
  final storage = Database().storage;
  List<PathsModel> getAllPath() {
    try {
      final data = Database().storage.getItem('paths');
      // debugPrint('Path Item: $data');

      final List<PathsModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          // debugPrint('PathsModel Item: $item');
          datas.add(PathsModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Path Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> addPathToDb(PathsModel pathsModel) async {
    try {
      final datas = [...getAllPath(), pathsModel];

      await updatePathToDB(datas);
    } catch (e) {
      throw Failure("$e");
    }
  }

  Future<void> updatePathToDB(List<PathsModel> pathsList) async {
    final pathsListMap = getPathsListJson(pathsList);
    debugPrint("$pathsListMap");
    await storage.setItem("paths", pathsListMap);
  }

  Future<void> deletePath(PathsModel pathsModel) async {
    final datas = getAllPath();
    datas.remove(pathsModel);
    await updatePathToDB(datas);
  }

  Future<void> updatePath(PathsModel pathsModel) async {
    final customerList = getAllPath();
    final datas =
        customerList.where((element) => element.id == pathsModel.id).toList();
    final index = customerList.indexOf(datas[0]);
    customerList[index] = pathsModel;
    await updatePathToDB(customerList);
  }

  PathsModel getPathModelById(String id) {
    return getAllPath().where((element) => element.id == id).toList().first;
  }

  Future<void> resetPath() async {
    await storage.setItem("paths", []);
  }

  Future<void> addExcelPathToDB() async {
    debugPrint("Adding Excel to Path...");
    await addPathToDb(
      PathsModel(
        id: const Uuid().v4(),
        name: getStrFromPathEnum(PathEnum.Excel),
        path:
            "C://Program Files (x86)/Microsoft Office/root/Office16/EXCEL.EXE",
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> addThermalPrinterPathToDB() async {
    debugPrint("Adding Thermal Printer to Path...");
    await addPathToDb(
      PathsModel(
        id: const Uuid().v4(),
        name: getStrFromPathEnum(PathEnum.ThermalPrinter),
        path: "",
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> addNormalPathToDB() async {
    debugPrint("Adding Normal Printer to Path...");
    await addPathToDb(
      PathsModel(
        id: const Uuid().v4(),
        name: getStrFromPathEnum(PathEnum.NormalPrinter),
        path: "",
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> addChromePathToDB() async {
    debugPrint("Adding Excel to Path...");
    await addPathToDb(
      PathsModel(
        id: const Uuid().v4(),
        name: getStrFromPathEnum(PathEnum.Pdf),
        path: "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe",
        createdAt: DateTime.now(),
      ),
    );
  }

  String? getExcelPath() {
    final allPath = getAllPath();
    for (final item in allPath) {
      if (item.name == getStrFromPathEnum(PathEnum.Excel)) {
        return item.path;
      }
    }
    return null;
  }

  String? getChromePath() {
    final allPath = getAllPath();
    for (final item in allPath) {
      if (item.name == getStrFromPathEnum(PathEnum.Pdf)) {
        return item.path;
      }
    }
    return null;
  }

  String? getThermalPrinterPath() {
    final allPath = getAllPath();
    for (final item in allPath) {
      if (item.name == getStrFromPathEnum(PathEnum.ThermalPrinter)) {
        return item.path;
      }
    }
    return null;
  }

  String? getNormalPrinterPath() {
    final allPath = getAllPath();
    for (final item in allPath) {
      if (item.name == getStrFromPathEnum(PathEnum.NormalPrinter)) {
        return item.path;
      }
    }
    return null;
  }

  String? getBarcodePrinterPath() {
    final allPath = getAllPath();
    for (final item in allPath) {
      if (item.name == getStrFromPathEnum(PathEnum.BarcodePrinterStr)) {
        return item.path;
      }
    }
    return null;
  }

  String? getUPIImagePrinterPath() {
    final allPath = getAllPath();
    for (final item in allPath) {
      if (item.name == getStrFromPathEnum(PathEnum.UPIImage)) {
        return item.path;
      }
    }
    return null;
  }
}
