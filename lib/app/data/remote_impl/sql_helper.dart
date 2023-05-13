import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
        'CREATE TABLE tbl_students( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,name TEXT,phone TEXT,fatherName Text, className Text,latiTude Text, longiTude Text)');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'studentdb.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
    String name,
    String? phone,
    String fatherName,
    String className,
    String latiTude,
    String longiTude,
  ) async {
    final db = await SqlHelper.db();
    final data = {
      'name': name,
      'phone': phone,
      'fatherName': fatherName,
      'className': className,
      'latiTude': latiTude,
      'longiTude': longiTude
    };
    final id = await db.insert('tbl_students', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> updateItem(
    int id,
    String name,
    String? phone,
    String fatherName,
    String className,
  ) async {
    final db = await SqlHelper.db();

    final data = {
      'name': name,
      'phone': phone,
      'fatherName': fatherName,
      'className': className,
    };

    final result =
        await db.update('tbl_students', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete("tbl_students", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();
    return db.query('tbl_students', orderBy: "id");
  }
}
