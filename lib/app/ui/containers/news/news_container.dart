import 'package:covid_app/app/model/articles.dart';
import 'package:covid_app/app/ui/containers/news/news_container_viewmodel.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsContainer extends StatelessWidget {
  Color color;
  var vm = NewsContainerViewModel();

  NewsContainer({this.color});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articles>>(
        future: vm.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: 13.0),
                  child: Card(
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      height: 83,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: textPrimaryColor,
                                blurRadius: 10.0,
                                spreadRadius: 1,
                                offset: Offset(
                                  0.0,
                                  6.0,
                                ))
                          ]),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            child: ListTile(
                              onTap: () {},
                              title: Padding(
                                padding: const EdgeInsets.only(left: 45.0),
                                child: Text(
                                  snapshot.data[index].description,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                backgroundColor: Color.fromRGBO(231, 242, 245, 1),
              ),
            );
          }
        });
  }
}
