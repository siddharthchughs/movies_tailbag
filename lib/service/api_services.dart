import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_moviecatalog_app/constants/my_api_constants.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';

class ApiServices {
  Future<List<Mov>> getPopularMovies({int page = 1}) async {
    final url = Uri.parse(
      "${MyApiConstants.baseUrl}/movie/popular?language=en-US&page=$page",
    );
    final response = await http.get(url, headers: MyApiConstants().headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Respnse: $data');
    } else {
      throw Exception('failed to load movies:: ${response.statusCode}');
    }
  }
}
