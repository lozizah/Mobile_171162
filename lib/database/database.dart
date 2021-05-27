import 'package:flutter_anotacoes/database/dao/notas_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> openAgendaDatabase() async {
  final String caminho = join(await getDatabasesPath(), 'notas.db');
  return openDatabase(
    caminho,
    onCreate: (db, version) {
      db.execute(NotasDao.tabela);
    },
    version: 5,
  );
}
