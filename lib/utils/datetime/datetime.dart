// ignore: avoid_classes_with_only_static_members
class DateTimeUtility {
  static DateTime getBillStartDate() {
    final todaysDate = DateTime.now();
    if (todaysDate.month <= DateTime.march) {
      final startDate = DateTime(todaysDate.year - 1, 4);
      return startDate;
    } else {
      final startDate = DateTime(todaysDate.year, 4);
      return startDate;
    }
  }

  static DateTime getBillEndDate() {
    final todaysDate = DateTime.now();
    if (todaysDate.month <= DateTime.march) {
      final endDate = DateTime(todaysDate.year, 3, 31);
      return endDate;
    } else {
      final endDate = DateTime(todaysDate.year + 1, 3, 31);
      return endDate;
    }
  }
}
