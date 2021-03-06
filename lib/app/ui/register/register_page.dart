import 'package:covid_app/app/ui/register/register_viewmodel.dart';
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
  var vm = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
                                Row(
                                  children: [
                                    Container(
                                      height: screenSize.height / 14,
                                      child: GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Image.asset(
                                            "assets/images/previous.png"),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: screenSize.height / 5,
                                  child:
                                      Image.asset("assets/images/register.png"),
                                ),
                                SizedBox(height: thirtyTwo),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Observer(builder: (_) {
                                          return TextFormFieldComponent(
                                              hintText: registerNameHintText,
                                              hideText: false,
                                              onChangedGeneric: vm.changeName);
                                        }),
                                        SizedBox(
                                          height: sixteen,
                                        ),
                                        Observer(
                                          builder: (_) =>
                                              TextFormFieldComponent(
                                            hintText: registerEmailHintText,
                                            hideText: false,
                                            onChangedGeneric: vm.changeEmail,
                                            errorMessage: vm.emailIsValid(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: sixteen,
                                        ),
                                        Observer(builder: (_) {
                                          return TextFormFieldComponent(
                                              hintText:
                                                  registerPasswordHintText,
                                              hideText: true,
                                              onChangedGeneric:
                                                  vm.changePassword,
                                              errorMessage:
                                                  vm.passwordIsValid());
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                                Observer(builder: (_) {
                                  return Container(
                                    child: ButtonComponent(
                                      title: registerButtonLabel,
                                      fillColor: darkPrimaryColor,
                                      textColor: Colors.white,
                                      loginFun: vm.formIsValid
                                          ? () => vm.firebaseRegister(context)
                                          : null,
                                      textSize: twenty,
                                    ),
                                  );
                                }),
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
