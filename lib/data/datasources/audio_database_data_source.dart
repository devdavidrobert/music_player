import 'package:sqflite/sqflite.dart';
import '../../domain/entities/audio_file.dart';

class AudioDatabaseDataSource {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      '${await getDatabasesPath()}/music_player.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE songs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            path TEXT UNIQUE,
            title TEXT,
            artist TEXT,
            album TEXT,
            duration INTEGER,
            albumArtPath TEXT
          )
        ''');
      },
    );
  }

  Future<void> upsertSong(AudioFile song) async {
    final db = await database;
    await db.insert('songs', song.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<AudioFile>> getAllSongs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('songs');
    return maps.map((m) => AudioFile.fromMap(m)).toList();
  }

  Future<List<String>> getArtists() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT DISTINCT artist FROM songs');
    return maps.map((m) => m['artist'] as String).toList();
  }

  Future<List<String>> getAlbums() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT DISTINCT album FROM songs');
    return maps.map((m) => m['album'] as String).toList();
  }

  Future<List<AudioFile>> getSongsByArtist(String artist) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('songs', where: 'artist = ?', whereArgs: [artist]);
    return maps.map((m) => AudioFile.fromMap(m)).toList();
  }

  Future<List<AudioFile>> getSongsByAlbum(String album) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('songs', where: 'album = ?', whereArgs: [album]);
    return maps.map((m) => AudioFile.fromMap(m)).toList();
  }

  Future<List<AudioFile>> searchSongs(String query) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'songs',
      where: 'title LIKE ? OR artist LIKE ? OR album LIKE ?',
      whereArgs: ['%$query%', '%$query%', '%$query%'],
    );
    return maps.map((m) => AudioFile.fromMap(m)).toList();
  }
}