import 'package:flutter/material.dart';
import 'package:genus/config/Palette.dart';
import 'package:genus/config/Styles.dart';
import 'package:genus/widgets/ChatRowWidget.dart';
import 'package:genus/widgets/NavigationPullWidget.dart';

class ConversationBottomSheet extends StatefulWidget {
  @override
  _ConversationBottomSheetState createState() => _ConversationBottomSheetState();

  const ConversationBottomSheet();
}

class _ConversationBottomSheetState extends State<ConversationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            NavigationPullWidget(),
            Center(
              child: Text(
                'Messages',
                style: Styles.textHeading,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 75, right: 20),
                child: Divider(
                  color: Palette.accentColor,
                ),
              ),
              itemBuilder: (context, index){
                return ChatRowWidget();
              },
            )
          ],
        ),
      ),
    );
  }
}
