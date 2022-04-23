import '../enum/operation.dart';

class RoundOff {
  final OperationEnum operation;
  final double roundOffAmount;

  RoundOff({
    required this.operation,
    required this.roundOffAmount,
  });
}
