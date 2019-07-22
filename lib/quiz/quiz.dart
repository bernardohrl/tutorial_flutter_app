import 'package:flutter/material.dart';
import 'package:my_app/quiz/answer.dart';
import './questions.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var questionIndex = 0;

  final _questions = [
    {
      'text': 'Qual sua cor favorita?',
      'answers': [{'text': 'Roxo', 'score': 10}, {'text':  'Azul', 'score': 20}, {'text': 'Transparente', 'score': 30}]
    },
    {
      'text': 'Qual seu animal favorito?',
      // 'answers': ['Melro Metálico', 'Lagosta Azul', 'Água viva']
      'answers': [{'text': 'Melro Metálico', 'score': 10}, {'text':  'Lagosta Azul', 'score': 20}, {'text': 'Água viva', 'score': 30}]
    },
    {
      'text': 'Qual seu campeão preferido?',
      // 'answers': ['Tresh', 'Nasus', 'Sylas', 'Outro']
      'answers': [{'text': 'Tresh', 'score': 10}, {'text':  'Sylas', 'score': 12}, {'text': 'Nasus', 'score': 15}]
    },
  ];

  void _answerQuestion() {
    

    if (questionIndex > _questions.length)
      print('Questions Endend');
    else {
      setState(() {
        questionIndex += 1;
      });
    }
  }


  Widget content() {
    if (questionIndex < _questions.length) {
      return Column(children: [
        Questions(_questions[questionIndex]['text']),
        ...(_questions[questionIndex]['answers'] as List).map((answer) {
          return Answer(_answerQuestion, answer['text']);
        }).toList()
      ]);
    } else {
      return Center(child: Text("Acabaram as perguntas!"));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          actions: <Widget>[],
        ),
        body: content());
  }
}
