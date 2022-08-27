enum ProductEnum {
  
  Number,
  Name,
  Company,
  Unit,
  UnitQty,
  Action
}

String companyEnumToStr(ProductEnum categoryEnum) {
  switch (categoryEnum) {
    case ProductEnum.Name:
      return "Name";
    case ProductEnum.Number:
      return "Product Number";
    case ProductEnum.Unit:
      return "Unit";
    case ProductEnum.UnitQty:
      return "Unit Qty";
    default:
      return "Action";
  }
}

ProductEnum strToCompanyEnum(String str) {
  if (str == "Name") {
    return ProductEnum.Name;
  } else if (str == "Number") {
    return ProductEnum.Number;
  } else if (str == "Unit Qty") {
    return ProductEnum.UnitQty;
  } else if (str == "Unit") {
    return ProductEnum.Unit;
  } 
  return ProductEnum.Action;
}
