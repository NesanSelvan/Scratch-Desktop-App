enum StatementEnum { Stock, Purchase, Payment, Receipt, Sales }

String statementEnumToStr(StatementEnum statementEnum) {
  switch (statementEnum) {
    case StatementEnum.Payment:
      return "Payment";
    case StatementEnum.Purchase:
      return "Purchase";
    case StatementEnum.Receipt:
      return "Receipt";
    case StatementEnum.Sales:
      return "Sales";
    case StatementEnum.Stock:
      return "Stock";
    default:
      return "";
  }
}
