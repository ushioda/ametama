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
      backgroundColor: Colors.white,
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
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'パック日',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            dateData.packedDate != null
                                ? '${dateData.packedDate.month.toString()}月${dateData.packedDate.day.toString()}日'
                                : '',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            dateData.packedDate != null
                                ? '（${DateConverter().julianToString(dateData.julianDate)}）'
                                : '',
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '消費期限',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            dateData.expirationDate != null
                                ? '${dateData.expirationDate.month.toString()}月${dateData.expirationDate.day.toString()}日'
                                : '',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            dateData.expirationDate != null
                                ? (dateData.daysUntilExpiration > 0
                                    ? '${dateData.daysUntilExpiration}日後'
                                    : '${-dateData.daysUntilExpiration}日前')
                                : '',
                            style: TextStyle(
                                fontSize: 30,
                                color: dateData.expirationDate != null
                                    ? (dateData.daysUntilExpiration > 0
                                        ? Colors.blueAccent
                                        : Colors.redAccent)
                                    : Colors.white),
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
