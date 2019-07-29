import 'package:flutter/material.dart';
import '../components/input_slider.dart';
import './listar_condicoes.dart';

class CreditoGarantia extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<CreditoGarantia> {
  TextEditingController controllerValor = new TextEditingController();
  TextEditingController controllerMeses = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crédito com Garantia Imobiliária'),
      ),
      body: Column(
        children: <Widget>[
          InputSlider(
              "De quantos você precisa?", 1000.0, 1500000.0, 100000.0, controllerValor),
          InputSlider(
              "Em quantos meses para pagar?", 10.0, 240.0, 100.0, controllerMeses),
          RaisedButton(
            onPressed: () => _goToListarCondicoes(context),
            child: const Text('Listar Condições', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  void _goToListarCondicoes(context) {
    String valor = controllerValor.text;
    String meses = controllerMeses.text;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListarCondicoes())
    );
  }
}
