enum PaymentMethodEnum { CASH, Gpay, PayTM, PhonePay, NEFT, Cheque }

String getStrfromPaymentMethod(PaymentMethodEnum paymentMethodEnum) {
  switch (paymentMethodEnum) {
    case PaymentMethodEnum.CASH:
      return "CASH";
    case PaymentMethodEnum.Gpay:
      return "GPay";
    case PaymentMethodEnum.PayTM:
      return "PayTM";
    case PaymentMethodEnum.PhonePay:
      return "PhonePay";
    case PaymentMethodEnum.NEFT:
      return "NEFT";
    case PaymentMethodEnum.Cheque:
      return "Cheque";
    default:
      return "CASH";
  }
}

PaymentMethodEnum getPaymentMethodFromStr(String value) {
  switch (value) {
    case "CASH":
      return PaymentMethodEnum.CASH;
    case "GPay":
      return PaymentMethodEnum.Gpay;
    case "PayTM":
      return PaymentMethodEnum.PayTM;
    case "PhonePay":
      return PaymentMethodEnum.PhonePay;
    case "NEFT":
      return PaymentMethodEnum.NEFT;
    case "Cheque":
      return PaymentMethodEnum.Cheque;
    default:
      return PaymentMethodEnum.CASH;
  }
}
