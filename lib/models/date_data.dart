import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:ametama/models/date_converter.dart';

class DateData extends ChangeNotifier {
  final Map<int, String> _digits = {0: '_', 1: '_', 2: '_'};
  int _focusDigit = 0;
  int _julianDate;
  bool _dateError = false;
  DateTime _packedDate;

//  the last julian date last year. 366 if leap year.
  final int _julianEnd = (DateTime.now().year / 4 == 1) ? 366 : 365;

  UnmodifiableMapView get digits => UnmodifiableMapView(_digits);
  bool get dateError => _dateError;
  int get julianEnd => _julianEnd;
  DateTime get packedDate => _packedDate;

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

//  check if there are any blank digit boxes left in julian display
  void checkBlankDigit() {
    for (var i = 0; i < _digits.length; i++) {
      if (_digits[i] == '_') {
        _dateError = true;
      }
    }
    notifyListeners();
  }

  void updateJulianDate() {
    _julianDate = int.parse(_digits[0]) * 100 +
        int.parse(_digits[1]) * 10 +
        int.parse(_digits[2]);
    notifyListeners();
  }

//  make sure julian date is actually within a year
  void checkJulianDate() {
    if ((_julianDate > _julianEnd) | (_julianDate < 1)) {
      _dateError = true;
    }
    notifyListeners();
  }

  void updatePackedDate() {
    _packedDate = DateConverter().julianToDateTime(_julianDate);
    notifyListeners();
  }
}
