
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
        'CREATE TABLE tdl_Data( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,medecinename TEXT,time TEXT,sign Text)');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'Daadb.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();
    return db.query('tdl_Data', orderBy: "id");
  }

  static Future<int> createItem(
    String medecinename,
    String? time,
    String? sign,
  ) async {
    final db = await SqlHelper.db();
    final data = {
      'medecinename': medecinename,
      'time': time,
      'sign': sign,
    };
    final id = await db.insert('tdl_Data', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> updateItem(
    int id,
    String medecinename,
    String? time,
    String? sign,
  ) async {
    final db = await SqlHelper.db();

    final data = {
      'medecinename': medecinename,
      'time': time,
      'sign': sign,
    };

    final result =
        await db.update('tdl_Data', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete("tdl_Data", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
