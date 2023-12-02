import 'package:path/path.dart';
import 'package:segunda_prova/domain/membro.dart';
import 'package:sqflite/sqflite.dart';

class MembroHelper {
  static final MembroHelper _instance = MembroHelper.internal();

  factory MembroHelper() => _instance;

    MembroHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db == null) _db = await initDb();
    return _db;
  }
  
  Future<Database> initDb() async {
    String? databasesPath = await getDatabasesPath();
    if (databasesPath == null) databasesPath = "";
    String path = join(databasesPath, "membro.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE ${Membro.membroTable}(${Membro.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "                                 ${Membro.nomeColumn} TEXT, "
                  "                                 ${Membro.idadeColumn} INTEGER, "
                  "                                 ${Membro.emailColumn} TEXT, "
                  "                                 ${Membro.estadoCivilColumn} TEXT, "
                  "                                 ${Membro.funcaoColumn} TEXT) ");
        });
  }

  Future<Membro> saveMembro(Membro l) async {
    Database? dbMembro = await db;
    if (dbMembro != null) {
      l.id = await dbMembro.insert(Membro.membroTable, l.toMap());
    }
    return l;
  }

  Future<Membro?> getMembro(int id) async {
    Database? dbMembro = await db;
    if (dbMembro != null) {
      List<Map> maps = await dbMembro.query(Membro.membroTable,
          columns: [
            Membro.idColumn,
            Membro.nomeColumn,
            Membro.idadeColumn,
            Membro.emailColumn,
            Membro.estadoCivilColumn,
            Membro.funcaoColumn
          ],
          where: "${Membro.idColumn} = ?",
          whereArgs: [id]);
      if (maps.length > 0)
        return Membro.fromMap(maps.first);
      else
        return null;
    }
    return null;
  }

  Future<int> deleteMembro(int id) async {
    Database? dbMembro = await db;
    if (dbMembro!= null) {
      return await dbMembro.delete(Membro.membroTable,
          where: "${Membro.idColumn} = ?", whereArgs: [id]);
    } else
      return 0;
  }

  Future<int> updateMembro(Membro l) async {
    Database? dbMembro = await db;
    if (dbMembro != null) {
      return await dbMembro.update(Membro.membroTable, l.toMap(),
          where: "${Membro.idColumn} = ?", whereArgs: [l.id]);
    } else {
      return 0;
    }
  }

  Future<List<Membro>> getAll() async {
    Database? dbMembro = await db;
    if (dbMembro != null) {
      List listMap = await dbMembro.query(Membro.membroTable);
      List<Membro> listMembros = [];

      for (Map m in listMap) {
        listMembros.add(Membro.fromMap(m));
      }
      return listMembros;
    } else {
      return [];
    }
  }

}
