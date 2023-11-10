import 'package:flutter/material.dart';
import 'package:tds_aplicativo_futebol/auth_service.dart';
import 'package:tds_aplicativo_futebol/homepage.dart';
import 'package:tds_aplicativo_futebol/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService _authService =
      AuthService(); // Instância do serviço de autenticação

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Chame o método de autenticação do serviço
    bool isAuthenticated = await _authService.authenticate(username, password);

    if (isAuthenticated) {
      // Se autenticado, navegue para a próxima tela (SoccerApp)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SportSelectionPage()),
      );
    } else {
      // Exiba uma mensagem de erro se as credenciais estiverem incorretas
      print('Login failed. Please enter valid credentials.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
