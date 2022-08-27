enum ReceiptEnum {
  receiptNo,
  CustomerName,
  ReceivedFrom,
  PaymentFor,
  GivenAmount,
  AdvanceAmount,
  PaymentMethod,
  DateTime,
  Action
}

String getStrofReceiptEnum(ReceiptEnum receiptEnum) {
  switch (receiptEnum) {
    case ReceiptEnum.AdvanceAmount:
      return "Advance Amount";
    case ReceiptEnum.receiptNo:
      return "Receipt No";
    case ReceiptEnum.CustomerName:
      return "Customer Name";
    case ReceiptEnum.PaymentMethod:
      return "Payment Method";
    case ReceiptEnum.GivenAmount:
      return "Given Amount";
    case ReceiptEnum.DateTime:
      return "Date";
    case ReceiptEnum.PaymentFor:
      return "Payment For";
    case ReceiptEnum.ReceivedFrom:
      return "Received From";
    default:
      return "Action";
  }
}

enum VoucherEnum {
  voucherNo,
  GivenTo,
  Description,
  GivenAmount,
  PaymentMethod,
  DateTime,
  Action
}

String getStrofVoucherEnum(VoucherEnum voucherEnum) {
  switch (voucherEnum) {
    case VoucherEnum.Description:
      return "Description";
    case VoucherEnum.voucherNo:
      return "Voucher No";
    case VoucherEnum.GivenTo:
      return "Employee Name";
    case VoucherEnum.PaymentMethod:
      return "Payment Method";
    case VoucherEnum.GivenAmount:
      return "Given Amount";
    case VoucherEnum.DateTime:
      return "Date";
    default:
      return "Action";
  }
}

enum PaymentEnum {
  paymentNo,
  purchaseBillNo,
  BillAmount,
  GivenAmount,
  PaymentMethod,
  PaymentID,
  DateTime,
  Action
}

String getStrofPaymentEnum(PaymentEnum paymentEnum) {
  switch (paymentEnum) {
    case PaymentEnum.BillAmount:
      return "Purchase Amount";
    case PaymentEnum.PaymentID:
      return "Payment ID";
    case PaymentEnum.purchaseBillNo:
      return "Purchase Bill No";
    case PaymentEnum.PaymentMethod:
      return "Payment Method";
    case PaymentEnum.GivenAmount:
      return "Given Amount";
    case PaymentEnum.DateTime:
      return "Date";
    case PaymentEnum.paymentNo:
      return "payment No";
    default:
      return "Action";
  }
}
