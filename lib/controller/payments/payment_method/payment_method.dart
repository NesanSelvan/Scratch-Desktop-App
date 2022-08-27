import 'package:get/get.dart';

import '../../../enum/payments/payment.dart';

class PaymentMethodController extends GetxController {
  PaymentMethodEnum _selectedPaymentEnum = PaymentMethodEnum.CASH;
  PaymentMethodEnum get selectedPaymentEnum => _selectedPaymentEnum;

  // ignore: avoid_setters_without_getters
  set setSelectedPaymentMethod(PaymentMethodEnum paymentMethodEnum) {
    _selectedPaymentEnum = paymentMethodEnum;
    update();
  }
}
