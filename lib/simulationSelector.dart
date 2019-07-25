import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/io_client.dart';

class SimuladorSelector extends StatelessWidget {
  final Future<http.Response> finalidades = getFinalidades();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // FutureBuilder é utilizado para chamadas assincronas
        child: FutureBuilder<dynamic>(
          future: finalidades,
          builder: (context, snapshot) {

            // Quando os dados chegam, 'generateGrid' é renderizado
            if (snapshot.hasData) {      
              return generateGrid(snapshot.data.body);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // É renderizado Spinner enquanto os dados não chegam
            return CircularProgressIndicator();
          },
        ),
      ),

      // Este botão será removido, ele apenas volta para a página inicial
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


// Chamada assincrona para recuperar as finalidades
Future<http.Response> getFinalidades() async {
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient
      .get('https://simuladorimobiliarioapihml.hml.cloud.poupex/finalidades');

  return response;
}


Widget generateGrid(data) {
  var finalidades = json.decode(data);

  return GridView.count(
    crossAxisCount: 2,
    childAspectRatio: (20.0 / 20.0),
    shrinkWrap: true,
    children: List.generate(6, (index) {
      return Container(
        decoration: BoxDecoration(border: Border.all()),
        child: generateGridBlocks(finalidades[index]),
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
