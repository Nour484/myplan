import 'package:taskbygithub/add_items/item.dart';
import 'package:taskbygithub/service/db_helper.dart';

class TreeHelper {
  Future<Item> insert(Item item) async {
    final db = await DBHelper().database;

    item.id = await db.insert("tree", item.toMap());
    return item;
  }

  Future<List<Item>> getItem() async {
    final db = await DBHelper().database;
    List<Map> maps = await db.query(
      "tree",
    );

    return maps.map((map) => Item.formJsom(map)).toList();
  }

  Future<List<Item>> getFavoriteItems() async {
    final db = await DBHelper().database;
    final maps = await db.query(
      'tree',
      where: 'fav = ?',
      whereArgs: [1],
    );
    return maps.map((map) => Item.formJsom(map)).toList();
  }

  Future updateItem(
    Item newItem,
    String title,
  ) async {
    final db = await DBHelper().database;
    return db.update(
        "tree",
        {
          'fav': newItem.fav ? 1 : 0,
        },
        where: "title = ?",
        whereArgs: [newItem.title]);
  }

  Future<int> deleteItem(
    Item newItem,
  ) async {
    final db = await DBHelper().database;
    return await db
        .delete("tree", where: "title = ?", whereArgs: [newItem.title]);
  }
}
