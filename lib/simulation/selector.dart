import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

import './../requests/requester.dart';
import './../requests/urls.dart';
import './credito_garantia.dart';

class SimuladorSelector extends StatelessWidget {
  final Future<http.Response> finalidades = Requester.get(URLS.finalidades);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Requester.builder(finalidades, _generateGrid, context),
      ),

      // Este botao sera removido, ele apenas volta para a pagina inicial
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.amber,
      ),
    );
  }


  Widget _generateGrid(data, context) {
    // print(data);
    // var finalidades = json.decode(data);
    var finalidades = data;

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (20.0 / 20.0),
      shrinkWrap: true,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(border: Border.all()),
          child: _generateGridBlocks(finalidades[index], context),
        );
      }),
    );
  }

  Widget _generateGridBlocks(finalidade, context) {
    // print(finalidade);
    final imagePath = 'assets/images/' + finalidade['icone'];

    return GestureDetector(
      onTap: () => _goToSimulation(context, finalidade['id']),
      child: Column(
        children: <Widget>[
          Container(
            height: 80.0,
            margin: const EdgeInsets.symmetric(
              vertical: 30.0,
            ),
            child: SvgPicture.asset(imagePath),
          ),
          Text(
            finalidade['nome'],
            style: TextStyle(
              color: Color(0xFF013F88),
              fontSize: 18.00,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _goToSimulation(context, idFinalidade) {
    // Como tem apenas CréditoGarantia, o IdFinalidade é sempre 6.
    String _idFinalidade = idFinalidade.toString(); 

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreditoGarantia(_idFinalidade)));
  }
}
