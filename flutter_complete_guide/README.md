# Flutter introduction

Basics about flutter

Flutter is an extremelly powerfull language, it is a compiled language so it compiles code directly to machine code, making it extremelly fast.

## About the dart language

Dart is:

- Strogly type: requires variable types to work properly.
- Has type inference: Dart can infer the type of a varible according to its assigned value.
- Is Object Oriented

A small code in dart would be:

```dart
int addNumbers(int num1, int num2) {
  return num1 + num2;
}

void main() {
  var result = addNumbers(1,5);
  print(result);
}
```

## Minimal Hello world in Flutter

So a minimal example in Flutter would be just something printed on the screen:

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: Text('Hello World'));
  }
}
```

The first line, the "import" is where we get the flutter sdk and its classes and functions to help building our app.
For minimal code we need:

- A file main.dart in lib
- main function in the file with runApp() function
- A class that extends one of the Widget classes
- The class that extends one of the widget classes should implement the build method returning a widget at least or a widget tree.
