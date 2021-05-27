import 'package:flutter/material.dart';
import 'package:flutter_anotacoes/controller.dart/nota_controller.dart';

class EditarNota extends StatelessWidget {
  final NotaController controller = NotaController();
  final id;

  EditarNota(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Título'),
              controller: controller.tituloController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Texto'),
              controller: controller.textoController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 8, right: 8),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(
                  Icons.check,
                  size: 40,
                ),
                onPressed: () async {
                  await controller.atualizar(id);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
