import 'dart:collection';
import 'package:ametama/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateData extends ChangeNotifier {
  DateData() {
    retrieveEggDuration();
  }

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Map<int, String> _digits = {0: '', 1: '', 2: ''};
  List<int> _julianList = [];

  int _focusDigit = 0;
  int _julianDate;
  int _eggDuration;
  bool _dateError = false;

  /// the last julian date last year. 366 if leap year.
  final int _julianEnd = (DateTime.now().year / 4 == 1) ? 366 : 365;

  GlobalKey<AnimatedListState> get listKey => _listKey;
  UnmodifiableMapView get digits => UnmodifiableMapView(_digits);
  UnmodifiableListView get julianList => UnmodifiableListView(_julianList);

  int get julianDate => _julianDate;

  int get eggDuration => _eggDuration;

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
      _digits[i] = '';
    }
    _focusDigit = 0;
    _dateError = false;
    notifyListeners();
  }

  /// empty up julian display without changing state of error
  void resetDigitsWithError() {
    for (var i = 0; i < _digits.length; i++) {
      _digits[i] = '';
    }
    _focusDigit = 0;
    notifyListeners();
  }

  /// make sure julian date is valid and update; show error if not
  void updateDate() {
    /// check if there are any blank digits
    for (var i = 0; i < _digits.length; i++) {
      if (_digits[i] == '') {
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

  /// add julian date to julian list
  void addJulian() {
    _julianList.insert(0, _julianDate);
    _listKey.currentState.insertItem(0);
    _julianDate = 0;
    notifyListeners();
  }

  /// remove selected julian date from list; no animation for dismissible widget
  void removeJulian(int _selectedInt) {
    _listKey.currentState.removeItem(_selectedInt, (_, __) => Container());
    _julianList.removeAt(_selectedInt);
    notifyListeners();
  }

  /// remove all dates from julian list
  void removeAll() {
    int listLength = _julianList.length;
    for (int i = 0; i < listLength; i++) {
      _listKey.currentState.removeItem(0, (_, __) => Container());
      _julianList.removeAt(0);
    }
  }

  /// update egg duration
  void updateEggDuration(int newValue) {
    _eggDuration = newValue;
    notifyListeners();
  }

  /// set egg duration to user preference initially
  void retrieveEggDuration() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int initialEggDuration =
        preferences.getInt(kSharedPreferencesKey) ?? kInitialEggDuration;
    _eggDuration = initialEggDuration;
    notifyListeners();
  }

  /// save duration to shared preference
  void saveDurationPreference(int duration) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences
        .setInt(kSharedPreferencesKey, duration)
        .then((bool success) => duration);
  }
}
