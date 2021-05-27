import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anotacoes/login_screen.dart';
import 'package:flutter_anotacoes/main_screen.dart';

class LoginRegistroController {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout(BuildContext context) async {
    final user = _auth.currentUser;
    if (user == null) {
      print("usuário não logado");
      return;
    }
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
  }

  void login(BuildContext context) async {
    User user;

    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: senhaController.text,
      ))
          .user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Usuário ou senha incorretos! Tente novamente"),
        ));
      }
      return;
    }

    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Login falhou! Tente novamente"),
    ));
  }

  void cadastro(BuildContext context) async {
    User user;

    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: senhaController.text,
      ))
          .user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("E-mail já utilizado ou inválido! Tente novamente"),
        ));
      }
      return;
    }

    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Registrado com sucesso!"),
      ));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Registro falhou! Tente novamente"),
    ));
  }
}
