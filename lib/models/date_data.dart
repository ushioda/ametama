import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DateData extends ChangeNotifier {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Map<int, String> _digits = {0: '_', 1: '_', 2: '_'};
  List<int> _julianList = [];

  int _focusDigit = 0;
  int _julianDate;
  int _daysFromPackToExpiration = 14;
  bool _dateError = false;

  /// the last julian date last year. 366 if leap year.
  final int _julianEnd = (DateTime.now().year / 4 == 1) ? 366 : 365;

  GlobalKey<AnimatedListState> get listKey => _listKey;
  UnmodifiableMapView get digits => UnmodifiableMapView(_digits);
  UnmodifiableListView get julianList => UnmodifiableListView(_julianList);

  int get julianDate => _julianDate;

  int get daysFromPackToExpiration => _daysFromPackToExpiration;

  bool get dateError => _dateError;

  int get julianEnd => _julianEnd;

  ///  enter digit into digit box and move on to next digit box
  void changeDigit(int newNumber) {
    if (_focusDigit < _digits.length) {
      _digits[_focusDigit] = '$newNumber';
      _focusDigit++;
      _dateError = false;
      notifyListeners();
    }
  }

  /// empty up julian display and reset error
  void resetDigits() {
    for (var i = 0; i < _digits.length; i++) {
      _digits[i] = '_';
    }
    _focusDigit = 0;
    _dateError = false;
    notifyListeners();
  }

  /// empty up julian display without changing state of error
  void resetDigitsWithError() {
    for (var i = 0; i < _digits.length; i++) {
      _digits[i] = '_';
    }
    _focusDigit = 0;
    notifyListeners();
  }

  /// make sure julian date is valid and update; show error if not
  void updateDate() {
    /// check if there are any blank digits
    for (var i = 0; i < _digits.length; i++) {
      if (_digits[i] == '_') {
        _dateError = true;
      }
    }
    if (!_dateError) {
      /// convert separate digits into combined julian date integer
      int _tempJulianDate = int.parse(_digits[0]) * 100 +
          int.parse(_digits[1]) * 10 +
          int.parse(_digits[2]);

      /// check if julian date is from 001 to 365 or 366
      if ((_tempJulianDate > _julianEnd) | (_tempJulianDate < 1)) {
        _dateError = true;
      } else {
        /// update date
        _julianDate = _tempJulianDate;
      }
    }
    notifyListeners();
  }

  void addJulian() {
    _julianList.insert(0, _julianDate);
    _listKey.currentState.insertItem(0);
    _julianDate = 0;
    notifyListeners();
  }
}
