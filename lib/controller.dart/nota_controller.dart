import 'package:flutter/cupertino.dart';
import 'package:flutter_anotacoes/database/dao/notas_dao.dart';
import 'package:flutter_anotacoes/model/nota.dart';

class NotaController {
  final NotasDao _dao = NotasDao();

  final TextEditingController tituloController = TextEditingController();
  final TextEditingController textoController = TextEditingController();
  final TextEditingController procurarController = TextEditingController();

  List<Nota> listaNotas = [];

  Future<void> buscarTodos() async {
    listaNotas = await _dao.buscarNotas();
  }

  Future<void> buscarPorTitulo() async {
    if (!procurarController.text.isEmpty)
      listaNotas = await _dao.buscarPorTitulo(procurarController.text);
    else
      await buscarTodos();
  }

  Future<void> inserir() async {
    return await _dao
        .inserir(Nota(null, tituloController.text, textoController.text));
  }

  Future<void> remover(int id) async {
    return await _dao.remover(id);
  }

  Future<void> atualizar(int id) async {
    return await _dao
        .atualizar(Nota(id, tituloController.text, textoController.text));
  }
}
