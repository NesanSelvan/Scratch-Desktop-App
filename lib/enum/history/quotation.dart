enum QuotationHistoryEnum {
  Date,
  BillNo,
  CustomerName,
  TotalAmount,
  // A4,
  Action
}

String getStrofAddSalesHistoryEnum(QuotationHistoryEnum quotationHistoryEnum) {
  switch (quotationHistoryEnum) {
    case QuotationHistoryEnum.Date:
      return "Date";
    case QuotationHistoryEnum.BillNo:
      return "Bill No";
    case QuotationHistoryEnum.CustomerName:
      return "Customer Name";
    case QuotationHistoryEnum.TotalAmount:
      return "Total Amount";
    default:
      return "Action";
  }
}
