import 'package:flutter/material.dart';
import 'package:ametama/constants.dart';
import 'package:ametama/widgets/digit_box.dart';

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
                          IconButton(
                            iconData: Icons.check,
                          ),
                          DigitButton(digit: 0),
                          IconButton(
                            iconData: Icons.clear,
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

class DigitButton extends StatelessWidget {
  final int digit;

  DigitButton({this.digit});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ButtonTheme(
        minWidth: double.infinity,
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: kMyLightYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
          onPressed: () {
            print('$digit');
          },
          child: Text(
            '$digit',
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.06,
            ),
          ),
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final IconData iconData;

  IconButton({this.iconData});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ButtonTheme(
        minWidth: double.infinity,
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: kMyDarkYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
          onPressed: () {
            print('icon button tapped');
          },
          child: Icon(
            iconData,
            color: Colors.white,
            size: MediaQuery.of(context).size.height * 0.06,
          ),
        ),
      ),
    );
  }
}
