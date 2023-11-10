import 'package:flutter/material.dart';
import 'package:tds_aplicativo_futebol/main.dart';
// Importe a tela SoccerApp ou o arquivo que a contenha

class SportSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione um Esporte'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Ao clicar em "Futebol", navegue para a tela SoccerApp
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SoccerApp()),
              );
            },
            child: Text('Futebol'),
          ),
          // Adicione mais botões para outros esportes, se necessário
        ],
      ),
    );
  }
}
