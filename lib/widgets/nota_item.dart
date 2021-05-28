import 'package:flutter/material.dart';
import 'package:flutter_anotacoes/controller.dart/nota_controller.dart';
import 'package:flutter_anotacoes/model/nota.dart';

class NotaWidget extends StatefulWidget {
  final Nota nota;
  final Color color;
  final Function() atualizaTela;

  NotaWidget({this.nota, this.color, this.atualizaTela});

  @override
  _NotaWidgetState createState() => _NotaWidgetState();
}

class _NotaWidgetState extends State<NotaWidget> {
  final NotaController controller = NotaController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.nota.titulo),
      subtitle: Text(widget.nota.texto),
      tileColor: widget.color == null ? Colors.blue : widget.color,
      leading: IconButton(
        onPressed: () async {
          await controller.remover(widget.nota.idNota);
          widget.atualizaTela();
        },
        icon: Icon(Icons.remove_circle),
      ),
    );
  }
}
