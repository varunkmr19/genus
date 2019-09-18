import 'package:flutter/material.dart';
import 'package:genus/pages/ConversationPage.dart';
import 'package:genus/pages/ConversationBottomSheet.dart';
import 'package:genus/widgets/InputWidget.dart';
import 'package:rubber/rubber.dart';

class ConversationPageSlide extends StatefulWidget {
  @override
  _ConversationPageSlideState createState() => _ConversationPageSlideState();

  const ConversationPageSlide();
}

class _ConversationPageSlideState extends State<ConversationPageSlide> with SingleTickerProviderStateMixin {
  var controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = RubberAnimationController(
      vsync: this,
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                children: <Widget>[
                  ConversationPage(),
                  ConversationPage(),
                  ConversationPage(),
                ],
              ),
            ),
            Container(
              child: GestureDetector(
                child: InputWidget(),
                onPanUpdate: (info) {
                  if(info.delta.dy < 0) {
                    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context){
                      return ConversationBottomSheet();
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
