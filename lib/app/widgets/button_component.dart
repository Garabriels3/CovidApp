import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {
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
        color: rosePrimaryColor,
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
