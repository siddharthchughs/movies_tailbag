import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/models/genre_model.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';

import 'package:provider/provider.dart';

import '../repository/movies_repository.dart';
import '../viewmodel/moviebag_provider.dart';

class GenresUtility {
  static List<GenreModel> movieGenre(List<int> genreIds, BuildContext context) {
    final movieProvider = Provider.of<MoviebagProvider>(context, listen: false);
    final cacheFromRepo = movieProvider.genre;
    List<GenreModel> genreNames = [];
    for (var genreId in genreIds) {
      var genre = cacheFromRepo.firstWhere(
        (g) => g.id == genreId,
        orElse: () {
          return GenreModel(id: 123123, name: "Unknown");
        },
      );
      genreNames.add(genre);
    }
    return genreNames;
  }

  static List<GenreModel> movieGenreFromCache(List<int> genreIds) {
    final movieRepository = getIt<MoviesRepository>();
    final cacheRepo = movieRepository.cacheGenre;
    List<GenreModel> genreNames = [];

    for (var genres in genreIds) {
      var newGenre = cacheRepo.firstWhere(
        (g) => g.id == genres,
        orElse: () => GenreModel(id: 111, name: "Unknowmn"),
      );
      genreNames.add(newGenre);
    }
    return genreNames;
  }
}
