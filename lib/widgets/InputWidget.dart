import 'package:flutter/material.dart';
import 'package:genus/config/Palette.dart';
import 'package:genus/pages/ConversationBottomSheet.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  InputWidget();
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 60.0,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Palette.greyColor, width: 0.5)
          ),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Material(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1.0),
                child: IconButton(
                  onPressed: () => {
                    showBottomSheet(
                      context: context,
                      builder: (BuildContext b) {
                        return Container(
                          child: Wrap(
                            children: <Widget>[
                              ConversationBottomSheet()
                            ],
                          ),
                        );
                      }
                    )
                  },
                    icon: Icon(Icons.face),
                    color: Palette.accentColor,
                ),
              ),
            ),
            Flexible(
              child: Material(
                child: Container(
                  child: TextField(
                    style: TextStyle(color: Palette.primaryTextColor, fontSize: 15.0),
                    controller: textEditingController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(color: Palette.greyColor),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => {},
                  color: Palette.accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
