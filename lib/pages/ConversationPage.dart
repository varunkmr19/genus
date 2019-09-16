import 'package:flutter/material.dart';
import 'package:genus/widgets/ChatAppBar.dart';
import 'package:genus/widgets/ChatListWidget.dart';
import 'package:genus/widgets/InputWidget.dart';
import 'package:genus/config/Palette.dart';
import 'package:genus/pages/ConversationBottomSheet.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();

  const ConversationPage();
}

class _ConversationPageState extends State<ConversationPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        appBar: ChatAppBar(),
        body: Container(
          color: Palette.chatBackgroundColor,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ChatListWidget(),
                  GestureDetector(
                    child: InputWidget(),
                    onPanUpdate: (info) {
                      if(info.delta.dy < 0) {
                        _scaffoldkey.currentState
                            .showBottomSheet<Null>((BuildContext context) {
                          return ConversationBottomSheet();
                        });
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
