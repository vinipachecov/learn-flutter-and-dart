import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function pressHandler;

  TextControl(this.pressHandler);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Change me!'),
      onPressed: pressHandler,
    );
  }
}
