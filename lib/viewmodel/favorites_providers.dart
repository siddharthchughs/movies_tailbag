import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_api_constants.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProviders with ChangeNotifier {
  final List<MoviesModel> _favoriteList = [];
  List<MoviesModel> get favorites => _favoriteList;

  bool isAddToFavorites(MoviesModel model) {
    return _favoriteList.any((movieChecked) => movieChecked.id == model.id);
  }

  Future<void> addOrRemoveFromFavorites(MoviesModel model) async {
    if (isAddToFavorites(model)) {
      _favoriteList.removeWhere((movie) => movie.id == model.id);
    } else {
      _favoriteList.add(model);
      print('Added');
    }
    await saveFavourites();
    notifyListeners();
  }

  Future<void> saveFavourites() async {
    final prefSave = await SharedPreferences.getInstance();
    final favouritesList = _favoriteList
        .map((selected) => json.encode(selected.toJson()))
        .toList();
    await prefSave.setStringList(MyApiConstants.favoritesKey, favouritesList);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(MyApiConstants.favoritesKey) ?? [];
    _favoriteList.clear();
    _favoriteList.addAll(
      stringList.map(
        (favMovies) => MoviesModel.fromJson(json.decode(favMovies)),
      ),
    );
    notifyListeners();
  }

  void clearFavorites() {
    _favoriteList.clear();
    notifyListeners();
    saveFavourites();
  }
}
