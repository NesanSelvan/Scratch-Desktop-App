extension StringFeaure on String? {
  bool get containsOperators {
    if (this == null) {
      return false;
    }
    if (this!.contains("+") ||
        this!.contains("-") ||
        this!.contains("*") ||
        this!.contains("/")) {
      return true;
    }
    return false;
  }
}
