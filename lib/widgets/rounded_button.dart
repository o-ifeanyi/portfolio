import 'package:flutter/material.dart';

import '../util/config.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function callBack;
  RoundedButton({this.text, this.callBack});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.yMargin(context, 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Theme.of(context).textTheme.bodyText1.color,
          width: 2.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 50),
          color: Colors.transparent,
          elevation: 4,
          hoverElevation: 8,
          hoverColor: Theme.of(context).accentColor,
          animationDuration: Duration(milliseconds: 300),
          child: Text(
            text,
            style: TextStyle(
              fontSize: Config.xMargin(context, 3),
            ),
          ),
          onPressed: callBack,
        ),
      ),
    );
  }
}
