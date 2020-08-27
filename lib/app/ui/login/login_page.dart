import 'package:covid_app/app/widgets/KeyboardHideable.dart';
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
    return KeyboardHideable(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(sixteen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Card(
                      elevation: twelve,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(hundredNinetySix)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(thirtyTwo),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                TextFormFieldComponent("Email"),
                                SizedBox(
                                  height: twenty,
                                ),
                                TextFormFieldComponent("Senha"),
                              ],
                            ),
                            SizedBox(
                              height: thirtyTwo,
                            ),
                            Container(
                              width: hundredSeventyTwo,
                              height: fortyFour,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    twentyFour,
                                  ),
                                ),
                                onPressed: null,
                                color: Colors.white30,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
