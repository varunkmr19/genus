import 'package:flutter/material.dart';
import 'ChatItemWidget.dart';

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index) => ChatItemWidget(index),
      itemCount: 20,
      reverse: true,
      controller: listScrollController,
    );
  }
}
