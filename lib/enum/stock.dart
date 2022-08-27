enum StockEnum { ProductCode, ProductName, Qty, DateTime }

String stockEnumToStr(StockEnum stockEnum) {
  switch (stockEnum) {
    case StockEnum.ProductCode:
      return "Product Code";
    case StockEnum.ProductName:
      return "Product Name";
    case StockEnum.Qty:
      return "Quantity";
    default:
      return "Update At";
  }
}

StockEnum strTostockEnum(String str) {
  if (str == "Product Code") return StockEnum.ProductCode;
  if (str == "Product Name") return StockEnum.ProductName;
  if (str == "Update At") return StockEnum.DateTime;
  return StockEnum.Qty;
}
