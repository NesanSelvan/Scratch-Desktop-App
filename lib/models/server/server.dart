import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:annai_store/core/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../enum/action.dart';
import '../../enum/message_type.dart';
import '../message.dart';

class Server {
  Server({this.onError, this.onData});

  Uint8ListCallback? onData;

  DynamicCallback? onError;
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
          fileData: [],
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

  void broadCast(String message) {
    onData!(Uint8List.fromList('Broadcasting : $message'.codeUnits));
    for (final Socket socket in sockets) {
      socket.write(message);
    }
  }

  void onRequest(Socket socket) {
    debugPrint('Socket ${socket.address}');
    if (!sockets.contains(socket)) {
      sockets.add(socket);
    }
    socket.listen((Uint8List data) {
      onData!(data);
    });
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
