import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HealthContainer extends StatelessWidget {
  Color color;

  HealthContainer({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
