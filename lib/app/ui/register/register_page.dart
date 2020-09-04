import 'package:covid_app/app/widgets/text_form_field_component.dart';
import 'package:covid_app/app/widgets/KeyboardHideable.dart';
import 'package:covid_app/app/widgets/button_component.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var valueImage = ninetyTwo;
  var valueTextFields = twelve;

  void animatedTest() async {
    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        valueImage = zero;
        valueTextFields = eighty;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    animatedTest();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardHideable(
      child: Scaffold(
        backgroundColor: darkPrimaryColor,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
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
                                SizedBox(height: twentyEight,),
                                Expanded(
                                  flex: 3,
                                  child: AnimatedContainer(
                                      margin:
                                          EdgeInsets.only(bottom: valueImage),
                                      duration: Duration(seconds: 1),
                                      child: Image.asset(
                                          "assets/images/register.png")),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: AnimatedContainer(
                                    margin:
                                        EdgeInsets.only(top: valueTextFields),
                                    duration: Duration(seconds: 1),
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Observer(
                                            builder: (_) =>
                                                TextFormFieldComponent(
                                              hintText: registerEmailHintText,
                                              hideText: false,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: twenty,
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Observer(builder: (_) {
                                            return TextFormFieldComponent(
                                                hintText:
                                                    registerPasswordHintText,
                                                hideText: false);
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: twentyEight,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ButtonComponent(
                                      title: registerButtonLabel,
                                      fillColor: darkPrimaryColor,
                                      textColor: Colors.white,
                                      loginFun: () {}),
                                ),
                                SizedBox(height: sixteen,)
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
        ),
      ),
    );
  }
}
