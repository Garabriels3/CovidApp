import 'package:covid_app/app/ui/forgot_password/forgot_password_page.dart';
import 'package:covid_app/app/ui/home/home_page.dart';
import 'package:covid_app/app/ui/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app/ui/splashscreen/splashscreen_page.dart';

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
