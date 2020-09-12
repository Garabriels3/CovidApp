import 'package:covid_app/app/model/articles.dart';
import 'package:covid_app/app/ui/containers/news/news_container_viewmodel.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
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
                return Container(
                  height: 200,
                  child: Card(
                    elevation: four,
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          snapshot.data[index].urlToImage,
                          fit: BoxFit.fill,
                        ),
                        Align(
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
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
