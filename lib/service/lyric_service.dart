import 'package:lyra/lyra_db.dart';
import 'package:lyra/models/lyric.dart';
import 'package:sqflite/sqflite.dart';

class LyricService {
  LyricService._();
  static final LyricService instance = LyricService._();

  Future batchInsertFromQuerySnapshotDocs(snapshotDocs) async {
    Database db = await LyraDb.instance.database;
    LyraDb.instance.initializeTableLyrics(db, snapshotDocs);
  }

  Future<Lyric> findOneBy(int idLyric) async {
    Database db = await LyraDb.instance.database;
    final List<Map<String, dynamic>> maps = await db.query("lyrics",
        columns: null, where: 'id_gva_lyric=?', whereArgs: [idLyric]);
    if (maps.isNotEmpty) {
      return Lyric.fromMap(maps.first);
    } else {
      return Lyric(
          idLyricGva: 0,
          code: 'code',
          author: 'author',
          key: 'key',
          lyric: 'lyric',
          title: 'title',
          type: 1, id: 0);
    }
  }

  Future<List<Lyric>> getAllLyricsByType(int type) async {
    Database db = await LyraDb.instance.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT * FROM lyrics WHERE type = ? ORDER BY title  ASC
    ''', [type]);
    List<Lyric> lyrics = List.generate(maps.length, (i) {
      return Lyric.fromMap(maps[i]);
    });
    if (lyrics.isEmpty) {
      lyrics.add(Lyric(
          idLyricGva: 0,
          code: 'code',
          author: 'author',
          key: 'key',
          lyric: 'lyric',
          title: 'title',
          type: 1,
          id: 0));
    }
    return lyrics;
  }

  Future<List<Lyric>> searchLyric(int type, String query) async {
    Database db = await LyraDb.instance.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT * FROM lyrics WHERE type = ? AND (title LIKE ? OR lyric LIKE ? OR key LIKE ? OR author LIKE ?) ORDER BY title ASC
    ''', [type, "%$query%", "%$query%", "%$query%", "%$query%"]);

    List<Lyric> lyrics = List.generate(maps.length, (i) {
      return Lyric.fromMap(maps[i]);
    });

    return lyrics;
  }
}
