import 'package:flutter/material.dart';
import 'package:flutter_complete_course/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'white', 'score': 1},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favourte animal',
      'answers': [
        {'text': 'panda', 'score': 1},
        {'text': 'cat', 'score': 3},
        {'text': 'dog', 'score': 5},
        {'text': 'horse', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourite teacher?',
      'answers': [
        {'text': 'Johny', 'score': 10},
        {'text': 'Max', 'score': 1},
        {'text': 'Yusra', 'score': 3},
        {'text': 'Asma', 'score': 5}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ), // AppBar
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ), // Scaffold
    ); // Material App
  }
}
