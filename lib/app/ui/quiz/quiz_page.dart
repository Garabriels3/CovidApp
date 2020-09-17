import 'package:covid_app/app/respository/covid_api.dart';
import 'package:covid_app/app/service/geolocator/geocoding_service.dart';
import 'package:covid_app/app/service/geolocator/geolocator_service.dart';
import 'package:covid_app/app/ui/quiz/get_uf_viewmodel.dart';
import 'package:covid_app/app/ui/quiz/quiz_page_viewmodel.dart';
import 'package:covid_app/app/widgets/button_component.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  QuizPageViewModel vm = QuizPageViewModel(GeolocatorService(),
      GeocodingService(), CovidApiRepository(), GetUfViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context, vm),
    );
  }
}

Widget _body(BuildContext context, QuizPageViewModel vm) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      FutureBuilder(
        future: vm.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromRGBO(50, 92, 127, 0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  _text(title: "${snapshot.data.state}", color: Colors.white),
                  _underlineBlackGradient(),
                  _row(
                      labelTextTitle: "Casos",
                      dataTextTitle: "${snapshot.data.cases}"),
                  _underlineBlackGradient(),
                  _row(
                      labelTextTitle: "Suspeitos",
                      dataTextTitle: "${snapshot.data.suspects}"),
                  _underlineBlackGradient(),
                  _row(
                      labelTextTitle: "Mortos",
                      dataTextTitle: "${snapshot.data.deaths}"),
                  _underlineBlackGradient(),
                  Align(
                    alignment: Alignment.center,
                    child: _text(
                        title: "${snapshot.data.datetime}",
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
            );
          } else {
            return Container(child: Text("Erro"));
          }
        },
      ),
      ButtonComponent(
        fillColor: darkPrimaryColor,
        textColor: Colors.white,
        title: 'Quiz',
        loginFun: () {},
      ),
    ],
  );
}

//

//

Row _row({
  String labelTextTitle = "default",
  double labelTextFontSize = 20,
  Color labelTextColor = Colors.white,
  String dataTextTitle = "default",
  double dataTextFontSize = 20,
  Color dataTextColor = Colors.white,
}) {
  return Row(
    children: <Widget>[
      _labelText(
          title: labelTextTitle,
          fontSize: dataTextFontSize,
          color: dataTextColor),
      Spacer(),
      _dataText(
          title: dataTextTitle,
          fontSize: labelTextFontSize,
          color: labelTextColor),
    ],
  );
}

Text _labelText(
    {String title = "default",
    double fontSize = 25,
    Color color = Colors.black}) {
  return Text(
    title,
    style: TextStyle(fontSize: fontSize, color: color),
  );
}

Text _dataText(
    {String title = "default",
    double fontSize = 20,
    Color color = Colors.black}) {
  return Text(
    title,
    style: TextStyle(fontSize: fontSize, color: color),
  );
}

Text _text(
    {String title = "default",
    double fontSize = 30,
    Color color = Colors.black}) {
  return Text(
    title,
    style: TextStyle(fontSize: fontSize, color: color),
  );
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
            Color.fromRGBO(00, 00, 00, 0.2),
            Color.fromRGBO(00, 00, 00, 0.5),
            Color.fromRGBO(00, 00, 00, 1),
            Color.fromRGBO(00, 00, 00, 0.5),
            Color.fromRGBO(00, 00, 00, 0.2),
          ],
        ),
      ),
    ),
  );
}
