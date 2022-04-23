import 'package:annai_store/core/constants/constants.dart';

enum UnitEnum { Symbol, FormalName, DateTime }

String unitEnumToStr(UnitEnum unitEnum) {
  switch (unitEnum) {
    case UnitEnum.FormalName:
      return formalName;
    case UnitEnum.Symbol:
      return symbol;
    case UnitEnum.DateTime:
      return "Date Time";
    default:
      return symbol;
  }
}

UnitEnum strToUnitEnum(String str) {
  if (str == formalName) return UnitEnum.FormalName;
  if (str == symbol) return UnitEnum.Symbol;
  return UnitEnum.DateTime;
}
