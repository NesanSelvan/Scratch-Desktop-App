import 'package:annai_store/enum/action.dart';
import 'package:annai_store/enum/message_type.dart';
import 'package:annai_store/models/product/product.dart';

class MessageModel {
  late TypeEnum typeEnum;
  late String message;
  late String fileData;
  late String messageData;
  late ActionEnum actionEnum;
  late ProductModel? productModel;
  late String? messageId;

  MessageModel({
    required this.fileData,
    required this.message,
    required this.messageData,
    this.productModel,
    this.messageId,
    required this.typeEnum,
    required this.actionEnum,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    messageId = (json['messageId'] as String?) ?? '';
    final List<String> allFilesData = [];
    if (json['fileData'] is List) {
      for (final element in json['fileData'] as List) {
        allFilesData.add(element.toString());
      }
    }
    typeEnum = strToTypeEnum("${json['type']}");
    message = "${json['message']}";
    fileData = "${json['fileData']}";
    messageData = "${json['messageData']}";
    // productModel = json['productModel'] == null
    //     ? null
    //     : ProductModel.fromJson(json['productModel'] as Map<String, dynamic>);
    actionEnum = strToActionEnum("${json['action']}");
  }

  Map<String, dynamic> toJson() => {
        "type": typeEnumToString(typeEnum),
        "message": message,
        "fileData": fileData,
        "messageData": messageData,
        "productModel": productModel?.toJson(),
        "action": actionEnumToStr(actionEnum),
      };
}
