import 'package:flutter/material.dart';
import 'package:ametama/modules/julian_display.dart';
import 'package:ametama/modules/keypad.dart';

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
              child: Container(),
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
