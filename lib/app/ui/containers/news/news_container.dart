import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsContainer extends StatelessWidget {
  Color color;

  NewsContainer({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}