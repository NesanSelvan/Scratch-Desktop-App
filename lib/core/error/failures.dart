import 'package:equatable/equatable.dart';

const SERVER_FAILURE_MESSAGE =
    "Error in getting data! Check your Internet Connection";
const NULL_FAILURE_MESSAGE = "No Data";
const CACHE_FAILURE_MESSAGE = "Failed to get CACHE Data";
const INVALID_INPUT_FAILURE_MESSAGE = "Invalid Input";

abstract class Failure extends Equatable {
  const Failure();
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NullDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InvalidInputFailure extends Failure {
  @override
  List<Object?> get props => [];
}
