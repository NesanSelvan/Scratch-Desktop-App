class Failure {
  String message;
  int? code;
  Failure(this.message, {this.code});

  @override
  String toString() {
    return message;
  }
}
