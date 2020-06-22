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
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        dateData.expirationDate != null
                            ? '${dateData.packedDate.month.toString()}'
                            : '',
                        style: TextStyle(
                          fontSize: kResultDisplayNumberSize1,
                          color: kDarkYellow,
                        ),
                      ),
                      SizedBox(width: 1),
                      Text(
                        '月',
                        style: TextStyle(
                            fontSize: kResultDisplayFontSize,
                            fontFamily: kKosugiMaru,
                            color: kDarkYellow),
                      ),
                      SizedBox(width: 2),
                      Text(
                        dateData.expirationDate != null
                            ? '${dateData.packedDate.day.toString()}'
                            : '',
                        style: TextStyle(
                          fontSize: kResultDisplayNumberSize1,
                          color: kDarkYellow,
                        ),
                      ),
                      SizedBox(width: 1),
                      Text(
                        '日',
                        style: TextStyle(
                          fontSize: kResultDisplayFontSize,
                          fontFamily: kKosugiMaru,
                          color: kDarkYellow,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '（',
                        style: TextStyle(
                          fontSize: kResultDisplayNumberSize2,
                          fontFamily: kKosugiMaru,
                          color: kDarkYellow,
                        ),
                      ),
                      Text(
                        dateData.packedDate != null
                            ? '${DateConverter().julianToString(dateData.julianDate)}'
                            : '',
                        style: TextStyle(
                          fontSize: kResultDisplayNumberSize2,
                          color: kDarkYellow,
                        ),
                      ),
                      Text(
                        '）',
                        style: TextStyle(
                          fontSize: kResultDisplayNumberSize2,
                          fontFamily: kKosugiMaru,
                          color: kDarkYellow,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        dateData.expirationDate != null
                            ? '${dateData.expirationDate.month.toString()}'
                            : '',
                        style: TextStyle(
                          fontSize: kResultDisplayNumberSize1,
                          color: kDarkYellow,
                        ),
                      ),
                      SizedBox(width: 1),
                      Text(
                        '月',
                        style: TextStyle(
                            fontSize: kResultDisplayFontSize,
                            fontFamily: kKosugiMaru,
                            color: kDarkYellow),
                      ),
                      SizedBox(width: 2),
                      Text(
                        dateData.expirationDate != null
                            ? '${dateData.expirationDate.day.toString()}'
                            : '',
                        style: TextStyle(
                          fontSize: kResultDisplayNumberSize1,
                          color: kDarkYellow,
                        ),
                      ),
                      SizedBox(width: 1),
                      Text(
                        '日',
                        style: TextStyle(
                          fontSize: kResultDisplayFontSize,
                          fontFamily: kKosugiMaru,
                          color: kDarkYellow,
                        ),
                      ),
                    ],
                  ),
                  Row(
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
                            fontSize: kResultDisplayNumberSize1,
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
                            ? (dateData.daysUntilExpiration > 0 ? '日後' : '日前')
                            : '',
                        style: TextStyle(
                            fontFamily: kKosugiMaru,
                            fontSize: kResultDisplayFontSize,
                            fontWeight: FontWeight.bold,
                            color: dateData.expirationDate != null
                                ? (dateData.daysUntilExpiration > 0
                                    ? Colors.blueAccent
                                    : Colors.redAccent)
                                : Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
