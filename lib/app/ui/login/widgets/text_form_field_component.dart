import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldComponent extends StatefulWidget {
  var hintText;
  TextFormFieldComponent(this.hintText);
  @override
  _TextFormFieldComponentState createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(cursorColor: rosePrimaryColor, hintColor: darkPrimaryColor),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(twentyFour)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(twentyFour)),
            borderSide: BorderSide(width: two, color: darkPrimaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(twentyFour)),
            borderSide: BorderSide(
              width: two,
              color: rosePrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
