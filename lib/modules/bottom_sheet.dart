import 'package:ametama/constants.dart';
import 'package:ametama/models/date_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DurationSelector extends StatefulWidget {
  final int eggDurationInitial;
  DurationSelector({@required this.eggDurationInitial});

  @override
  _DurationSelectorState createState() => _DurationSelectorState();
}

class _DurationSelectorState extends State<DurationSelector> {
  int _eggDuration;

  @override
  void initState() {
    _eggDuration = this.widget.eggDurationInitial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '卵がパック詰めされた日から',
          style: TextStyle(
            fontFamily: kKosugiMaru,
            fontSize: kFontSize3,
            color: kDarkYellow,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          '消費期限までの日数',
          style: TextStyle(
            fontFamily: kKosugiMaru,
            fontSize: kFontSize3,
            color: kDarkYellow,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 40.0,
            ),
            SizedBox(
              width: 40.0,
              child: Center(
                child: Text(
                  _eggDuration.toString(),
                  style: TextStyle(
                    fontSize: kFontSize1,
                    color: kDarkYellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
              width: 40.0,
              child: IconButton(
                  icon: Icon(
                    Icons.settings_backup_restore,
                    color: kDarkYellow,
                  ),
                  onPressed: () {
                    setState(() {
                      _eggDuration = kEggDurationInitial;
                    });
                  }),
            )
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Slider(
              activeColor: kLightYellow,
              inactiveColor: kMyShadow,
              value: _eggDuration.toDouble(),
              min: 7.0,
              max: 28.0,
              onChanged: (double newValue) {
                setState(() {
                  _eggDuration = newValue.round();
                });
              }),
        ),
        SizedBox(height: 10.0),
        FlatButton(
            onPressed: () {
              Provider.of<DateData>(context, listen: false)
                  .updateEggDuration(_eggDuration);
              Navigator.pop(context);
            },
            color: kDarkYellow,
            child: Text(
              '更新',
              style: TextStyle(
                fontFamily: kKosugiMaru,
                fontSize: kFontSize3,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
