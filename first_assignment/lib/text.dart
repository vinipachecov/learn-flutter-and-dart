import "package:flutter/material.dart";

class ChangableText extends StatelessWidget {
  final String text;

  ChangableText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
