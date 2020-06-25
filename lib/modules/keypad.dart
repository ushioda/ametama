import 'package:ametama/constants.dart';
import 'package:ametama/models/date_data.dart';
import 'package:flutter/material.dart';
import 'package:ametama/components/buttons.dart';
import 'package:provider/provider.dart';

class KeyPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(kBasicBorderWidth * 0.5),
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
                  iconData: Icons.clear,
                  onPressed: () {
                    Provider.of<DateData>(context, listen: false).resetDigits();
                  },
                ),
                DigitButton(digit: 0),
                Consumer<DateData>(builder: (context, dateData, child) {
                  return FlatIconButton(
                    iconData: Icons.check,
                    onPressed: () {
                      dateData.updateDate();
                      if (dateData.dateError) {
                        dateData.resetDigitsWithError();
                      } else {
                        dateData.resetDigits();
                        dateData.addJulian();
                      }
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
