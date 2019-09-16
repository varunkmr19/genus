import 'package:flutter/material.dart';
import 'package:genus/config/Palette.dart';

class NavigationPullWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Center(
              child: Wrap(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Palette.accentColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
