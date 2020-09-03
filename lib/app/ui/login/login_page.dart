import 'package:covid_app/app/ui/login/login_viewmodel.dart';
import 'package:covid_app/app/widgets/KeyboardHideable.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../widgets/button_component.dart';
import 'widgets/text_form_field_component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var vm = LoginViewModel();
  var value = zero;
  var valueTextFields = sixtyEight;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  void animatedTest() async {
    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        value = sixtyEight;
        valueTextFields = zero;
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
                                Spacer(),
                                Expanded(
                                  flex: 10,
                                  child: AnimatedContainer(
                                      margin: EdgeInsets.only(bottom: value),
                                      duration: Duration(seconds: 1),
                                      child: Image.asset(
                                          "assets/images/logo_covid_app.png")),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: AnimatedContainer(
                                    margin:
                                        EdgeInsets.only(top: valueTextFields),
                                    duration: Duration(seconds: 1),
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: Observer(
                                            builder: (_) =>
                                                TextFormFieldComponent(
                                                    emailHintText,
                                                    false,
                                                    controllerEmail,
                                                    vm.changeEmail,
                                                    vm.emailIsValid()),
                                          ),
                                        ),
                                        SizedBox(
                                          height: four,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Observer(builder: (_) {
                                            return TextFormFieldComponent(
                                                passwordHintText,
                                                true,
                                                controllerPassword,
                                                vm.changePassword,
                                                vm.passwordIsValid());
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
                                  flex: 2,
                                  child: Observer(
                                    builder: (_) => ButtonComponent(
                                      title: loginButtonLabel,
                                      fillColor: rosePrimaryColor,
                                      textColor: Colors.white,
                                      loginFun: vm.formIsValid
                                          ? () => vm.firebaseLogin(context)
                                          : null,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: twenty,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ButtonComponent(
                                      title: registerButtonLabel,
                                      fillColor: darkPrimaryColor,
                                      textColor: Colors.white,
                                      loginFun: () {}),
                                ),
                                Spacer()
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
