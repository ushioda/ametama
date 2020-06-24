import 'package:flutter/material.dart';
import 'package:ametama/models/date_converter.dart';
import 'package:ametama/constants.dart';

class DateCard extends StatelessWidget {
  final int julianDate;
  final int daysFromPackToExpiration;

  DateCard(
      {@required this.julianDate, @required this.daysFromPackToExpiration});

  @override
  Widget build(BuildContext context) {
    DateTime _packedDate = DateConverter().julianToDateTime(julianDate);
    DateTime _expirationDate =
        _packedDate.add(Duration(days: daysFromPackToExpiration));
    DateTime _now = DateTime.now();
    DateTime _todayMidnight = DateTime(_now.year, _now.month, _now.day);
    int _daysUntilExpiration =
        _expirationDate.difference(_todayMidnight).inDays;

    return Container(
      decoration: BoxDecoration(
          border: Border.symmetric(
        vertical: BorderSide(color: Colors.white, width: 2.0),
      )),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Icon(
              Icons.calendar_today,
              color: kDarkYellow,
              size: 35,
            ),
          ),
          Expanded(
            flex: 15,
            child: Column(
              children: <Widget>[
                /// upper row of card
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    /// packed date
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            _packedDate.month.toString(),
                            style: TextStyle(
                              fontSize: kFontSize1,
                              color: kDarkYellow,
                            ),
                          ),
                          SizedBox(width: 1),
                          Text(
                            '月',
                            style: TextStyle(
                                fontSize: kFontSize3,
                                fontFamily: kKosugiMaru,
                                color: kDarkYellow),
                          ),
                          SizedBox(width: 2),
                          Text(
                            _packedDate.day.toString(),
                            style: TextStyle(
                              fontSize: kFontSize1,
                              color: kDarkYellow,
                            ),
                          ),
                          SizedBox(width: 1),
                          Text(
                            '日',
                            style: TextStyle(
                              fontSize: kFontSize3,
                              fontFamily: kKosugiMaru,
                              color: kDarkYellow,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// expiration date
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            _expirationDate.month.toString(),
                            style: TextStyle(
                              fontSize: kFontSize1,
                              color: kDarkYellow,
                            ),
                          ),
                          SizedBox(width: 1),
                          Text(
                            '月',
                            style: TextStyle(
                                fontSize: kFontSize3,
                                fontFamily: kKosugiMaru,
                                color: kDarkYellow),
                          ),
                          SizedBox(width: 2),
                          Text(
                            _expirationDate.day.toString(),
                            style: TextStyle(
                              fontSize: kFontSize1,
                              color: kDarkYellow,
                            ),
                          ),
                          SizedBox(width: 1),
                          Text(
                            '日',
                            style: TextStyle(
                              fontSize: kFontSize3,
                              fontFamily: kKosugiMaru,
                              color: kDarkYellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// lower row of card
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    /// julian date
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            '（',
                            style: TextStyle(
                              fontSize: kFontSize2,
                              fontFamily: kKosugiMaru,
                              color: kDarkYellow,
                            ),
                          ),
                          Text(
                            '$julianDate',
                            style: TextStyle(
                              fontSize: kFontSize2,
                              color: kDarkYellow,
                            ),
                          ),
                          Text(
                            '）',
                            style: TextStyle(
                              fontSize: kFontSize2,
                              fontFamily: kKosugiMaru,
                              color: kDarkYellow,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// in how many days it expires
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            _daysUntilExpiration != 0
                                ? (_daysUntilExpiration < 0
                                    ? '${-_daysUntilExpiration}'
                                    : '$_daysUntilExpiration')
                                : '',
                            style: TextStyle(
                                fontSize: kFontSize1,
                                fontWeight: FontWeight.bold,
                                color: _daysUntilExpiration > 0
                                    ? Colors.blueAccent
                                    : Colors.redAccent),
                          ),
                          SizedBox(width: 1),
                          Text(
                            _daysUntilExpiration != 0
                                ? (_daysUntilExpiration < 0 ? '日前' : '日後')
                                : '今日',
                            style: TextStyle(
                                fontFamily: kKosugiMaru,
                                fontSize: kFontSize3,
                                fontWeight: FontWeight.bold,
                                color: _daysUntilExpiration < 0
                                    ? Colors.redAccent
                                    : Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
