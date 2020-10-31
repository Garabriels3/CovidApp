import 'package:covid_app/app/ui/forgot_password/forgot_password_page.dart';
import 'package:covid_app/app/ui/home/home_page.dart';
import 'package:covid_app/app/ui/quiz/quiz_page.dart';
import 'package:covid_app/app/ui/register/register_page.dart';
import 'package:covid_app/app/utils/empty_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/ui/finish_quiz.dart/quiz_result.dart';
import 'app/ui/new_details/news_details_page.dart';
import 'app/ui/splashscreen/splashscreen_page.dart';

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Covid Analytic',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}
