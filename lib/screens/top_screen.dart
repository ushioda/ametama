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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkYellow,
        title: Text(
          'あめたま',
          style: TextStyle(fontFamily: kKosugiMaru),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            JulianDisplay(),
            Expanded(
              flex: 8,
              child: ResultDisplay(),
            ),
            Expanded(
              flex: 7,
              child: KeyPad(),
            ),
          ],
        ),
      ),
    );
  }
}
