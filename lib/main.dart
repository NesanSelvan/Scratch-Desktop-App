import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/core/db/hive_db.dart';
import 'package:annai_store/main_common.dart';
import 'package:annai_store/models/unit/new_unit.dart';
import 'package:annai_store/utils/file/file.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  createServer();
  // print('Server started: ${server.address} port ${server.port}');
  // handleRequests(server);

  await Hive.initFlutter();
  Hive.registerAdapter(UnitAdapter());
  AppHiveDB.instance.initialize();

  mainCommon();
}

Future<void> createServer() async {
  final address = InternetAddress.loopbackIPv4;
  debugPrint("Create Server Address : ${address.address}");
  final server = await HttpServer.bind(address, localhostPort);
  await for (final req in server) {
    final contentType = req.headers.contentType;
    final response = req.response;
    print("Request Method: ${req.method}");
    if (req.method == 'POST' &&
        contentType?.mimeType == 'application/json' /*1*/) {
      try {
        print("${response.statusCode}");
        final String content = await utf8.decoder.bind(req).join(); /*2*/
        final data = jsonDecode(content) as Map; /*3*/
        // var fileName = req.uri.pathSegments.last; /*4*/
        // await File(fileName).writeAsString(content, mode: FileMode.write);
        CustomUtilies.customSuccessSnackBar(
          "Success",
          "Some Data has been received",
        );
        debugPrint("Data : $data");
        final File file = File(FileUtility.getFullDBFilePath());
        file.writeAsString("${data["fileData"]}");
        req.response
          ..statusCode = HttpStatus.ok
          ..write('Wrote data for ${data['name']}.');
      } catch (e) {
        response
          ..statusCode = HttpStatus.internalServerError
          ..write('Exception during file I/O: $e.');
      }
    } else {
      response
        ..statusCode = HttpStatus.methodNotAllowed
        ..write('Unsupported request: ${req.method}.');
    }
    await response.close();
  }
}

Future<void> handleRequests(HttpServer server) async {
  await for (final request in server) {
    request.response.write('Hello from a Dart server');
    if (request.method == 'POST' /*1*/) {
      await handlePost(request);
    }
    await request.response.close();
  }
}

Future<void> handlePost(HttpRequest request) async {
  final contentType = request.headers.contentType;
  final response = request.response;
  print("Request Method: ${request.method}");

  try {
    print("${response.statusCode}");
    final String content = await utf8.decoder.bind(request).join(); /*2*/
    final data = jsonDecode(content) as Map; /*3*/
    // var fileName = request.uri.pathSegments.last; /*4*/
    // await File(fileName).writeAsString(content, mode: FileMode.write);
    request.response
      ..statusCode = HttpStatus.ok
      ..write('Wrote data for ${data['name']}.');
  } catch (e) {
    response
      ..statusCode = HttpStatus.internalServerError
      ..write('Exception during file I/O: $e.');
  }

  // try {
  // final streamString = utf8.decoder.bind(request);
  // streamString.asBroadcastStream().listen((String? data) {
  //   debugPrint("Content : ${data}");
  // });
  // // String content = await utf8.decoder.bind(request).join(); /*2*/

  // // var data = jsonDecode(content) as Map; /*3*/
  // // var fileName = request.uri.pathSegments.last; /*4*/
  // // await File(fileName).writeAsString(content, mode: FileMode.write);
  // request.response
  //   ..statusCode = HttpStatus.ok
  //   ..write('Wrote data for.');
  // } catch (e) {
  //   request.response
  //     ..statusCode = HttpStatus.internalServerError
  //     ..write('Exception during file I/O: $e.');
  // }
  // debugPrint("${request.response.bufferOutput}");
  // debugPrint(
  //     "${await utf8.decoder.bind(request).asBroadcastStream.toString()}");
  // //final myStringStorage = await utf8.decoder.bind(request).any();

  // //debugPrint(myStringStorage);
  // request.response
  //   ..write('Got it. Thanks.')
  //   ..close();
}

// Sarch by Code and product Name only in Sales Bill
//Search by Option in Product

// Solve Under Maintenance
// Fix Product with same with different Unit - Done
// 2 Page Bill
// Purchase Discount in Amount not in Percentage - Done


//ADD to Custom Package
//add_inkwell.dart , full_container.dart

///TODO Receipt
//Put receipt by mobile no or name - DOne
//Put receipt by bill No - Done

///TODO Estimate
//A button to convert from estimate to sales billing - Done
// Convert all Estimate -> ESale
// Remove Bill No in Estimate History in Future

///TODO Billing System
//Add Product by Code and Product Name - Done
// Edit Bill option Needed - Done
// If Printed in A4 Size disable edit option in Billing System -Done
// Search Customer by mobile No

///TODO Voucher
//Check Voucher - Done

///TODO Overall
// Keep Multiple Type option for Customer Management Eg. MRP and Tailor for Single Customer


//TODO Payment
//STatement Needed 
//Take Statement by All and by Purchase Company Name

//TODO 
// excwl purchase grand total


// no gst no in sewing service
//

// TODO: 11/04
// Unit Model