import 'package:covid_app/app/widgets/KeyboardHideable.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';
import '../../widgets/button_component.dart';
import 'widgets/text_form_field_component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return KeyboardHideable(
      child: Scaffold(
        backgroundColor: darkPrimaryColor,
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
                        borderRadius:
                            BorderRadius.all(Radius.circular(twentyFour)),
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
                            ButtonComponent()
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
