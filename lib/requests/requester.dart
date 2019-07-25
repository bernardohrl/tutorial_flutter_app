import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';

class Requester {
  
  // Método Get
  static Future<http.Response> get(url) async {
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = new IOClient(httpClient);
    final response = await ioClient.get(url);

    return response;
  }

  // FutureBuilder é utilizado para renderização de conteúdo e chamadas assíncronas
  static FutureBuilder<dynamic> builder(data, callBackFunction) {
    return FutureBuilder<dynamic>(
      future: data,
      builder: (context, snapshot) {
        // Quando os dados chegam, 'generateGrid' é renderizado
        if (snapshot.hasData) {
          return callBackFunction(snapshot.data.body);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // É renderizado Spinner enquanto os dados não chegam
        return CircularProgressIndicator();
      },
    );
  }
}
