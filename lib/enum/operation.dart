enum OperationEnum { Add, Subtract, Multiplication, Division }

String getStrOperation(OperationEnum operationEnum) {
  switch (operationEnum) {
    case OperationEnum.Add:
      return "+";
    case OperationEnum.Subtract:
      return "-";
    case OperationEnum.Multiplication:
      return "*";
    case OperationEnum.Division:
      return "/";
    default:
      return "/";
  }
}
