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
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(left: seventyTwo, right: seventyTwo),
                                  child:
                                      Image.asset("assets/images/register.png"),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
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
                                          height: twenty,
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
                                Expanded(
                                  flex: 1,
                                  child: Observer(builder: (_) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          left: fortyEight,
                                          right: fortyEight),
                                      child: ButtonComponent(
                                          title: registerButtonLabel,
                                          fillColor: darkPrimaryColor,
                                          textColor: Colors.white,
                                          loginFun: vm.formIsValid
                                              ? () =>
                                                  vm.firebaseRegister(context)
                                              : null),
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
