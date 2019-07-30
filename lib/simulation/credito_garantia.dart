import 'package:flutter/material.dart';
import '../components/input_slider.dart';
import './listar_condicoes.dart';

class CreditoGarantia extends StatefulWidget {
  final String _idFinalidade;
  CreditoGarantia(this._idFinalidade);

  @override
  _State createState() => new _State(_idFinalidade);
}

class _State extends State<CreditoGarantia> {
  TextEditingController controllerValor = new TextEditingController();
  TextEditingController controllerMeses = new TextEditingController();
  String _idFinalidade;

  _State(this._idFinalidade);
  

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
    String _valor = controllerValor.text;
    String _meses = controllerMeses.text;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListarCondicoes(_idFinalidade, _valor, _meses))
    );
  }
}
