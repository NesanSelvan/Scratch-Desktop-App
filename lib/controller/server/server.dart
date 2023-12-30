import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:annai_store/enum/action.dart';
import 'package:annai_store/enum/message_type.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:annai_store/models/message.dart';
import 'package:annai_store/models/server/server.dart';
import 'package:annai_store/screens/server/server.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

final barcodeController = TextEditingController();

class ServerController extends GetxController {
  Server? server;
  List<MessageModel> serverLogs = [];
  TextEditingController serverController = TextEditingController();
  MessageModel? addProductImageUpdate;
  Socket? socket;
  // MessageModel? messageModel;

  Future<(InternetAddress, String)> getIp() async {
    for (final interface in await NetworkInterface.list()) {
      debugPrint('== Interface: ${interface.name} ==');
      if (interface.name.toLowerCase().contains("wi")) {
        for (final addr in interface.addresses) {
          return (addr, addr.address);
        }
      }
      for (final addr in interface.addresses) {
        return (addr, addr.address);
      }
    }
    throw Failure("Error in starting server");
    // return null;
  }

  Future<void> startServer() async {
    try {
      final ipAdd = await getIp();
      log("Ip Address : $ipAdd");
      if (server!.running) {
        await server!.stop();
        serverLogs.clear();
      } else {
        await server!.start(ipAdd.$2);
        final hServer = await HttpServer.bind(ipAdd.$1, 8080);
        print(
          "Server running on IP : ${hServer.address} On Port : ${hServer.port}",
        );
        await hServer.forEach((HttpRequest request) async {
          final String content = await utf8.decoder.bind(request).join();
          print("Yes : $content");
          try {
            onData.call(Uint8List.fromList(content.codeUnits));
          } catch (e) {
            print(e);
          }
          request.response.write('Hello, world!');
          request.response.close();
        });
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
      onSockets: (sockets) {
        print("Socket: ${sockets.address}");
        socket = sockets;
        update();
      },
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

  Future<void> onData(Uint8List data) async {
    final receivedData = String.fromCharCodes(data);
    log("onData: $receivedData");
    // return;
    try {
      log("Ohh yeah!!");
      final messageModel =
          await MessageModelsParser(receivedData).parseInBackground();
      // final receivedDataJson =
      //     jsonDecode(receivedData) as Map<String, dynamic>;
      // log(receivedDataJson.genericType.toString());
      // final messageModel = MessageModel.fromJson(receivedDataJson);
      log("messageModel: ${messageModel?.actionEnum}");
      if (messageModel?.actionEnum == ActionEnum.AddProductImage) {
        addProductImageUpdate = messageModel;
        update();
      }
    } catch (e) {
      log("Error: $e");
    }
    // debugPrint("messageModel : ${messageModel.messageData}");
    // barcodeController.text = messageModel.messageData;
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
        fileData: "",
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
      "data": bytes,
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
