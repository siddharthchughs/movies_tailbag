import 'package:mvvm_moviecatalog_app/models/genre_model.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
import 'package:mvvm_moviecatalog_app/service/api_services.dart';

class MoviesRepository {
  final ApiServices _apiServices;
  MoviesRepository(this._apiServices);
  List<GenreModel> cacheGenre = [];

  Future<List<MoviesModel>> getPopularMovies({int page = 1}) async {
    return await _apiServices.getPopularMovies(page: page);
  }

  Future<List<GenreModel>> getGenres() async {
    return cacheGenre = await _apiServices.getGenre();
  }
}
