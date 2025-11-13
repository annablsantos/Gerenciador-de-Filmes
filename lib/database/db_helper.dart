import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/movie.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'movies.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE movies(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, imageUrl TEXT, genre TEXT, ageRating TEXT, duration TEXT, rating REAL, description TEXT, releaseYear INTEGER)",
        );
      },
    );
  }

  Future<int> insertMovie(Movie movie) async {
    final db = await database;
    return await db.insert('movies', movie.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateMovie(Movie movie) async {
    final db = await database;
    return await db.update('movies', movie.toMap(), where: 'id = ?', whereArgs: [movie.id]);
  }

  Future<int> deleteMovie(int id) async {
    final db = await database;
    return await db.delete('movies', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Movie>> getMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (i) => Movie.fromMap(maps[i]));
  }
}