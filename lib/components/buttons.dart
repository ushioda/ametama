import 'package:ametama/models/date_data.dart';
import 'package:flutter/material.dart';
import 'package:ametama/constants.dart';
import 'package:provider/provider.dart';

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
          color: kLightYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
                color: Colors.white,
                width: kBasicBorderWidth * 0.5,
                style: BorderStyle.solid),
          ),
          onPressed: () {
            Provider.of<DateData>(context, listen: false).changeDigit(digit);
          },
          child: Text(
            '$digit',
            style: TextStyle(
              color: Colors.white,
              fontSize:
                  MediaQuery.of(context).size.height * kButtonFontSizeRatio,
            ),
          ),
        ),
      ),
    );
  }
}

class FlatIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;

  FlatIconButton({this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ButtonTheme(
        minWidth: double.infinity,
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: kDarkYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
                color: Colors.white,
                width: kBasicBorderWidth * 0.5,
                style: BorderStyle.solid),
          ),
          onPressed: onPressed,
          child: Icon(
            iconData,
            color: Colors.white,
            size: MediaQuery.of(context).size.height *
                kButtonFontSizeRatio *
                kIconToFontRatio,
          ),
        ),
      ),
    );
  }
}
