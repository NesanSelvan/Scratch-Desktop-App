enum TypeEnum { Message, Files, Data }

String typeEnumToString(TypeEnum typeEnum) {
  switch (typeEnum) {
    case TypeEnum.Files:
      return "Files";
    case TypeEnum.Message:
      return "messages";
    default:
      return "data";
  }
}

TypeEnum strToTypeEnum(String type) {
  if (type == "Files") {
    return TypeEnum.Files;
  } else if (type == "messages") {
    return TypeEnum.Message;
  } else {
    return TypeEnum.Data;
  }
}
