enum ActionEnum { AddProduct, Billing, None }

String actionEnumToStr(ActionEnum actionEnum) {
  switch (actionEnum) {
    case ActionEnum.Billing:
      return "Billing";
    case ActionEnum.None:
      return "None";
    default:
      return "Add Product";
  }
}

ActionEnum strToActionEnum(String type) {
  if (type == "Billing") {
    return ActionEnum.Billing;
  } else if (type == "None") {
    return ActionEnum.None;
  } else {
    return ActionEnum.AddProduct;
  }
}
