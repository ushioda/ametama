import 'package:ametama/constants.dart';
import 'package:flutter/material.dart';
import 'package:ametama/modules/julian_display.dart';
import 'package:ametama/modules/keypad.dart';
import 'package:ametama/modules/result_header.dart';
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
        actions: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onTap: () {
              print('info tapped');
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: kLightYellow,
              child: Column(
                children: <Widget>[
                  JulianDisplay(),
                  ResultHeader(),
                ],
              ),
            ),
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
