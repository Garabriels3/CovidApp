import 'dart:ui';

import 'package:covid_app/app/widgets/button_component.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
}

Widget _body(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromRGBO(50, 92, 127, 0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            _text(title: "São Paulo, SP", color: Colors.white),
            _underlineBlackGradient(),
            _row(labelTextTitle: "Casos", dataTextTitle: "123123"),
            _underlineBlackGradient(),
            _row(labelTextTitle: "Suspeitos", dataTextTitle: "123123"),
            _underlineBlackGradient(),
            _row(labelTextTitle: "Mortos", dataTextTitle: "123123"),
            _underlineBlackGradient(),
            Align(
              alignment: Alignment.center,
              child:
                  _text(title: "04/09/2020", fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
      ButtonComponent(
        fillColor: darkPrimaryColor,
        textColor: Colors.white,
        title: 'Quiz',
        loginFun: () {},
      ),
    ],
  );
}

Row _row({
  String labelTextTitle = "default",
  double labelTextFontSize = 20,
  Color labelTextColor = Colors.white,
  String dataTextTitle = "default",
  double dataTextFontSize = 20,
  Color dataTextColor = Colors.white,
}) {
  return Row(
    children: <Widget>[
      _labelText(
          title: labelTextTitle,
          fontSize: dataTextFontSize,
          color: dataTextColor),
      Spacer(),
      _dataText(
          title: dataTextTitle,
          fontSize: labelTextFontSize,
          color: labelTextColor),
    ],
  );
}

Text _labelText(
    {String title = "default",
    double fontSize = 25,
    Color color = Colors.black}) {
  return Text(
    title,
    style: TextStyle(fontSize: fontSize, color: color),
  );
}

Text _dataText(
    {String title = "default",
    double fontSize = 20,
    Color color = Colors.black}) {
  return Text(
    title,
    style: TextStyle(fontSize: fontSize, color: color),
  );
}

Text _text(
    {String title = "default",
    double fontSize = 30,
    Color color = Colors.black}) {
  return Text(
    title,
    style: TextStyle(fontSize: fontSize, color: color),
  );
}

SizedBox _underlineBlackGradient() {
  return SizedBox(
    height: 2,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        gradient: LinearGradient(
          begin: Alignment(1.0, 0.0),
          end: Alignment(-1.0, 0.0),
          colors: [
            Color.fromRGBO(00, 00, 00, 0.2),
            Color.fromRGBO(00, 00, 00, 0.5),
            Color.fromRGBO(00, 00, 00, 1),
            Color.fromRGBO(00, 00, 00, 0.5),
            Color.fromRGBO(00, 00, 00, 0.2),
          ],
        ),
      ),
    ),
  );
}
