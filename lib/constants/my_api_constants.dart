class MyApiConstants {
  static String apikey = 'e620691df09a09e70058468621b6e1e6';
  static String access_token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjIwNjkxZGYwOWEwOWU3MDA1ODQ2ODYyMWI2ZTFlNiIsIm5iZiI6MTY0ODUzOTcyMi40MzEsInN1YiI6IjYyNDJiODRhZDcxZmI0MDA0N2Y4NDY3ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VGSDh6aE1KWQiZEpkbrTudEipbalTUBtrFC9IrV5t30';
  static String baseUrl = "https://api.themoviedb.org/3";
  static String imageBaseUrl_300D = "https://image.tmdb.org/t/p/w300/";
  static String imageBaseUrl_500D = "https://image.tmdb.org/t/p/w500/";
  static String imageBaseUrl_780D = "https://image.tmdb.org/t/p/w780/";
  final headers = {
    'Authorization': 'Bearer $access_token',
    'accept': 'application/json',
  };
}
