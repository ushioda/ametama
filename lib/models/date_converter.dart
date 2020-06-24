class DateConverter {
  DateTime julianToDateTime(int julianDate) {
    DateTime now = DateTime.now();
    DateTime beginningOfThisYear = DateTime(now.year, 1, 1);
    DateTime beginningOfLastYear = DateTime(now.year - 1, 1, 1);
    DateTime dateThisYear =
        beginningOfThisYear.add(Duration(days: (julianDate - 1)));
    DateTime dateLastYear =
        beginningOfLastYear.add(Duration(days: (julianDate - 1)));
    return dateThisYear.isBefore(now) ? dateThisYear : dateLastYear;
  }

  String julianToString(int julianDate) {
    if (julianDate < 10) {
      return '00$julianDate';
    } else if (julianDate < 99) {
      return '0$julianDate';
    } else {
      return '$julianDate';
    }
  }
}
