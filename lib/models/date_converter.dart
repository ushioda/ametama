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
}
