import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonComponent extends StatefulWidget {
  var title;
  var fillColor;
  var textColor;
  var textSize;
  Function loginFun;
  ButtonComponent(
      {Key key, this.title, this.fillColor, this.textColor, this.loginFun, this.textSize});

  @override
  _ButtonComponentState createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height / 14,
      width: screenSize.width / 2,
      child: RaisedButton(
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            twentyFour,
          ),
        ),
        onPressed: widget.loginFun,
        color: widget.fillColor,
        child: Text(
          widget.title,
          style: TextStyle(
              color: widget.textColor,
              fontSize: widget.textSize,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
