import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper _instance = DBHelper._();

  factory DBHelper() {
    return _instance;
  }

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await openDb();
    return _db!;
  }

  Future openDb() async {
    final databasesPath = await getDatabasesPath();
    final path = '$databasesPath/tree.db';

    _db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE tree (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        body TEXT,
        images TEXT,
        fav INTEGER
      )
    ''');

      await db.execute('''
      CREATE TABLE favorite (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        body TEXT,
        images TEXT,
        fav INTEGER
      )
    ''');

    });
  }
}
