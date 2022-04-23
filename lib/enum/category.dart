enum CategoryEnum { HsnCode, Category, Tax, DateTime }

String unitEnumToStr(CategoryEnum categoryEnum) {
  switch (categoryEnum) {
    case CategoryEnum.HsnCode:
      return "HSN Code";
    case CategoryEnum.Category:
      return "Category";
    case CategoryEnum.Tax:
      return "Tax";
    default:
      return "Date Time";
  }
}

CategoryEnum strToUnitEnum(String str) {
  if (str == "HSN Code") {
    return CategoryEnum.HsnCode;
  } else if (str == "Category") {
    return CategoryEnum.Category;
  } else if (str == "Tax") return CategoryEnum.Tax;
  return CategoryEnum.DateTime;
}
