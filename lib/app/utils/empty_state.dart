import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:covid_app/core/constants/string.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPrimaryColor,
        title: Text("Sem conteúdo"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/empty_state.png"),
            SizedBox(
              height: thirtyTwo,
            ),
            Text(
              emptyStateDescription,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: twentyFour,
                  color: darkPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
