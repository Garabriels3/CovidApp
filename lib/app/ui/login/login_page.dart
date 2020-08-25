import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

import 'widgets/text_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: fortyEight, left: fortyEight),
                child: Column(
                  children: [
                    TextFormFieldComponent(),
                    SizedBox(height: 20,),
                    TextFormFieldComponent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
