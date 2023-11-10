import 'package:flutter/material.dart';
import 'package:tds_aplicativo_futebol/main.dart';

class SportSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo Yuri'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SportButton(
            onPressed: () {
              // Ao clicar em "Futebol", navegue para a tela SoccerApp
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SoccerApp()),
              );
            },
            sportName: 'Brasileirão 2023',
            sportIcon: Icons.sports_soccer,
          ),
          // Adicione mais botões para outros esportes, se necessário
          SportButton(
            onPressed: () {
              // Ao clicar em outro esporte, implemente a navegação apropriada
            },
            sportName: 'Outro Esporte',
            sportIcon: Icons.sports_baseball,
          ),
        ],
      ),
    );
  }
}

class SportButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String sportName;
  final IconData sportIcon;

  const SportButton({
    required this.onPressed,
    required this.sportName,
    required this.sportIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          primary: Colors.blue, // Cor do botão
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              sportIcon,
              size: 50.0,
              color: Colors.white,
            ),
            SizedBox(height: 16.0),
            Text(
              sportName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
