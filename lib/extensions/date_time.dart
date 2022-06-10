extension DateEqualCheck on DateTime {
  bool isOnlyDateEqual(DateTime? otherDateTime) {
    if (otherDateTime?.day == day &&
        otherDateTime?.month == month &&
        otherDateTime?.year == year) {
      return true;
    }
    return false;
  }
}
