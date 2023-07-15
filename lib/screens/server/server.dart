import 'package:annai_store/controller/history/sales/sales.dart';
import 'package:annai_store/controller/server/server.dart';
import 'package:annai_store/models/message.dart';
import 'package:annai_store/services/api.dart';
import 'package:annai_store/utils/file/file.dart';
import 'package:annai_store/widgets/custom_button.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServerPage extends StatefulWidget {
  @override
  _ServerPageState createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  ServerController serverController = Get.put(ServerController());
  final textController = TextEditingController();
  SalesHistoryNotifier salesHistoryNotifier = Get.put(SalesHistoryNotifier());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          'Server',
          size: 16,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<ServerController>(
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: CustomScreenUtility(context).width * 0.45,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  "Server",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: controller.server!.running
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(3),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    controller.server!.running ? 'ON' : 'OFF',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: controller.startServer,
                              child: Text(
                                controller.server!.running
                                    ? 'Server started'
                                    : 'Start server',
                              ),
                            ),
                            const Divider(
                              height: 30,
                              thickness: 1,
                              color: Colors.black12,
                            ),
                            Expanded(
                              child: ListView(
                                children: controller.serverLogs
                                    .map((MessageModel log) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(log.message),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      icon: Icons.delete,
                      text: "Delete All",
                      onTap: () {
                        salesHistoryNotifier.clearAllBills();
                      },
                    ),
                    Container(
                      height: 80,
                      color: Colors.grey[200],
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: CustomTextField(
                                    controller: controller.serverController,
                                    label: "Message",
                                    onEditingComplete: () {
                                      controller.handleSendMessage();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          MaterialButton(
                            onPressed: () {
                              controller.serverController.text = "";
                            },
                            minWidth: 30,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            child: const Icon(Icons.clear),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          MaterialButton(
                            onPressed: () {
                              controller.handleSendMessage();
                            },
                            minWidth: 30,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            child: const Icon(Icons.send),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: CustomScreenUtility(context).width * 0.45,
                child: Column(
                  children: [
                    const CustomText("Local Server"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: textController,
                      label: "Enter NGROK URL",
                    ),
                    CustomTextButton(
                      "Send my Database",
                      onPressed: () {
                        debugPrint(
                          "Decoded String : ${controller.sendFile(FileUtility.getFullDBFilePath())}",
                        );
                        API().sendMyDBFile(
                          url: textController.text == ""
                              ? null
                              : textController.text,
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
