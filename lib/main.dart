import 'package:flutter/material.dart';
import './result.dart';
import './quize.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s Your Favorite color ?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 0},
        {'text': 'Green', 'score': 9},
        {'text': 'White', 'score': 2},
      ]
    },
    {
      'questionText': 'What\'s your Favorite animal ?',
      'answer': [
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 10},
        {'text': 'Lion', 'score': 1},
        {'text': 'Tiger', 'score': 8},
      ]
    },
    {
      'questionText': 'Who\'s Your Favorite instructor ?',
      'answer': [
        {'text': 'Max', 'score': 3},
        {'text': 'Tax', 'score': 9},
        {'text': 'Pax', 'score': 2},
        {'text': 'Cax', 'score': 6},
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
    
    if (_questionIndex < _questions.length) {
      print('We have More question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quize(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
