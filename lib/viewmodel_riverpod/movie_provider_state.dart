// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:mvvm_moviecatalog_app/models/genre_model.dart';
// import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
// import 'package:mvvm_moviecatalog_app/movie_model_state/movie_state.dart';
// import 'package:mvvm_moviecatalog_app/repository/movies_repository.dart';
// import 'package:mvvm_moviecatalog_app/service/init_getit.dart';

// class MovieProviderState extends StateNotifier<MoviesState> {
//   MovieProviderState() : super(MoviesState());

//   bool isFetched = false;
//   final MoviesRepository _movieRepository = getIt<MoviesRepository>();

//   Future<void> getPopularMovies() async {
//     state = state.copyWith(isFetched: true);
//     try {
//       if (state.genreList.isEmpty) {
//         final genreList = await _movieRepository.getGenres();
//         state = state.copyWith(genreList: genreList);
//       }
//       List<MoviesModel> newMOvieList = await _movieRepository.getPopularMovies(
//         page: state.currentPage,
//       );
//       state = state.copyWith(
//         movieList: [...state.movieList, ...newMOvieList],
//         currentPage: state.currentPage + 1,
//         fetchErrorMessage: '',
//       );
//     } catch (error) {
//       state = state.copyWith(
//         fetchErrorMessage: 'Error Occurred: ${error.toString()}',
//       );
//     } finally {
//       state = state.copyWith(isFetched: false);
//       return;
//     }
//   }

//   //   Future<void> getMovies() async {
//   //     isFetched = true;
//   //     notifyListeners();
//   //     try {
//   //       if (_movieGenres.isEmpty) {
//   //         _movieGenres = await _movieRepository.getGenres();
//   //       }
//   //       List<MoviesModel> newMOvieList = await _movieRepository.getPopularMovies(
//   //         page: currentPage,
//   //       );
//   //       _movies.addAll(newMOvieList);
//   //       currentPage++;
//   //       _fetchErrorMessage = '';
//   //       notifyListeners();
//   //     } catch (error) {
//   //       _fetchErrorMessage = 'Error Occurred';
//   //       notifyListeners();
//   //       rethrow;
//   //     } finally {
//   //       isFetched = false;
//   //       notifyListeners();
//   //     }
//   //   }
// }

// final movieStateProvider =
//     StateNotifierProvider<MovieProviderState, MoviesState>((_) {
//       return MovieProviderState();
//     });

// // new wasy to show the current movie for each item in the list
// final currentIndexMovieProvider = Provider.family<MoviesModel, int>((
//   ref,
//   index,
// ) {
//   final movieState = ref.watch(movieStateProvider);
//   return movieState.movieList[index];
// });

// final currentIndexGenreProvider = Provider.family<GenreModel, int>((
//   ref,
//   index,
// ) {
//   final movieState = ref.watch(movieStateProvider);
//   return movieState.genreList[index];
// });
