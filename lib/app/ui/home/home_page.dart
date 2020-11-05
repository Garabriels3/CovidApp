import 'package:covid_app/app/model/user.dart';
import 'package:covid_app/app/ui/containers/health/health_container.dart';
import 'package:covid_app/app/ui/containers/news/news_container.dart';
import 'package:covid_app/app/ui/containers/quiz/quiz_container.dart';
import 'package:covid_app/app/ui/home/home_viewmodel.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'intern_components/drawer_component.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  User user = User();

  HomePage({this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final vm = HomeViewModel();

  List<Widget> viewContainer = [
    NewsContainer(),
    QuizContainer(),
    HealthContainer(color: Colors.green)
  ];

  List<String> titleContainers = ["Noticias do momento", "Quiz", "Hospitais"];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: DrawerComponent(
            email: widget.user.email,
            name: widget.user.name,
            logout: () => vm.signOut(context)),
        appBar: AppBar(
          backgroundColor: darkPrimaryColor,
          title: Text(titleContainers[_currentIndex]),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: viewContainer,
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: rosePrimaryColor,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_answer),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: 'Hospitais',
            )
          ],
        ),
      ),
    );
  }
}
