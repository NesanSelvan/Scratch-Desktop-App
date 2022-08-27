// ignore: avoid_classes_with_only_static_members
import 'package:annai_store/enum/application.dart';

class UPIDetails {
  static String upiID = "annaistore.98709834@hdfcbank";
  static String payeeName = Application.appName;

  final double amount;

  UPIDetails(this.amount);

  String toStr() {
    return "upi://pay?pa=${UPIDetails.upiID}&pn=${UPIDetails.payeeName}&am=${amount.round()}&cu=INR&mode=01&purpose=10&orgid=-&sign=-&tn=Bill Payment";
  }
}
