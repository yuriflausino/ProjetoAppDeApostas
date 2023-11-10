import 'package:flutter/material.dart';
import 'package:tds_aplicativo_futebol/auth_service.dart';
import 'package:tds_aplicativo_futebol/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();

  bool _isLoading = false;
  String _errorText = ''; // Nova variável para armazenar a mensagem de erro

  void _login() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _errorText =
          ''; // Limpar a mensagem de erro ao tentar fazer login novamente
    });

    String username = _usernameController.text;
    String password = _passwordController.text;

    bool isAuthenticated = await _authService.authenticate(username, password);

    setState(() {
      _isLoading = false;
    });

    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SportSelectionPage()),
      );
    } else {
      // Definir a mensagem de erro ao falhar o login
      setState(() {
        _errorText = 'Senha incorreta. Por favor, tente novamente.';
      });
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
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
                height:
                    8.0), // Adiciona um pequeno espaço entre os campos de texto e a mensagem de erro
            // Exibe a mensagem de erro abaixo do botão de login
            Text(
              _errorText,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: _isLoading ? CircularProgressIndicator() : Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
