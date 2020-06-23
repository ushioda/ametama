import 'package:flutter/material.dart';
import 'package:ametama/models/date_data.dart';
import 'package:ametama/models/date_converter.dart';
import 'package:ametama/constants.dart';
import 'package:provider/provider.dart';

class ResultDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<DateData>(
        builder: (context, dateData, child) {
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
                                  dateData.expirationDate != null
                                      ? '${dateData.packedDate.month.toString()}'
                                      : '',
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
                                  dateData.expirationDate != null
                                      ? '${dateData.packedDate.day.toString()}'
                                      : '',
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
                                  dateData.expirationDate != null
                                      ? '${dateData.expirationDate.month.toString()}'
                                      : '',
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
                                  dateData.expirationDate != null
                                      ? '${dateData.expirationDate.day.toString()}'
                                      : '',
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
                                  dateData.packedDate != null
                                      ? '${DateConverter().julianToString(dateData.julianDate)}'
                                      : '',
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
                                  dateData.expirationDate != null
                                      ? (dateData.daysUntilExpiration > 0
                                          ? '${dateData.daysUntilExpiration}'
                                          : '${-dateData.daysUntilExpiration}')
                                      : '',
                                  style: TextStyle(
                                      fontSize: kFontSize1,
                                      fontWeight: FontWeight.bold,
                                      color: dateData.expirationDate != null
                                          ? (dateData.daysUntilExpiration > 0
                                              ? Colors.blueAccent
                                              : Colors.redAccent)
                                          : Colors.white),
                                ),
                                SizedBox(width: 1),
                                Text(
                                  dateData.expirationDate != null
                                      ? (dateData.daysUntilExpiration > 0
                                          ? '日後'
                                          : '日前')
                                      : '',
                                  style: TextStyle(
                                      fontFamily: kKosugiMaru,
                                      fontSize: kFontSize3,
                                      fontWeight: FontWeight.bold,
                                      color: dateData.expirationDate != null
                                          ? (dateData.daysUntilExpiration > 0
                                              ? Colors.blueAccent
                                              : Colors.redAccent)
                                          : Colors.white),
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
        },
      ),
    );
  }
}
