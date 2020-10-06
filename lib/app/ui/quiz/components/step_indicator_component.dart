import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// ignore: must_be_immutable
class StepIndicatorComponent extends StatefulWidget {
  int currentStep;

  StepIndicatorComponent({this.currentStep});
  @override
  _StepIndicatorComponentState createState() => _StepIndicatorComponentState();
}

class _StepIndicatorComponentState extends State<StepIndicatorComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: twentyEight),
      child: StepProgressIndicator(
        totalSteps: 2,
        currentStep: widget.currentStep,
        roundedEdges: Radius.circular(10),
        size: 10,
        selectedColor: rosePrimaryColor,
        unselectedColor: Colors.white,
      ),
    );
  }
}
