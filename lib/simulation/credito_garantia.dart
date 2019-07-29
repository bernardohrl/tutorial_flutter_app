import 'package:flutter/material.dart';
import '../components/input_slider.dart';

class CreditoGarantia extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<CreditoGarantia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crédito com Garantia Imobiliária'),
      ),
      body: InputSlider(),
    );
  }
}
