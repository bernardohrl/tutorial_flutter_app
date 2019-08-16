import 'package:flutter/material.dart';
import 'package:my_app/requests/base.dart';
// import 'quiz/quiz.dart';
// import 'names/lazyNameListing.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'App Tutorial',
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: Startpage(),
      // home:  Quiz(),
      // home:  RandomWords(),

    );
  }
}