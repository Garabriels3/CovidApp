import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';

Future genericDialog(dynamic context, String title, String subTitle, Function action) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(twentyFour)),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              height: fortyFour,
              width: hundred,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    twentyFour,
                  ),
                ),
                child: Text(
                  dismissDialogs,
                  style: TextStyle(fontSize: sixteen),
                ),
                textColor: Colors.white,
                color: darkPrimaryColor,
                onPressed: () async {
                  action();
                },
              ),
            )
          ],
        );
      });
}
