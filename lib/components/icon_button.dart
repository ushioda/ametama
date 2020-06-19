import 'package:flutter/material.dart';
import 'package:ametama/constants.dart';

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
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
          onPressed: onPressed,
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
