import 'package:flutter/material.dart';
import 'package:flutter_anotacoes/controller.dart/LoginRegistroController.dart';
import 'package:flutter_anotacoes/registro_screen.dart';

class LoginScreen extends StatelessWidget {
  final LoginRegistroController controller = LoginRegistroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin: EdgeInsets.only(top: 32),
          child: Column(
            children: [
              Text(
                'LOGIN',
                style: TextStyle(fontSize: 24),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'E-mail'),
                controller: controller.emailController,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Senha'),
                controller: controller.senhaController,
                obscureText: true,
              ),
              TextButton(
                onPressed: () => controller.login(context),
                child: Text(
                  'ENTRAR',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => RegistroScreen())),
                child: Text(
                  'CADASTRAR NOVO USUÁRIO',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
