import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

class ScreenBackgroundComponent extends StatelessWidget {
  Widget columnWidgets;

  ScreenBackgroundComponent(this.columnWidgets);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(sixteen),
        padding: const EdgeInsets.only(
            right: twentyFour, left: twentyFour, top: twentyFour),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(thirtyTwo),
          ),
        ),
        child: columnWidgets);
  }
}
