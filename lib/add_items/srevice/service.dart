import 'package:sqflite/sqflite.dart';
import 'package:taskbygithub/add_items/item.dart';

class TreeHelper {
  TreeHelper._();

  static final TreeHelper _instance = TreeHelper._();

  factory TreeHelper() {
    return _instance;
  }

  late Database db;

  Future openDb() async {
    final databasesPath = await getDatabasesPath();
    final path = '$databasesPath/tree.db';

    db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE tree (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        body TEXT,
        images TEXT,
        fav INTEGER
      )
    ''');
    });
  }

  Future<Item> insert(Item item) async {
    item.id = await db.insert("tree", item.toMap());
    return item;
  }

  Future<List<Item>> getItem() async {
    List<Map> maps = await db.query(
      "tree",
    );

    return maps.map((map) => Item.formJsom(map)).toList();
  }

  Future updateItem(
    Item newItem,
    String title,
  ) {
    return db.update(
        "tree",
        {
          'fav': newItem.fav ? 1 : 0,
        },
        where: "title = ?",
        whereArgs: [newItem.title]);
  }

  deleteItem() {}
}
