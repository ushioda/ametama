import 'package:flutter/material.dart';
import 'package:ametama/constants.dart';

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
            print(digit);
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
