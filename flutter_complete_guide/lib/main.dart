import 'package:flutter/material.dart';

import './quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': 'What\s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Red', 'score': 1},
        {
          'text': 'Green',
          'score': 2,
        },
        {'text': 'White', 'score': 8}
      ],
    },
    {
      'questionText': 'What\s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Elephant', 'score': 15},
        {
          'text': 'Behemoth',
          'score': 200,
        },
        {'text': 'Chackal', 'score': -15}
      ],
    },
    {
      'questionText': 'What\s your favorite instructor?',
      'answers': [
        {'text': 'Vini', 'score': 1},
        {'text': 'Vini', 'score': 15},
        {
          'text': 'Vini',
          'score': 200,
        },
        {'text': 'Vini', 'score': -15}
      ],
    }
  ];
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer choosen!');
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('We have no questions =/');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
