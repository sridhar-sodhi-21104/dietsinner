// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print, sort_child_properties_last
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppstate();
  }
}

class _MyAppstate extends State<MyApp> {
  var _questionid = 0;
  void _answerQuestion() {
    setState(() {
      _questionid = _questionid + 1;
    });

    print(_questionid);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'what\'s your favourite color?',
        'answer': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'what\'s your favourite animal?',
        'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion']
      },
      {
        'questionText': 'who\'s your favourite instructor?',
        'answer': ['Max', 'Max', 'Max', 'Max']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first app'),
        ),
        body: Column(
          children: [
            Question(questions[_questionid % 2]['questionText'] as String),
            ...(questions[_questionid % 2]['answer'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
