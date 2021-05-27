import 'package:flutter/material.dart';
import 'package:flutter_anotacoes/controller.dart/nota_controller.dart';
import 'package:flutter_anotacoes/editar_nota.dart';
import 'package:flutter_anotacoes/model/nota.dart';

class NotaWidget extends StatelessWidget {
  final Nota nota;
  final Color color;
  final NotaController controller = NotaController();

  NotaWidget({this.nota, this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nota.titulo),
      subtitle: Text(nota.texto),
      tileColor: color == null ? Colors.blue : color,
    );
  }
}
