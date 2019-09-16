import 'package:flutter/material.dart';
import 'ConversationPage.dart';
import 'package:rubber/rubber.dart';

class ConversationPageSlide extends StatefulWidget {
  @override
  _ConversationPageSlideState createState() => _ConversationPageSlideState();

  const ConversationPageSlide();
}

class _ConversationPageSlideState extends State<ConversationPageSlide> with SingleTickerProviderStateMixin {
  var controller;

  @override
  void initState() {
    controller = RubberAnimationController(
      vsync: this,
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        ConversationPage(),
        ConversationPage(),
        ConversationPage(),
      ],
    );
  }
}
