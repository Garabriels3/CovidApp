import 'package:covid_app/app/respository/covid_api.dart';
import 'package:covid_app/app/service/geocoding/geocoding_service.dart';
import 'package:covid_app/app/service/geolocator/geolocator_service.dart';
import 'package:covid_app/app/ui/containers/quiz/quiz_container_viewmodel.dart';
import 'package:covid_app/app/ui/quiz/quiz_page.dart';
import 'package:covid_app/app/widgets/button_component.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuizContainer extends StatelessWidget {
  Color color;

  QuizContainer({this.color});

  QuizContainerViewModel vm = QuizContainerViewModel();

  @override
  Widget build(BuildContext context) {
    return _body(context, vm);
  }
}

Widget _body(context, vm) {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        FutureBuilder(
          future: vm.getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: Color.fromRGBO(50, 92, 127, 0.9),
                  child: Container(
                    width: twoHundred,
                    height: twoHundred,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 5,
                    ),
                  ),
                );
              default:
                if (snapshot.data.country != null) {
                  return Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height * 0.35,
                        color: Color.fromRGBO(50, 92, 127, 0.9),
                        child: Column(
                          children: <Widget>[
                            _text(
                                title: "${snapshot.data.country}",
                                fontSize: twentyFour),
                            _underlineBlackGradient(),
                            _row(
                                title1: "Casos",
                                title2: "${snapshot.data.cases}"),
                            _underlineBlackGradient(),
                            _row(
                                title1: "Confirmados",
                                title2: "${snapshot.data.confirmed}"),
                            _underlineBlackGradient(),
                            _row(
                                title1: "Mortes",
                                title2: "${snapshot.data.deaths}"),
                            _underlineBlackGradient(),
                            _row(
                                title1: "Recuperados",
                                title2: "${snapshot.data.recovered}"),
                            _underlineBlackGradient(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height * 0.35,
                        color: Color.fromRGBO(50, 92, 127, 0.9),
                        child: Column(
                          children: <Widget>[
                            _text(
                                title:
                                    "${snapshot.data.state}, ${snapshot.data.uf}",
                                fontSize: twentyFour),
                            _underlineBlackGradient(),
                            _row(
                                title1: deadLabel,
                                title2: "${snapshot.data.cases}"),
                            _underlineBlackGradient(),
                            _row(
                                title1: suspiciousLabel,
                                title2: "${snapshot.data.suspects}"),
                            _underlineBlackGradient(),
                            _row(
                                title1: deadLabel,
                                title2: "${snapshot.data.deaths}"),
                            _underlineBlackGradient(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
            }
          },
        ),
        SizedBox(
          height: twentyFour,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: thirtyTwo),
          child: _text(
              title: makeASpeedTestLabel,
              color: darkPrimaryColor,
              fontSize: twentyFour),
        ),
        Container(
          margin: EdgeInsets.only(top: fortyEight, bottom: twelve),
          child: ButtonComponent(
            title: quizButtonLabel,
            fillColor: rosePrimaryColor,
            textColor: Colors.white,
            loginFun: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => QuizPage(),
              ),
            ),
            textSize: twenty,
          ),
        ),
      ],
    ),
  );
}

_text({String title, double fontSize, Color color = Colors.white}) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: Text(
      title,
      style: TextStyle(fontSize: fontSize, color: color),
    ),
  );
}

_row(
    {String title1,
    String title2,
    double fontSize1 = twenty,
    double fontSiz2 = eighteen,
    Color color1 = Colors.white,
    Color color2 = Colors.white}) {
  return Row(children: <Widget>[
    _text(title: title1, fontSize: fontSize1, color: color1),
    Spacer(),
    _text(title: title2, fontSize: fontSiz2, color: color2),
  ]);
}

SizedBox _underlineBlackGradient() {
  return SizedBox(
    height: 2,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        gradient: LinearGradient(
          begin: Alignment(1.0, 0.0),
          end: Alignment(-1.0, 0.0),
          colors: [
            Color.fromRGBO(255, 255, 255, 0.2),
            Color.fromRGBO(213, 213, 213, 0.5),
            Color.fromRGBO(184, 184, 184, 0.8),
            Color.fromRGBO(213, 213, 213, 0.5),
            Color.fromRGBO(255, 255, 255, 0.2),
          ],
        ),
      ),
    ),
  );
}
