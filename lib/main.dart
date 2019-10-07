import 'package:flutter/material.dart';
import 'package:genus/pages/RegistrationPage.dart';
//import 'package:genus/config/Palette.dart';

void main() => runApp(Genus());

class Genus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
//        primarySwatch: Palette.primaryColor,
      ),
      home: RegistrationPage(),
    );
  }
}
