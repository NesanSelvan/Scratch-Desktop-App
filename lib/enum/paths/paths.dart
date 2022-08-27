enum PathEnum {
  Excel,
  Pdf,
  ThermalPrinter,
  NormalPrinter,
  BarcodePrinterStr,
  UPIImage
}

const excelStr = "Excel";
const pdfStr = "Pdf";
const thermalPrinterStr = "Thermal Printer";
const normalPrinterStr = "Normal Printer";
const barcodePrinterStr = "Barcode Printer";
const upiImageStr = "UPI Image";

String getStrFromPathEnum(PathEnum pathEnum) {
  switch (pathEnum) {
    case PathEnum.Excel:
      return excelStr;
    case PathEnum.Pdf:
      return pdfStr;
    case PathEnum.ThermalPrinter:
      return thermalPrinterStr;
    case PathEnum.NormalPrinter:
      return normalPrinterStr;
    case PathEnum.BarcodePrinterStr:
      return barcodePrinterStr;
    case PathEnum.UPIImage:
      return upiImageStr;
    default:
      return excelStr;
  }
}

PathEnum getPathEnumFromStr(String str) {
  switch (str) {
    case excelStr:
      return PathEnum.Excel;
    case pdfStr:
      return PathEnum.Pdf;
    case thermalPrinterStr:
      return PathEnum.Excel;
    case normalPrinterStr:
      return PathEnum.NormalPrinter;
    case barcodePrinterStr:
      return PathEnum.BarcodePrinterStr;
    case upiImageStr:
      return PathEnum.UPIImage;
    default:
      return PathEnum.Excel;
  }
}
