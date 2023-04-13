enum SalesHistoryEnum {
  Date,
  Images,
  BillNo,
  CustomerName,
  TotalAmount,
  // Paid,
  PendingAmount,
  // A4,
  Action
}

String getStrofAddSalesHistoryEnum(SalesHistoryEnum salesHistoryEnum) {
  switch (salesHistoryEnum) {
    case SalesHistoryEnum.Date:
      return "Date";
    case SalesHistoryEnum.BillNo:
      return "Bill No";
    case SalesHistoryEnum.Images:
      return "Images";
    case SalesHistoryEnum.CustomerName:
      return "Customer Name";
    case SalesHistoryEnum.TotalAmount:
      return "Total Amount";
    // case SalesHistoryEnum.Paid:
    //   return "Paid";
    case SalesHistoryEnum.PendingAmount:
      return "Pending Amount";
    // case SalesHistoryEnum.A4:
    //   return "F4.A4";
    default:
      return "Action";
  }
}

enum EstimateHistoryEnum {
  Date,
  EstimateNo,
  CustomerName,
  TotalAmount,
  BillNo,
  Action
}

String getStrofAddEstimateHistoryEnum(EstimateHistoryEnum stimateHistoryEnum) {
  switch (stimateHistoryEnum) {
    case EstimateHistoryEnum.Date:
      return "Date";
    case EstimateHistoryEnum.EstimateNo:
      return "Estimate No";
    case EstimateHistoryEnum.CustomerName:
      return "Customer Name";
    case EstimateHistoryEnum.TotalAmount:
      return "Total Amount";
    case EstimateHistoryEnum.BillNo:
      return "No";
    // case SalesHistoryEnum.A4:
    //   return "F4.A4";
    default:
      return "Action";
  }
}

enum PurchaseHistoryEnum {
  Date,
  Images,
  BillNo,
  CompanyName,
  NoOfItem,
  TotalAmount,
  PendingAmount,
  Action
}

String getStrofAddPurchaseHistoryEnum(PurchaseHistoryEnum salesHistoryEnum) {
  switch (salesHistoryEnum) {
    case PurchaseHistoryEnum.Date:
      return "Date";
    case PurchaseHistoryEnum.BillNo:
      return "Bill No";
    case PurchaseHistoryEnum.Images:
      return "Images";
    case PurchaseHistoryEnum.CompanyName:
      return "Customer Name";
    case PurchaseHistoryEnum.TotalAmount:
      return "Total Amount";
    case PurchaseHistoryEnum.NoOfItem:
      return "No of Item";
    case PurchaseHistoryEnum.PendingAmount:
      return "Pending Amount";
    default:
      return "Action";
  }
}
