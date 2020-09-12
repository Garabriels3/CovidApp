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
                  height: twoHundredFiftyTwo,
                  child: Card(
                    elevation: four,
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          snapshot.data[index].urlToImage,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ListTile(
                            onTap: () {},
                            title: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: sixteen, vertical: sixteen),
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(four))),
                              child: Text(
                                snapshot.data[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: sixteen,
                                    color: textPrimaryColor),
                              ),
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
