import 'package:flutter/material.dart';
import 'package:ametama/constants.dart';
import 'package:ametama/models/date_data.dart';
import 'package:provider/provider.dart';

class ResultHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 12, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: kFlexRatio1,
            child: Container(
              child: GestureDetector(
                  child: Icon(
                    Icons.delete_sweep,
                    color: kResultDisplayHeaderTextColor,
                    size: kResultDisplayHeaderFontSize * kIconToFontRatio,
                  ),
                  onTap: () {
                    Provider.of<DateData>(context, listen: false).removeAll();
                  }),
            ),
          ),
          Expanded(
            flex: kFlexRatio2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      'パック日',
                      style: TextStyle(
                        fontSize: kResultDisplayHeaderFontSize,
                        fontFamily: kKosugiMaru,
                        color: kResultDisplayHeaderTextColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  children: <Widget>[
                                    Text('卵がパックされた日から消費期限までの日そしてひろみちゃんがすきです数')
                                  ],
                                );
                              });
                          print('expiration date tapped');
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              '消費期限',
                              style: TextStyle(
                                fontSize: kResultDisplayHeaderFontSize,
                                fontFamily: kKosugiMaru,
                                color: kResultDisplayHeaderTextColor,
                              ),
                            ),
                            SizedBox(width: 3.0),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: kResultDisplayHeaderFontSize,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
