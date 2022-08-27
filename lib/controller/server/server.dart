import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../enum/action.dart';
import '../../enum/message_type.dart';
import '../../models/failure/failure.dart';
import '../../models/message.dart';
import '../../models/server/server.dart';

final barcodeController = TextEditingController();

class ServerController extends GetxController {
  Server? server;
  List<MessageModel> serverLogs = [];
  TextEditingController serverController = TextEditingController();
  // MessageModel? messageModel;

  Future<String> getIp() async {
    for (final interface in await NetworkInterface.list()) {
      debugPrint('== Interface: ${interface.name} ==');
      if (interface.name.toLowerCase().contains("wi")) {
        for (final addr in interface.addresses) {
          return addr.address;
        }
      }
      for (final addr in interface.addresses) {
        return addr.address;
      }
    }
    throw Failure("Error in starting server");
    // return null;
  }

  Future<void> startServer() async {
    try {
      final ipAdd = await getIp();
      debugPrint("Ip Address : $ipAdd");
      if (server!.running) {
        await server!.stop();
        serverLogs.clear();
      } else {
        await server!.start(ipAdd);
      }
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "$e");
    }
    update();
  }

  @override
  void onInit() {
    server = Server(
      onData: onData,
      onError: onError,
    );
    startServer();
    super.onInit();
  }

  Future<void> convertToFile() async {
    debugPrint('Coverting... ');
    final tempDir = await getApplicationDocumentsDirectory();
    debugPrint('PATH : ${tempDir.path} ');

    final file = await File('${tempDir.path}/$message').create();
    file.writeAsBytesSync(unit8data!);
    debugPrint('File Saved in ${'${tempDir.path}/$message'}');
  }

  String? type;
  String? message;
  Uint8List? unit8data;

  void onData(Uint8List data) {
    final receivedData = String.fromCharCodes(data);
    debugPrint(receivedData);
    final receivedDataJson = jsonDecode(receivedData) as Map<String, dynamic>;
    final messageModel = MessageModel.fromJson(receivedDataJson);
    addServerLog(messageModel);
    debugPrint("messageModel : ${messageModel.messageData}");
    barcodeController.text = messageModel.messageData;
    // if (!String.fromCharCodes(data).contains("Server")) {
    //   if (String.fromCharCodes(data) != "") {
    //     final receviedData = String.fromCharCodes(data);
    //     // debugPrint('Data ${String.fromCharCodes(data)}');
    //     debugPrint("Received Data: $receviedData");
    //     final res = jsonDecode(receviedData) as Map<String, dynamic>;
    //     debugPrint("Received Data: ${res['message']}");
    //     if (res.containsKey("type")) {
    //       if (res['type'] == "message") {
    //         addServerLog("Scanned Barcode : ${res['message']}");
    //       }
    //     }
    //     // if (receviedData.contains("type")) {
    //     //   debugPrint('Type: ${receviedData.split(":").last}');
    //     //   type = receviedData.split(":").last;
    //     //   debugPrint('Type s: $type');
    //     // } else if (receviedData.contains("message")) {
    //     //   debugPrint('Message: ${receviedData.split(":").last}');
    //     //   message = receviedData.split(":").last;

    //     //   debugPrint('Message s: $message');
    //     //   serverLogs.add(
    //     //       MessageModel(type: type!, message: String.fromCharCodes(data)));
    //     // } else if (receviedData.contains("data")) {
    //     //   // debugPrint('DATA ${String.fromCharCodes(data)}');
    //     //   debugPrint('UNIT8List ${receviedData.split(":").last}');
    //     //   String list = receviedData.split(":").last;

    //     //   unit8data = base64.decode(list.substring(23).replaceAll("\n", ""));

    //     //   debugPrint('messageModel $unit8data');
    //     //   update();
    //     //   convertToFile();
    //     // }
    //     update();
    //     debugPrint("REcevied");
    //   }
    // } else {
    //   serverLogs.add(
    //       MessageModel(type: "message", message: String.fromCharCodes(data)));
    // }
    // if (!String.fromCharCodes(data)
    //     .toLowerCase()
    //     .contains("Server listening".toLowerCase())) {
    //   final serverData = String.fromCharCodes(data);
    //   final res = jsonDecode(serverData) as Map<String, dynamic>;
    //   barcodeController.text = "${res['messageData']}";
    // }
    update();
  }

  void addServerLog(MessageModel messageModel) {
    serverLogs.add(messageModel);
    update();
  }

  void handleSendMessage() {
    server!.broadCast(serverController.text);
    addServerLog(
      MessageModel(
        fileData: [],
        message: "Message",
        messageData: "You : ${serverController.text}",
        typeEnum: TypeEnum.Message,
        actionEnum: ActionEnum.None,
      ),
    );
    serverController.text = "";
  }

  String sendFile(String filePath) {
    final File file = File(filePath);
    debugPrint('Reading... $file');
    final Uint8List bytes = file.readAsBytesSync();
    debugPrint('Bytes $bytes');
    final String bytesString = base64.encode(bytes);
    // final String bytesString =
    //     String.fromCharCodes(bytes);
    final data = {
      "type": "file",
      "message": file.path.split("/").last,
      "data": bytes
    };

    final encodedData = json.encode(data);
    debugPrint('data $bytesString');
    return bytesString;
  }

  void onError(dynamic error) {
    debugPrint("$error");
  }

  // @override
  // void dispose() {
  //   server!.stop();
  //   serverController.dispose();
  //   super.dispose();
  // }
}
