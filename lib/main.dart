import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anotacoes/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: StartApp(),
    ),
  );
}

class StartApp extends StatefulWidget {
  @override
  _StartApState createState() => _StartApState();
}

class _StartApState extends State<StartApp> {
  final Future<FirebaseApp> _instanciaFirebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _instanciaFirebase,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return LoginScreen();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
