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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(flex: kFlexRatio1, child: Container()),
                        Expanded(
                          flex: kFlexRatio2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'ひろみの日',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: kFontSize2,
                                      fontFamily: kKosugiMaru,
                                      color: kDarkYellow,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    '消費期限',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: kFontSize2,
                                      fontFamily: kKosugiMaru,
                                      color: kDarkYellow,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
