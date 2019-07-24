import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:convert';

class SimuladorSelector extends StatelessWidget {
  final Future<http.Response> finalidades = getFinalidades();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<dynamic>(
          future: finalidades,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return returnBlocks(snapshot.data.body);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
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

Future<http.Response> getFinalidades() async {
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

  IOClient ioClient = new IOClient(httpClient);
  final response = await ioClient
      .get('https://simuladorimobiliarioapihml.hml.cloud.poupex/finalidades');

  return response;
}


Widget returnBlocks(data) {
  var parsedData = json.decode(data)[0];




  return Text(parsedData['nome']);
}
