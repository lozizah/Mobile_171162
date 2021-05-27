import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anotacoes/controller.dart/LoginRegistroController.dart';

class RegistroScreen extends StatelessWidget {
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
                'CADASTRO',
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
                onPressed: () => controller.cadastro(context),
                child: Text(
                  'CADASTRAR',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
