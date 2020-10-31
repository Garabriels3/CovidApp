import 'package:covid_app/app/ui/containers/quiz/quiz_container.dart';
import 'package:covid_app/app/ui/containers/symptoms/symptoms_container.dart';
import 'package:covid_app/app/ui/quiz/quiz_viewmodel.dart';
import 'package:covid_app/app/widgets/button_component.dart';
import 'package:covid_app/app/widgets/screen_background_component.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'components/step_indicator_component.dart';

class QuizPage extends StatefulWidget {

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var vm = QuizViewModel();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: darkPrimaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Spacer(),
              StepIndicatorComponent(currentStep: vm.stepValue),
              Expanded(
                flex: 18,
                child: ScreenBackgroundComponent(
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: screenSize.height / 18,
                            child: GestureDetector(
                              onTap: () => vm.onContinueClick(context, false),
                              child: Image.asset("assets/images/previous.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: twentyEight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              vm.questionTitle,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: twentyFour,
                                fontWeight: FontWeight.w800,
                                color: darkPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: eight,
                      ),
                      Expanded(
                        child: vm.widgetForCurrentPosition(),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: sixteen),
                    child: ButtonComponent(
                      title: vm.stepValue == 0 ? buttonNextLabel : buttonFinishLabel,
                      fillColor: rosePrimaryColor,
                      textColor: Colors.white,
                      loginFun: () => vm.onContinueClick(context, true),
                      textSize: twenty,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    });
  }
}
