import 'package:covid_app/app/ui/login/login_viewmodel.dart';
import 'package:covid_app/app/widgets/KeyboardHideable.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../widgets/button_component.dart';
import '../../widgets/text_form_field_component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var vm = LoginViewModel();
  var value = fortyFour;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  void animatedTest() async {
    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        value = zero;
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
    var screenSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: KeyboardHideable(
        child: Scaffold(
          backgroundColor: darkPrimaryColor,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(sixteen),
                    child: Expanded(
                      child: Card(
                        elevation: twelve,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(twentyFour)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: thirtyTwo,
                              right: thirtyTwo,
                              top: thirtyTwo),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: screenSize.height * 0.03,
                              ),
                              AnimatedContainer(
                                height: screenSize.height / 6,
                                margin: EdgeInsets.only(top: value),
                                duration: Duration(seconds: 1),
                                child: Image.asset(
                                    "assets/images/logo_covid_app.png"),
                              ),
                              SizedBox(height: screenSize.height / 12),
                              Observer(builder: (_) {
                                return TextFormFieldComponent(
                                  hintText: emailHintText,
                                  hideText: false,
                                  genericControler: controllerEmail,
                                  onChangedGeneric: vm.changeEmail,
                                  errorMessage: vm.emailIsValid(),
                                );
                              }),
                              SizedBox(height: twenty),
                              Observer(builder: (_) {
                                return TextFormFieldComponent(
                                  hintText: passwordHintText,
                                  hideText: true,
                                  genericControler: controllerPassword,
                                  onChangedGeneric: vm.changePassword,
                                  errorMessage: vm.passwordIsValid(),
                                );
                              }),
                              SizedBox(height: screenSize.height * 0.04),
                              GestureDetector(
                                onTap: () =>
                                    vm.forgotPasswordNavigator(context),
                                child: Text(
                                  forgotPasswordLabel,
                                  style: TextStyle(
                                      color: darkPrimaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.1),
                              Observer(
                                builder: (_) => ButtonComponent(
                                  title: loginButtonLabel,
                                  fillColor: rosePrimaryColor,
                                  textColor: Colors.white,
                                  loginFun: vm.formIsValid
                                      ? () => vm.firebaseLogin(context)
                                      : null,
                                  textSize: twenty,
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.02),
                              ButtonComponent(
                                title: registerButtonLabel,
                                fillColor: darkPrimaryColor,
                                textColor: Colors.white,
                                loginFun: () => vm.registerNavigator(context),
                                textSize: twenty,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
