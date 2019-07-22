import 'package:flutter/material.dart';
import './questions.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();

  
}

class _QuizState extends State<Quiz> {
  var questionIndex = 0;

  var questions = [
    'Qual sua cor favorita?',
    'Qual seu animal favorito??'
  ];

  void answerQuestion() {
    setState(() {
      questionIndex += 1;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          actions: <Widget>[],
        ),
        body: Column(children: [
          Questions(questions[questionIndex]),
          RaisedButton(
            child: Text('Resposta 1'),
            onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text('Resposta 2'),
            onPressed: answerQuestion,
          ),
          RaisedButton(
            child: Text('Resposta 3'),
            onPressed: answerQuestion,
          ),
        ]));
  }
}
