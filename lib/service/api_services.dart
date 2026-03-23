import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/my_api_constants.dart';
import '../models/genre_model.dart';
import '../models/movies_model.dart';

class ApiServices {
  Future<List<MoviesModel>> getPopularMovies({int page = 1}) async {
    final url = Uri.parse(
      "${MyApiConstants.baseUrl}/movie/popular?language=en-US&page=$page",
    );
    final response = await http
        .get(url, headers: MyApiConstants().headers)
        .timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Movies fetched successfully: ${data.toString()} movies");
      return List.from(
        data['results'].map((elements) => MoviesModel.fromJson(elements)),
      );
    } else {
      throw Exception('failed to load movies:: ${response.statusCode}');
    }
  }

  Future<List<GenreModel>> getGenre() async {
    final url = Uri.parse("${MyApiConstants.baseUrl}/genre/movie/list");
    final response = await http
        .get(url, headers: MyApiConstants().headers)
        .timeout(Duration(seconds: 10));
    if (response.statusCode == 200) {
      final dataInResponse = jsonDecode(response.body);
      print("Genres fetched successfully: ${dataInResponse.toString()} genres");
      return List.from(
        dataInResponse['genres'].map(
          (elements) => GenreModel.fromJson(elements),
        ),
      );
    } else {
      throw Exception('failed to load movies:: ${response.statusCode}');
    }
  }
}
