import 'package:flutter/material.dart';
import 'package:genus/config/Palette.dart';
import 'package:intl/intl.dart';

class ChatItemWidget extends StatelessWidget {
  var index;
  ChatItemWidget(this.index);

  @override
  Widget build(BuildContext context) {
    if(index % 2 == 0) {
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Palette.sentMessageBackgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'This is a sent message',
                    style: TextStyle(color: Palette.sentMessageColor),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                  child: Text(
                    DateFormat('dd MMM kk:mm').format(DateTime.fromMillisecondsSinceEpoch(1565888474278)),
                    style: TextStyle(
                      color: Palette.greyColor,
                      fontSize: 12.0,
                      fontStyle: FontStyle.normal
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );

    } else {
      return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Palette.receiveMessageBackgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'This is a received message',
                    style: TextStyle(color: Palette.receiveMessageColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                  child: Text(
                    DateFormat('dd MMM kk:mm').format(DateTime.fromMillisecondsSinceEpoch(1565888474278)),
                    style: TextStyle(
                      color: Palette.greyColor,
                      fontSize: 12.0,
                      fontStyle: FontStyle.normal
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
  }
}

