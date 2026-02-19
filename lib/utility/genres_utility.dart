import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/models/genre_model.dart';
import 'package:mvvm_moviecatalog_app/repository/movies_repository.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/movie_provider.dart';
import 'package:provider/provider.dart';

class GenresUtility {
  static List<GenreModel> movieGenre(List<int> genreIds, BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    final movieRepository = getIt<MoviesRepository>();
    final cacheFromRepo = movieProvider.movieGenresLoaded;
    //[]; // TODO GET THE CORRECT GENRES FOR THE MOVIE
    //        movieRepository.cacheGenre;
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
}
