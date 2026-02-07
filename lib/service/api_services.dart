import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_moviecatalog_app/constants/my_api_constants.dart';
import 'package:mvvm_moviecatalog_app/models/genre_model.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';

class ApiServices {
  Future<List<MoviesModel>> getPopularMovies({int page = 1}) async {
    final url = Uri.parse(
      "${MyApiConstants.baseUrl}/movie/popular?language=en-US&page=$page",
    );
    final response = await http.get(url, headers: MyApiConstants().headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return List.from(
        data['results'].map((elements) => MoviesModel.fromJson(elements)),
      );
    } else {
      throw Exception('failed to load movies:: ${response.statusCode}');
    }
  }

  Future<List<GenreModel>> getGenre() async {
    final url = Uri.parse("${MyApiConstants.baseUrl}/genre/movie/list");
    final response = await http.get(url, headers: MyApiConstants().headers);
    if (response.statusCode == 200) {
      final genreData = jsonDecode(response.body);
      print(genreData);
      return List.from(
        genreData['genres'].map((elements) => GenreModel.fromJson(elements)),
      );
    } else {
      throw Exception('failed to load movies:: ${response.statusCode}');
    }
  }
}
