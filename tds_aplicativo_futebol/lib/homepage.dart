import 'package:flutter/material.dart';
import 'package:tds_aplicativo_futebol/main.dart';

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
          InkWell(
            onTap: () {
              // Ao clicar na imagem, navegue para a tela SoccerApp
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SoccerApp()),
              );
            },
            child: Image.asset(
              'assets/images/brasileirao.png', // Caminho para a sua imagem
              width: 150, // Ajuste conforme necessário
              height: 150, // Ajuste conforme necessário
            ),
          ),
          // Adicione mais imagens ou botões para outros esportes, se necessário
        ],
      ),
    );
  }
}
