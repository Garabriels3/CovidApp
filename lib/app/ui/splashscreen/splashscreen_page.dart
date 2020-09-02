import 'package:covid_app/app/ui/login/login_page.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Material(
    child: Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 3,
          navigateAfterSeconds: LoginPage(),
          backgroundColor: darkPrimaryColor,
          loaderColor: darkPrimaryColor,
        ),
        Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/logo_covid_app_3x.png"),
              SizedBox(height: sixteen,),
              Text(
                "COVID ANALYTIC",
                style: TextStyle(
                  fontSize: thirtyTwo,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
