import 'package:flutter/material.dart';

class KeyboardHideable extends StatelessWidget {
  final Widget child;

  const KeyboardHideable({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: child,
    );
  }
}