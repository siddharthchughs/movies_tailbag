import 'package:mvvm_moviecatalog_app/models/genre_model.dart';
import 'package:mvvm_moviecatalog_app/repository/movies_repository.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';

class GenresUtility {
  static List<GenreModel> movieGenre(List<int> genreIds) {
    final movieRepository = getIt<MoviesRepository>();
    final cacheFromRepo = []; // TODO GET THE CORRECT GENRES FOR THE MOVIE
    //movieRepository.cacheGenre;
    List<GenreModel> genreNames = [];
    for (var genreId in genreIds) {
      var genre = cacheFromRepo.firstWhere((g) => g.id == genreId);
      genreNames.add(genre);
    }
    return genreNames;
  }
}
