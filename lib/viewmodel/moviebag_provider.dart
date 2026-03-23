import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/models/genre_model.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
import 'package:mvvm_moviecatalog_app/repository/movies_repository.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';

class MoviebagProvider with ChangeNotifier {
  int _currentPage = 1;
  final List<MoviesModel> _listMovies = [];
  List<MoviesModel> get movies => _listMovies;

  List<GenreModel> _movieGenre = [];
  List<GenreModel> get genre => _movieGenre;

  bool _isFetched = false;
  bool get isFetched => _isFetched;

  String _fetchErrorMessage = '';
  String get fetchErrorMessage => _fetchErrorMessage;

  final MoviesRepository _repository = getIt<MoviesRepository>();

  Future<void> getPopularMovies() async {
    _isFetched = true;
    notifyListeners();
    try {
      if (_movieGenre.isEmpty) {
        _movieGenre = await _repository.getGenres();
      }
      List<MoviesModel> movies = await _repository.getPopularMovies(
        page: _currentPage,
      );
      _listMovies.addAll(movies);
      _currentPage++;
      _fetchErrorMessage = '';
    } catch (error) {
      _fetchErrorMessage = "Error message: $error ";
      rethrow;
    } finally {
      _isFetched = false;
      notifyListeners();
    }
  }
}
