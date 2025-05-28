import 'package:sqflite/sqflite.dart';
import 'package:taskbygithub/add_items/item.dart';

class TreeHelper {
  late Database db;
  //
  // Future openDb(String path) async {
  //   db = await openDatabase(path, version: 1, onCreate: (db, version) async {
  //     await db.execute('''
  //       CREATE TABLE tree(
  //       id INTEGER PRIMARY KEY AUTOINCREMENT,
  //       title  TEXT ,
  //       body TEXT ,
  //       images  TEXT
  //        )''');
  //   });
  // }


  Future openDb() async {
    final databasesPath = await getDatabasesPath();
    final path = '$databasesPath/tree.db';

    db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE tree (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        body TEXT,
        images TEXT
      )
    ''');
    });
  }


  Future<Item> insert(Item item) async {
    item.id = await db.insert("tree", item.toMap());
    return item;
  }

  Future<List<Item>> getItem() async {
    List<Map> maps = await db.query("tree",
     //   columns: ["id", "title", "body", "images"],
       // where: "id =?",
       // whereArgs: [id]
    );

    return     maps.map((map) {
      return Item(
        id: map['id'] as int,
        title: map['title'] as String,
        body: map['body'] as String,
        images: map['images'] , // Ensure your `Item` class uses `String`
      );
    }).toList();


  }

  //
  //
  //   if (maps.isNotEmpty) {
  //     return Item.formJsom(maps.first);
  //   } else {
  //     return Item(id: 1, title: "title", body: "body", images: []);
  //   }
  // }
}
