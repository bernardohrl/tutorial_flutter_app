import 'package:flutter/material.dart';

class InputSlider extends StatefulWidget {
  final double _sliderInitialValue, _min, _max;
  final String _label;
  final TextEditingController _controller;

  InputSlider(this._label, this._min, this._max, this._sliderInitialValue, this._controller);

  @override
  _State createState() => _State(_label, _min, _max, _sliderInitialValue, _controller);

}



class _State extends State<InputSlider> {
  double _sliderValue, _min, _max;
  String _label = "";
  TextEditingController _controller;

  _State(this._label, this._min, this._max, this._sliderValue, this._controller);

  @override
  Widget build(BuildContext context) {
    _controller.text = (_sliderValue).round().toString();

    return Container(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(_label),
            TextField(
              controller: _controller,
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



  void _sliderChanged(double value) {
      setState(() => _sliderValue = value);
      _controller.text = (_sliderValue).round().toString();
  }


  void _validateTextField(String value) {
    var max = (_max).round().toString();
    var min = (_min).round().toString();

    if(int.parse(value) > int.parse(max)) 
      _controller.text = max;

    if(int.parse(value) < int.parse(min))
      _controller.text = min;
  }
}
