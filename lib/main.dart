import 'package:flutter/material.dart';
import 'pages/ConversationPageList.dart';

void main() => runApp(Genus());

class Genus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConversationPageList(),
    );
  }
}
