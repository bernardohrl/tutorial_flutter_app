import 'package:flutter/material.dart';
import './initial_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'App Tutorial',
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home:  Scaffold(
          body: InitialPage()
        )
    );
  }

}
