import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldComponent extends StatefulWidget {
  String hintText;
  bool hideText = false;
  TextEditingController genericControler;
  String errorMessage;
  Function onChangedGeneric;

  TextFormFieldComponent(
      {this.hintText,
      this.hideText,
      this.genericControler,
      this.onChangedGeneric,
      this.errorMessage});

  @override
  _TextFormFieldComponentState createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Theme(
      data:
          ThemeData(cursorColor: rosePrimaryColor, hintColor: darkPrimaryColor),
      child: SizedBox(
        height: 50,
        width: screenSize.width,
        child: TextFormField(
          onChanged: widget.onChangedGeneric,
          controller: widget.genericControler,
          obscureText: widget.hideText,
          decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(vertical: four, horizontal: sixteen),

            hintText: widget.hintText,
            errorText: widget.errorMessage != null ? widget.errorMessage : null,
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
                color: defaultPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
