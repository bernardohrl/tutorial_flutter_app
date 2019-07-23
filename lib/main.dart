import 'package:flutter/material.dart';
import './selector.dart';


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
        appBar: AppBar(
          title: Text('Poupex'),
        ),
          body: Selector()
        )
    );
  }

}
