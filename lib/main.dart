import 'package:flutter/material.dart';
import 'lazyNameListing.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Gerador de Nome',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:  RandomWords(),
    );
  }
}