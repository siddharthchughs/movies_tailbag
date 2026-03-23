// import 'package:flutter/foundation.dart';

// import '../models/genre_model.dart';
// import '../models/movies_model.dart';
// import '../repository/movies_repository.dart';
// import '../service/init_getit.dart';

// class MovieProvider with ChangeNotifier {
//   int currentPage = 1;
//   final List<MoviesModel> _movies = [];
//   List<MoviesModel> get moviesLoaded => _movies;

//   List<GenreModel> _movieGenres = [];
//   List<GenreModel> get movieGenresLoaded => _movieGenres;

//   bool isFetched = false;
//   bool get isLoading => isFetched;
//   String _fetchErrorMessage = '';
//   String get fetchErrorMessage => _fetchErrorMessage;
//   final MoviesRepository _movieRepository = getIt<MoviesRepository>();

//   Future<void> getMovies() async {
//     isFetched = true;
//     notifyListeners();
//     try {
//       if (_movieGenres.isEmpty) {
//         _movieGenres = await _movieRepository.getGenres();
//       }
//       List<MoviesModel> newMOvieList = await _movieRepository.getPopularMovies(
//         page: currentPage,
//       );
//       _movies.addAll(newMOvieList);
//       currentPage++;
//       _fetchErrorMessage = '';
//       notifyListeners();
//     } catch (error) {
//       _fetchErrorMessage = 'Error Occurred';
//       notifyListeners();
//       rethrow;
//     } finally {
//       isFetched = false;
//       notifyListeners();
//     }
//   }
// }
