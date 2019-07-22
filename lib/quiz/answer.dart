import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressedFunction;
  final String text;

  Answer(this.onPressedFunction, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: ,
      child: RaisedButton(
            child: Text(this.text),
            onPressed: this.onPressedFunction,
            color: Colors.blue,
            textColor: Colors.white,
          ),
    );
  }
}