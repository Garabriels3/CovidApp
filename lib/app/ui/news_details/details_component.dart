import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsComponent extends StatelessWidget {
  String title;
  String author;
  String imageUrl;
  String publicationAt;
  String description;

  DetailsComponent(
      {this.title,
      this.author,
      this.publicationAt,
      this.description,
      this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPrimaryColor,
        title: Text("Detalhes"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(sixteen),
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: eight, vertical: eight),
                  decoration: BoxDecoration(
                    border: Border.all(color: rosePrimaryColor),
                  ),
                  child: Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: darkPrimaryColor.withOpacity(0.9),
                        fontSize: thirtyTwo,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: twenty,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: StrutStyle(fontSize: sixteen),
                        text: TextSpan(
                            style: TextStyle(
                                color: darkPrimaryColor,
                                fontSize: sixteen,
                                fontWeight: FontWeight.w400),
                            text: "Autor: $author"),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "data: $publicationAt".replaceRange(16, 26, ""),
                      style: TextStyle(
                          color: darkPrimaryColor,
                          fontSize: sixteen,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Container(
                  height: 0.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: rosePrimaryColor,
                  ),
                ),
                SizedBox(
                  height: twenty,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.black87.withOpacity(0.7),
                      fontSize: twenty,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
