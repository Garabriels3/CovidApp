import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {

  var title;
  var fillColor;
  var textColor;
  ButtonComponent({Key key, this.title, this.fillColor, this.textColor});

  @override
  _ButtonComponentState createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: hundredSeventyTwo,
      height: fortyFour,
      child: RaisedButton(
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            twentyFour,
          ),
        ),
        onPressed: () {},
        color: widget.fillColor,
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
