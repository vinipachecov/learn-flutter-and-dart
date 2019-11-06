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

## Flutter Styling

To add Styles in Flutter we have various options:

1. Container: we use BoxDecoration
2. Text Elemnet: we use TextStyle

We both classes combined we can achieve most of the styling we need. In other words, with this we can style container boxes and text elements.

## Element Alignment

Just like in normal CSS flexbox, in flutter we have CrossAxisAlignment and MainAxisAlignment.
As we have Columns and Rows, the behavior of this properties will be:

|                    | Columns                                                                                   | Rows                                                                                           |
| ------------------ | ----------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| CrossAxisAlignment | What crosses a column, so it is a horizontal alignment                                    | What crosses a row or what I like to think a horizontal line. This means it aligns vertically. |
| MainAxisAlignment  | The main flow of columns, i.e placing items vertically one below each other like a stack. | The main flow of row, i.e placing items horizontally.                                          |

## TextEditingControllers

TextEditingControllers are a convinient way of having a variable been controlled by a stateless component that will be changed but doesn't effect the overall state of the app.
Not only is an elegant way but Flutter preffer this style.

```dart
  final titleController = TextEditingController();
```

```dart
  TextField(
    decoration: InputDecoration(labelText: 'Amount'),
    controller: amountController,
  ),
```

## Theming

Flutter gives us an Api for creating an Theme of colors inside our app. Inside our MaterialApp object we can have a theme property that we can config to have different styles for our app globally.

```dart
return MaterialApp(
      title: 'Expenses App',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(fontFamily: 'OpenSans', fontSize: 20)))),
    );
```

## Fonts and Images

To add static assets to Flutter apps is quite easy, first create a folder for it and then inside pubspec.yaml there are instructions on how to insert those fonts:

```yaml
flutter:
  fonts:
    - family: OpenSans
      fonts:
        - asset: assets/fonts/OpenSans-Regular.ttf
        - asset: assets/fonts/OpenSans-bold.ttf
          weight: 700
    - family: Quicksand
      fonts:
        - asset: assets/fonts/Quicksand-Light.ttf
          weight: 300
        - asset: assets/fonts/Quicksand-Regular.ttf
          weight: 400
        - asset: assets/fonts/Quicksand-Medium.ttf
          weight: 500
        - asset: assets/fonts/Quicksand-Bold.ttf
          weight: 700
```

The same works for images:

```yaml
assets:
  - assets/images/waiting.png
```
