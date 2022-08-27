import 'package:dartz/dartz.dart';

import '../error/failures.dart';

class InputConverter {
  Either<Failure, double> stringToUnsignedInt(String numberStr) {
    try {
      final number = double.parse(numberStr);
      if (number < 0) throw const FormatException();
      return Right(number);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
