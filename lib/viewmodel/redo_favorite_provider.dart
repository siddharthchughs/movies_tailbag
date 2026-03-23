import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_api_constants.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO
// 1. isFavourite movide selected
// 2. addFavorite to the new List
// 3. to update the Ui using ChangeNotifier
// 4. create saveFavorite movie in local using SharedPreferences
// 5. load favorites movies from local.

class RedoFavoriteProvider with ChangeNotifier {
  final List<MoviesModel> _selevctedMovieList = [];
  List<MoviesModel> get favoriteList => _selevctedMovieList;

  bool isFavorite(MoviesModel movieModel) {
    return _selevctedMovieList.any((movie) => movie.id == movieModel.id);
  }

  void addOrRemoveFavoriteMovies(MoviesModel movieModel) async {
    if (isFavorite(movieModel)) {
      _selevctedMovieList.removeWhere(
        (movie) => movie.id == movieModel.genreIds,
      );
    } else {
      _selevctedMovieList.add(movieModel);
    }
    saveFavoroiteInLocale();
    notifyListeners();
  }

  Future<void> saveFavoroiteInLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = _selevctedMovieList
        .map((ms) => jsonEncode(ms.toJson()))
        .toList();
    await prefs.setStringList(MyApiConstants.favoritesKey, favoriteList);
  }

  Future<void> loadLocalFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = _selevctedMovieList
        .map((ms) => jsonEncode(ms.toJson()))
        .toList();
    prefs.getStringList(MyApiConstants.favoritesKey);
  }

  void clearAllFavorites() {
    _selevctedMovieList.clear();
    notifyListeners();
    saveFavoroiteInLocale();
  }
}
