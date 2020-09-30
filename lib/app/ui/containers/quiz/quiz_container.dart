import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuizContainer extends StatelessWidget {
  Color color;

  QuizContainer({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}