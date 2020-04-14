import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home:
        Home()
      ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String _infoTexto = "Pode Entrar!";

  void mudaPessoas(int delta) {
    setState(() {
      int _novaQtdPessoas = _pessoas + delta;

      if (_novaQtdPessoas >= 0 && _novaQtdPessoas < 10) {
        _infoTexto = "Pode Entrar!";
        _pessoas += delta;
      } else if (_novaQtdPessoas == 10) {
        _infoTexto = "Lotado!";
        _pessoas += delta;
      } else if (_novaQtdPessoas > 10) {
        _infoTexto = "Lotado!";
      } else {
        _infoTexto = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
            "images/restaurante.jpg",
            fit: BoxFit.cover,
            height: 1000.0
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Pessoas: $_pessoas",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Text("+1", style: TextStyle(fontSize: 40.0, color: Colors.white)),
                          onPressed: () {
                            mudaPessoas(1);
                          },)
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("-1", style: TextStyle(fontSize: 40.0, color: Colors.white)),
                        onPressed: () {
                          mudaPessoas(-1);
                        },),
                    )
                  ]
              ),
              Text(_infoTexto,
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0)
              )
            ]
        )
      ],
    );
  }
}
