import '../enum/action.dart';
import '../enum/message_type.dart';

class MessageModel {
  late TypeEnum typeEnum;
  late String message;
  late List fileData;
  late String messageData;
  late ActionEnum actionEnum;
  MessageModel(
      {required this.fileData,
      required this.message,
      required this.messageData,
      required this.typeEnum,
      required this.actionEnum});

  MessageModel.fromJson(Map<String, dynamic> json) {
    typeEnum = strToTypeEnum("${json['type']}");
    message = "${json['message']}";
    fileData = json['fileData'] as List;
    messageData = "${json['messageData']}";
    actionEnum = strToActionEnum("${json['action']}");
    // return MessageModel(
    //     json['fileData'] as List,
    //     "${json['message']}",
    //     "${json['messageData']}",
    //     strToTypeEnum("${json['type']}"),
    //     strToActionEnum("${json['action']}"));
  }

  Map<String, dynamic> toJson() => {
        "type": typeEnumToString(typeEnum),
        "message": message,
        "fileData": fileData,
        "messageData": messageData,
        "action": actionEnumToStr(actionEnum)
      };
}
