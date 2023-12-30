import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/action.dart';
import 'package:annai_store/enum/message_type.dart';
import 'package:annai_store/models/message.dart';
import 'package:annai_store/models/product/product.dart';

class Server {
  Server({this.onError, this.onData, this.onSockets});

  Uint8ListCallback? onData;

  DynamicCallback? onError;
  Function(Socket)? onSockets;
  ServerSocket? server;
  bool running = false;
  List<Socket> sockets = [];

  Future<void> start(String ipAdd) async {
    runZoned(
      () async {
        server = await ServerSocket.bind(ipAdd, port, shared: true);
        running = true;
        server!.listen(onRequest);
        final data = MessageModel(
          fileData: "",
          message: "Server listening on $ipAdd port $port",
          messageData: 'Server listening on $ipAdd port $port',
          typeEnum: TypeEnum.Message,
          actionEnum: ActionEnum.None,
        );
        final dataEncode = jsonEncode(data);
        onData!(Uint8List.fromList(dataEncode.codeUnits));
      },
      onError: (e) {
        onError!(e);
      },
    );
  }

  Future<void> stop() async {
    await server!.close();
    server = null;
    running = false;
  }

  void addProductImage(ProductModel productModel) {
    log("addProductImage");
    final messageModel = jsonEncode(
      MessageModel(
        fileData: "",
        message: "AddProductImage",
        messageData: "AddProductImage",
        typeEnum: TypeEnum.Files,
        actionEnum: ActionEnum.AddProductImage,
        productModel: productModel,
      ).toJson(),
    );
    for (final socket in sockets) {
      print("socket: ${socket.address}");
      socket.write(messageModel);
    }
  }

  void broadCast(String message) {
    final messageModel = jsonEncode(
      MessageModel(
        fileData: "",
        message: message,
        messageData: message,
        typeEnum: TypeEnum.Message,
        actionEnum: ActionEnum.AddProductImage,
      ).toJson(),
    );
    // onData!(Uint8List.fromList(jsonEncode(messageModel.toJson()).codeUnits));
    for (final Socket socket in sockets) {
      socket.write(messageModel);
    }
  }

  Uint8List? prevData;

  Future<void> onRequest(Socket socket) async {
    print("OnRequest: $sockets ${socket.address.rawAddress}");
    print(socket.address.address);
    sockets.clear();
    final dupSock = [...sockets];

    if (dupSock.isEmpty) {
      sockets.add(socket);
      // while (true) {
      //   await for (final element in socket.asBroadcastStream()) {
      //     onData?.call(element);
      //   }
      // }
      socket.listen((Uint8List data) async {
        log("onData if");
        await for (final element in socket.asBroadcastStream()) {
          onData?.call(element);
        }
      });
    }
    print(sockets.length);
  }
}

// class Client {
//   Client({
//     this.onError,
//     this.onData,
//     this.hostname,
//     this.port,
//   });

//   String? hostname;
//   int? port;
//   Uint8ListCallback? onData;
//   DynamicCallback? onError;
//   bool connected = false;

//   Socket? socket;

//   Future<void> connect() async {
//     try {
//       socket = await Socket.connect(hostname, 4000);
//       socket!.listen(
//         onData,
//         onError: onError,
//         onDone: disconnect,
//         cancelOnError: false,
//       );
//       connected = true;
//     } on Exception catch (exception) {
//       onData!(Uint8List.fromList("Error : $exception".codeUnits));
//     }
//   }

//   void write(String message) {
//     //Connect standard in to the socket
//     socket!.write('$message\n');
//   }

//   void disconnect() {
//     if (socket != null) {
//       socket!.destroy();
//       connected = false;
//     }
//   }
// }
