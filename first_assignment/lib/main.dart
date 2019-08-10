import 'package:flutter/material.dart';

import 'package:first_assignment/text_control.dart';
import './text.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _index = 0;
  final List<String> _colors = [
    'red',
    'blue',
    'green',
    'purple',
    'yellow',
    'brown'
  ];

  void changeText() {
    setState(() {
      _index = _index >= _colors.length - 1 ? 0 : _index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('My first App')),
      body: Column(
        children: <Widget>[
          TextControl(changeText),
          ChangableText(_colors[_index])
        ],
      ),
    )));
  }
}
