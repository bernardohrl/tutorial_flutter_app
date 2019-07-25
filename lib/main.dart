import 'package:flutter/material.dart';
import './simulation/selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulador',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => _goToSimulationSelector(context),
        child: container(),
      ),
    );
  }


  Container container() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem vindo ao',
              style: _textStyle(Colors.white70, 25.00),
            ),
            Text(
              'Simulador Poupex',
              style: _textStyle(Colors.white, 38.00),
            ),
          ],
        ));
  }


  TextStyle _textStyle(_color, _fontSize) {
    return TextStyle(
      color: _color,
      fontSize: _fontSize,
      fontWeight: FontWeight.bold,
    );
  }


  void _goToSimulationSelector(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SimuladorSelector()));
  }
}
