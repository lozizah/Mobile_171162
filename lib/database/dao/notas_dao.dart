import 'package:flutter_anotacoes/database/database.dart';
import 'package:flutter_anotacoes/model/nota.dart';
import 'package:sqflite/sqflite.dart';

class NotasDao {
  static const String tabela =
      ''' CREATE TABLE nota (id_nota INTEGER PRIMARY KEY,
                              titulo TEXT,
                              texto TEXT);''';

  Future<List<Nota>> buscarNotas() async {
    final Database db = await openAgendaDatabase();
    final List<Map<String, dynamic>> notas = await db.query('nota');
    return _toList(notas);
  }

  Future<List<Nota>> buscarPorTitulo(String titulo) async {
    final Database db = await openAgendaDatabase();
    final List<Map<String, dynamic>> notas =
        await db.query('nota', where: 'titulo = ?', whereArgs: [titulo]);
    return _toList(notas);
  }

  Future<int> inserir(Nota nota) async {
    final Database db = await openAgendaDatabase();
    Map<String, dynamic> notaMap = _toMap(nota);
    return await db.insert('nota', notaMap);
  }

  Future<int> atualizar(Nota nota) async {
    final Database db = await openAgendaDatabase();
    Map<String, dynamic> notaMap = _toMap(nota);
    return db.update('nota', notaMap,
        where: 'id_nota = ?', whereArgs: [nota.idNota]);
  }

  Future<int> remover(int idNota) async {
    final Database db = await openAgendaDatabase();
    return db.delete('nota', where: 'id_nota = ?', whereArgs: [idNota]);
  }

  Map<String, dynamic> _toMap(Nota nota) {
    final Map<String, dynamic> notaMap = Map();
    notaMap['id_nota'] = nota.idNota;
    notaMap['titulo'] = nota.titulo;
    notaMap['texto'] = nota.texto;

    return notaMap;
  }

  List<Nota> _toList(List<Map<String, dynamic>> resultado) {
    final List<Nota> notas = [];
    for (Map<String, dynamic> linha in resultado) {
      final Nota nota = Nota(
        linha['id_nota'],
        linha['titulo'],
        linha['texto'],
      );
      notas.add(nota);
    }
    return notas;
  }
}
