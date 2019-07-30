import 'package:flutter/material.dart';

import './../requests/requester.dart';
import './../requests/urls.dart';

class ListarCondicoes extends StatelessWidget {
  final String _idFinalidade;
  final String _valor;
  final String _meses;

  ListarCondicoes(this._idFinalidade, this._valor, this._meses);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Condições'),
      ),
      body: getQuadros(context),
    );
  }

  Widget getQuadros(context) {
    String url = URLS.quadros + '?idFinalidade=' + this._idFinalidade;
    return Requester.builder(Requester.get(url), getLinhasCredito, context);
  }

  Widget getLinhasCredito(data, context) {
    print(data[0]);

    String url = URLS.quadros + '?idFinalidade=' + this._idFinalidade;

    return Requester.builder(Requester.get(url), test, context);
  }

  Widget test(data, context) {
    print(data);

    return Container();
  }
}
