import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:ametama/models/date_converter.dart';

class DateData extends ChangeNotifier {
  final Map<int, String> _digits = {0: '_', 1: '_', 2: '_'};
  int _focusDigit = 0;
  int _julianDate;
  int _daysUntilExpiration;
  int _daysFromPackToExpiration = 14;
  bool _dateError = false;
  DateTime _packedDate;
  DateTime _expirationDate;

//  the last julian date last year. 366 if leap year.
  final int _julianEnd = (DateTime.now().year / 4 == 1) ? 366 : 365;

  UnmodifiableMapView get digits => UnmodifiableMapView(_digits);

  int get julianDate => _julianDate;

  int get daysUntilExpiration => _daysUntilExpiration;

  bool get dateError => _dateError;

  int get julianEnd => _julianEnd;

  DateTime get packedDate => _packedDate;

  DateTime get expirationDate => _expirationDate;

//  enter digit into digit box and move on to next digit box
  void changeDigit(int newNumber) {
    if (_focusDigit < _digits.length) {
      _digits[_focusDigit] = '$newNumber';
      _focusDigit++;
      _dateError = false;
      notifyListeners();
    }
  }

//  empty up julian display and reset error
  void resetDigits() {
    for (var i = 0; i < _digits.length; i++) {
      _digits[i] = '_';
    }
    _focusDigit = 0;
    _dateError = false;
    notifyListeners();
  }

  //  empty up julian display without changing state of error
  void resetDigitsWithError() {
    for (var i = 0; i < _digits.length; i++) {
      _digits[i] = '_';
    }
    _focusDigit = 0;
    notifyListeners();
  }

  //  make sure julian date is valid and update; show error if not
  void updateDates() {
//    check if there are any blank digits
    for (var i = 0; i < _digits.length; i++) {
      if (_digits[i] == '_') {
        _dateError = true;
      }
    }
    if (!_dateError) {
//    convert separate digits into combined julian date integer
      int _tempJulianDate = int.parse(_digits[0]) * 100 +
          int.parse(_digits[1]) * 10 +
          int.parse(_digits[2]);
//    check if julian date is from 001 to 365 or 366
      if ((_tempJulianDate > _julianEnd) | (_tempJulianDate < 1)) {
        _dateError = true;
      } else {
//        update dates
        _julianDate = _tempJulianDate;
        _packedDate = DateConverter().julianToDateTime(_tempJulianDate);
        _expirationDate =
            _packedDate.add(Duration(days: _daysFromPackToExpiration));
        DateTime _now = DateTime.now();
        DateTime _todayMidnight = DateTime(_now.year, _now.month, _now.day);
        _daysUntilExpiration =
            _expirationDate.difference(_todayMidnight).inDays;
      }
    }
    notifyListeners();
  }
}
