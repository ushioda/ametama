import 'package:flutter/material.dart';
import 'package:ametama/widgets/digit_box.dart';
import 'package:ametama/widgets/digit_button.dart';
import 'package:ametama/widgets/icon_button.dart';

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DigitBox(1),
                  DigitBox(2),
                  DigitBox(9),
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          DigitButton(digit: 1),
                          DigitButton(digit: 2),
                          DigitButton(digit: 3),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          DigitButton(digit: 4),
                          DigitButton(digit: 5),
                          DigitButton(digit: 6),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          DigitButton(digit: 7),
                          DigitButton(digit: 8),
                          DigitButton(digit: 9),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatIconButton(
                            iconData: Icons.check,
                            onPressed: () {
                              print('icon tapped');
                            },
                          ),
                          DigitButton(digit: 0),
                          FlatIconButton(
                            iconData: Icons.clear,
                            onPressed: () {
                              print('icon tapped');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
