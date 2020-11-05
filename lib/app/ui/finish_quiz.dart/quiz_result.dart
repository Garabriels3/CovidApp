import 'package:covid_app/app/ui/finish_quiz.dart/quiz_result_viewmodel.dart';
import 'package:covid_app/app/ui/home/home_page.dart';
import 'package:covid_app/app/widgets/button_component.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';

class QuizResult extends StatefulWidget {
  String orientationLabel;
  bool isBadResult;

  QuizResult({this.isBadResult, this.orientationLabel});
  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  var vm = QuizResultViewModel();

  @override
  void initState() {
    super.initState();
    vm.getValueCache();
  }

  @override
  Widget build(BuildContext context) {
    var sizeDinamyc = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.isBadResult ? darkPrimaryColor : Colors.white,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(right: twenty, left: twenty, top: sixteen),
          child: Column(
            children: <Widget>[
              SizedBox(height: twenty),
              Text(
                widget.orientationLabel,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: sizeDinamyc.height * 0.035,
                    color: widget.isBadResult ? Colors.white : darkPrimaryColor,
                    fontWeight:
                        widget.isBadResult ? FontWeight.w300 : FontWeight.w400),
              ),
              Image.asset(
                widget.isBadResult ? badResultImage : goodResultImage,
                width: threeHundredTwenty,
                height: threeHundredTwenty,
              ),
              SizedBox(height: twelve),
              Visibility(
                visible: widget.isBadResult,
                child: ButtonComponent(
                  title: makeExamLabel,
                  textColor: Colors.white,
                  fillColor: rosePrimaryColor,
                  loginFun: () => vm.launchURL()
                ),
              ),
              Visibility(
                visible: widget.isBadResult,
                child: SizedBox(height: twelve),
              ),
              ButtonComponent(
                title: backButtonLabel,
                textColor: Colors.white,
                fillColor: rosePrimaryColor,
                loginFun: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(user: vm.user),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
