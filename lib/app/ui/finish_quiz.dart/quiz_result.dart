import 'package:covid_app/app/model/user.dart';
import 'package:covid_app/app/service/local/shared_preferences.dart';
import 'package:covid_app/app/ui/containers/quiz/quiz_container.dart';
import 'package:covid_app/app/ui/finish_quiz.dart/quiz_result_viewmodel.dart';
import 'package:covid_app/app/ui/home/home_page.dart';
import 'package:covid_app/app/ui/quiz/quiz_page.dart';
import 'package:covid_app/app/widgets/button_component.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizResult extends StatefulWidget {
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
      backgroundColor: darkPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(twenty),
          child: Column(
            children: <Widget>[
              Text(
                "Você não apresenta nenhum dos sintomas comuns ou graves de Covid-19 :). Continue cuidando da sua saúde e tome muito cuidado ao sair",
                style: TextStyle(fontSize: sizeDinamyc.height * 0.035),
              ),
              ButtonComponent(
                title: "Voltar",
                textColor: Colors.white,
                fillColor: rosePrimaryColor,
                loginFun: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(user: vm.user),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
