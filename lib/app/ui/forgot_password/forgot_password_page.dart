import 'package:covid_app/app/ui/forgot_password/forgot_password_viewmodel.dart';
import 'package:covid_app/app/widgets/KeyboardHideable.dart';
import 'package:covid_app/app/widgets/button_component.dart';
import 'package:covid_app/app/widgets/text_form_field_component.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FortgotPassword extends StatefulWidget {
  @override
  _FortgotPasswordState createState() => _FortgotPasswordState();
}

class _FortgotPasswordState extends State<FortgotPassword> {
  var vm = ForgotPasswordViewModel();

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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: fortyFour,
                                  width: fortyFour,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Image.asset(
                                        "assets/images/previous.png"),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: seventyTwo, right: seventyTwo),
                                  child:
                                      Image.asset("assets/images/password.png"),
                                ),
                                Spacer(),
                                Text(
                                  resetPasswordExplainLabel,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: darkPrimaryColor,
                                      fontSize: sixteen,
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Observer(
                                          builder: (_) =>
                                              TextFormFieldComponent(
                                            hintText: resetEmailHint,
                                            genericControler: vm.controller,
                                            hideText: false,
                                            onChangedGeneric: vm.changeEmail,
                                            errorMessage: vm.emailIsValid(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Observer(builder: (_) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          left: fortyEight, right: fortyEight),
                                      child: ButtonComponent(
                                        title: sendResetEmail,
                                        fillColor: darkPrimaryColor,
                                        textColor: Colors.white,
                                        loginFun: vm.emailIsValidButton() ? () => vm.resetPassword(context) : null,
                                      ),
                                    );
                                  }),
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
        ),
      ),
    );
  }
}
