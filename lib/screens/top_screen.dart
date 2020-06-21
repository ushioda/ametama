import 'package:ametama/constants.dart';
import 'package:ametama/models/date_data.dart';
import 'package:ametama/models/date_converter.dart';
import 'package:flutter/material.dart';
import 'package:ametama/modules/julian_display.dart';
import 'package:ametama/modules/keypad.dart';
import 'package:provider/provider.dart';

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: JulianDisplay(),
            ),
            Expanded(
              flex: 7,
              child: Consumer<DateData>(
                builder: (context, dateData, child) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'パック日',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: kKosugiMaru,
                              color: kDarkYellow,
                            ),
                          ),
                          Text(
                            '消費期限',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: kKosugiMaru,
                              color: kDarkYellow,
                            ),
                          ),
                        ],
                      ),
                      Row(
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
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    '月',
                                    style: TextStyle(
                                        fontSize: kResultDisplayFontSize,
                                        fontFamily: kKosugiMaru,
                                        color: kDarkYellow),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    dateData.expirationDate != null
                                        ? '${dateData.packedDate.day.toString()}'
                                        : '',
                                    style: TextStyle(
                                      fontSize: kResultDisplayNumberSize1,
                                      color: kDarkYellow,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
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
                                    dateData.packedDate != null
                                        ? '（${DateConverter().julianToString(dateData.julianDate)}）'
                                        : '',
                                    style: TextStyle(
                                      fontSize: 25,
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
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    '月',
                                    style: TextStyle(
                                        fontSize: kResultDisplayFontSize,
                                        fontFamily: kKosugiMaru,
                                        color: kDarkYellow),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    dateData.expirationDate != null
                                        ? '${dateData.expirationDate.day.toString()}'
                                        : '',
                                    style: TextStyle(
                                      fontSize: kResultDisplayNumberSize1,
                                      color: kDarkYellow,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
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
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    dateData.expirationDate != null
                                        ? (dateData.daysUntilExpiration > 0
                                            ? '日後'
                                            : '日前')
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
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: KeyPad(),
            ),
          ],
        ),
      ),
    );
  }
}
