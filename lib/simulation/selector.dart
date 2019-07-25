import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

import './../requests/requester.dart';
import './../requests/urls.dart';

class SimuladorSelector extends StatelessWidget {
  final Future<http.Response> finalidades = Requester.get(URLS.finalidades);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Requester.builder(finalidades, generateGrid),
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
}


Widget generateGrid(data) {
  var finalidades = json.decode(data);

  return GridView.count(
    crossAxisCount: 2,
    childAspectRatio: (20.0 / 20.0),
    shrinkWrap: true,
    children: List.generate(6, (index) {
      return InkWell(       // InkWell serve apenas para efeito de clique do Material 
      onTap: () => print("Container pressed"), 
      child: Container(
          decoration: BoxDecoration(border: Border.all()),
          child: generateGridBlocks(finalidades[index]),
        ),
      );
    }),
  );
}


Widget generateGridBlocks(finalidade) {
  final imagePath = 'assets/images/' + finalidade['icone'];

  return Column(
    children: <Widget>[
      Container(
        height: 80.0,
        margin: const EdgeInsets.symmetric(
          vertical: 30.0,
          // horizontal: 20.0,
        ),
        child: SvgPicture.asset(imagePath),
      ),
      Text(finalidade['nome'],
          style: TextStyle(
            color: Color(0xFF013F88),
            fontSize: 18.00,
            fontWeight: FontWeight.bold,
          )),
    ],
  );
}
