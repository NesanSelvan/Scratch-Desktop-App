enum ActionEnum { AddProduct, Billing, None, AddProductImage }

String actionEnumToStr(ActionEnum actionEnum) {
  switch (actionEnum) {
    case ActionEnum.Billing:
      return "Billing";
    case ActionEnum.None:
      return "None";
    case ActionEnum.AddProductImage:
      return "AddProductImage";
    default:
      return "Add Product";
  }
}

ActionEnum strToActionEnum(String type) {
  if (type == "Billing") {
    return ActionEnum.Billing;
  } else if (type == "None") {
    return ActionEnum.None;
  } else if (type == "AddProductImage") {
    return ActionEnum.AddProductImage;
  } else {
    return ActionEnum.AddProduct;
  }
}
