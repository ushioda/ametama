import 'package:ametama/constants.dart';
import 'package:flutter/material.dart';
import 'package:ametama/modules/julian_display.dart';
import 'package:ametama/modules/keypad.dart';
import 'package:ametama/modules/result_display.dart';

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
              child: Column(
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
                  ResultDisplay(),
                ],
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
