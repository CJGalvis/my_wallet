import 'dart:io';
import 'package:my_wallet/ui/features/home/domain/models/pocket_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class LocalDB {
  static Database? _database;

  static final LocalDB db = LocalDB._();

  LocalDB._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory docsDirectory =
        await getApplicationDocumentsDirectory();
    final path = join(docsDirectory.path, 'WalletDB.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE pockets (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT NOT NULL,
            name TEXT NOT NULL,
            balance REAL NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> newPocket(Pocket model) async {
    final db = await database;
    final res = await db.insert('pockets', model.toMap());
    return res;
  }

  Future<Pocket?> getPocketById(int id) async {
    final db = await database;
    final res =
        await db.query('pockets', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Pocket.fromMap(res.first) : null;
  }

  Future<List<Pocket>> getPockets() async {
    final db = await database;
    final res = await db.query('pockets');
    return res.isNotEmpty
        ? res.map((e) => Pocket.fromMap(e)).toList()
        : [];
  }

  Future<int> updatePocket(Pocket pocket) async {
    final db = await database;
    return db.update('pockets', pocket.toMap(),
        where: 'id = ?', whereArgs: [pocket.id]);
  }

  Future<int> deletePocket(int id) async {
    final db = await database;
    final res =
        await db.delete('pockets', where: 'id = ?', whereArgs: [id]);
    return res;
  }
}
