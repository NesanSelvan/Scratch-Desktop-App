import 'package:annai_store/models/bank/bank.dart';
import 'package:environments/environments.dart';

enum ApplicationEnum { AnnaiStore, AnnaiTraders, Scratch }

// ignore: avoid_classes_with_only_static_members
class Application {
  static ApplicationEnum currentApplication = ApplicationEnum.AnnaiStore;
  static Environments environment = Environments.production;

  static double version() {
    if (currentApplication == ApplicationEnum.AnnaiStore) {
      return 21.4;
    }
    if (currentApplication == ApplicationEnum.AnnaiTraders) {
      return 11.1;
    }
    return 1;
  }

  static String get dbLocationPath {
    if (environment == Environments.dev) {
      return "C:";
    }
    return "D:";
  }

  static String get appName => currentApplication == ApplicationEnum.AnnaiStore
      ? "Annai Store"
      : currentApplication == ApplicationEnum.AnnaiTraders
          ? "Annai Traders"
          : "Scratch";

  static String get gstinNo => currentApplication == ApplicationEnum.AnnaiStore
      ? "33AHIPC1946Q1Z4"
      : currentApplication == ApplicationEnum.AnnaiTraders
          ? "33CGHPN0776K1Z4"
          : "";
  static String get address => currentApplication == ApplicationEnum.AnnaiStore
      ? "No.97, Yadhavar South Street,\nValliyur, TamilNadu - 627117"
      : currentApplication == ApplicationEnum.AnnaiTraders
          ? "151/10, Anantha Bhavana Veethi,\n Therkukallikulam,\nTirunelveli, Tamil Nadu, 627113"
          : "";

  static String get mobileNo => currentApplication == ApplicationEnum.AnnaiStore
      ? "9488327699"
      : currentApplication == ApplicationEnum.AnnaiTraders
          ? "9488327699"
          : "9167877725";

  static BankModel get bankDetails =>
      currentApplication == ApplicationEnum.AnnaiStore
          ? BankModel(
              id: "1",
              accountNo: "50200049030021",
              bankHolderName: "Annai Store",
              ifscCode: "HDFC0009174",
              bankName: "HDFC BANK",
              branch: "Vallioor",
              createdAt: DateTime.now(),
            )
          : BankModel(
              id: "2",
              branch: "Vallioor",
              accountNo: "50200060774212",
              bankHolderName: "Annai Traders",
              ifscCode: "HDFC0009174",
              bankName: "HDFC BANK",
              createdAt: DateTime.now(),
            );
}
