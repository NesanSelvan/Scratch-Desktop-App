enum SalesBillingEnum {
  HsnCode,
  ProductName,
  Qty,
  Rate,
  Price,
  Discount,
  Amount,
  Tax,
  TotalAmount,
  Remove
}

String getStrofAddSalesBillingEnum(SalesBillingEnum billingEnum) {
  switch (billingEnum) {
    case SalesBillingEnum.Qty:
      return "Qty";
    case SalesBillingEnum.HsnCode:
      return "Hsn Code";
    case SalesBillingEnum.ProductName:
      return "Product Name";
    case SalesBillingEnum.Rate:
      return "Rate";
    case SalesBillingEnum.Price:
      return "Price";
    case SalesBillingEnum.Discount:
      return "Discount";
    case SalesBillingEnum.Amount:
      return "Amount";
    case SalesBillingEnum.Tax:
      return "Tax";
    case SalesBillingEnum.TotalAmount:
      return "Total Amount";
    case SalesBillingEnum.Remove:
      return "Remove";
    default:
      return "";
  }
}

enum PurchaseBillingEnum {
  HsnCode,
  ProductName,
  Qty,
  Rate,
  Amount,
  Discount,
  Lorry,
  TaxableValue,
  Tax,
  TotalAmount,
  Remove
}

String getStrofAddPurchaseBillingEnum(PurchaseBillingEnum billingEnum) {
  switch (billingEnum) {
    case PurchaseBillingEnum.Qty:
      return "Qty";
    case PurchaseBillingEnum.HsnCode:
      return "Hsn Code";
    case PurchaseBillingEnum.ProductName:
      return "Product Name";
    case PurchaseBillingEnum.Rate:
      return "Rate";
    case PurchaseBillingEnum.Lorry:
      return "Lorry Fright";
    case PurchaseBillingEnum.Discount:
      return "Discount";
    case PurchaseBillingEnum.Amount:
      return "Amount";
    case PurchaseBillingEnum.Tax:
      return "Tax";
    case PurchaseBillingEnum.TaxableValue:
      return "Taxable Value";
    case PurchaseBillingEnum.TotalAmount:
      return "Total Amount";
    case PurchaseBillingEnum.Remove:
      return "Remove";
    default:
      return "";
  }
}
