import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:flutter/services.dart';

class LyraDb {
  LyraDb._init();
  static final LyraDb instance = LyraDb._init();

  Future<Database> get database async {
    return await _initDb('lyra.db');
  }

  Future<Database> _initDb(String dbFileName) async {
    WidgetsFlutterBinding.ensureInitialized();
    // io.Directory applicationDirectory =
    //     await getApplicationDocumentsDirectory();
    // String dbPath = path.join(applicationDirectory.path, dbFileName);
var databasesPath = await getDatabasesPath();
    String dbPath = path.join(databasesPath, dbFileName);
    bool exists = await io.File(dbPath).exists();

    if (!exists) {
      // Copy from asset if it doesn't exist
      try {
        // Make sure the parent directory exists
        await io.Directory(path.dirname(dbPath)).create(recursive: true);
        
        // Copy from assets
        ByteData data = await rootBundle.load(path.join('assets', dbFileName));
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await io.File(dbPath).writeAsBytes(bytes, flush: true);
      } catch (e) {
        throw Exception('Error copying database: $e');
      }
    }
    return await openDatabase(dbPath, version: 1, onCreate: _createTable);
  }

  Future _createTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS lyrics(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_gva_lyric INTEGER NOT NULL,
      code TEXT NOT NULL,
      author TEXT,
      key TEXT,
      lyric TEXT NOT NULL,
      title TEXT,
      type INTEGER NOT NULL
    )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  void initializeTableLyrics(db, snapshotDocs) async {
    Batch batch = db.batch();
    await db.execute('''
        DELETE FROM lyrics
        ''');
    int type = 0;
    for (var doc in snapshotDocs) {
      if (doc['type'] % 2 == 0) {
        type = 1;
      } else {
        type = 0;
      }
      batch.insert(
          "lyrics",
          {
            'id_gva_lyric': doc['id'],
            'code': doc['code'],
            'author': doc['author'] ?? "",
            'key': doc['key'] ?? "",
            'lyric': doc['lyric'],
            'title': doc['title'],
            'type': type
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
  }
}
