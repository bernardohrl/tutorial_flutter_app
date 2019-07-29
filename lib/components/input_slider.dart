import 'package:flutter/material.dart';

class InputSlider extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<InputSlider> {
  double _sliderValue = 0.1;
  final double _min = 0.001;
  final double _max = 0.240;
  var textController = new TextEditingController();

  void _sliderChanged(double value) {
      setState(() => _sliderValue = value);
      textController.text = (_sliderValue * 1000).round().toString();
  }


  void _validateTextField(String value) {
    var max = (_max * 1000).round().toString();
    var min = (_min * 1000).round().toString();

    if(int.parse(value) > int.parse(max)) 
      textController.text = max;

    if(int.parse(value) < int.parse(min))
      textController.text = min;
  }

  @override
  Widget build(BuildContext context) {
    textController.text = (_sliderValue * 1000).round().toString();

    return Container(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Em quantos meses para pagar?'),
            TextField(
              controller: textController,
              keyboardType: TextInputType.number,
              onChanged: _validateTextField,
              // textAlign: TextAlign.center,
            ),
            Slider(
              value: _sliderValue,
              onChanged: _sliderChanged,
              min: _min,
              max: _max,
            ),
          ],
        ),
      ),
    );
  }
}
