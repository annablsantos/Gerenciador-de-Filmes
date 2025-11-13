import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/movie.dart';

class MovieViewModel extends ChangeNotifier {
  final DBHelper _dbHelper = DBHelper();
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future<void> loadMovies() async {
    _movies = await _dbHelper.getMovies();
    notifyListeners();
  }

  Future<void> addMovie(Movie movie) async {
    await _dbHelper.insertMovie(movie);
    await loadMovies();
  }

  Future<void> updateMovie(Movie movie) async {
    await _dbHelper.updateMovie(movie);
    await loadMovies();
  }

  Future<void> deleteMovie(int id) async {
    await _dbHelper.deleteMovie(id);
    await loadMovies();
  }
}