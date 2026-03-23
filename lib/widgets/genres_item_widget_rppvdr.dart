// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
// import 'package:mvvm_moviecatalog_app/models/genre_model.dart';
// import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
// import 'package:mvvm_moviecatalog_app/utility/genres_utility.dart';
// import 'package:provider/provider.dart';

// class GenresItemWidgetRppvdr extends ConsumerWidget {
//   GenresItemWidgetRppvdr({super.key, required this.index});
//   //  MoviesModel moviesModel;
//   int index;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final movieProvider = Provider.of<MoviesModel>(context);
//     //final movieGenereState = ref.watch(currentIndexGenreProvider(index));
//     final List<GenreModel> genres = GenresUtility.movieGenre(
//       movieProvider.genreIds,
//       context,
//     );

//     // List<GenreModel> genres = GenresUtility.movieGenre(
//     //   [],
//     //   context,
//     //   //moviesModel.genreIds
//     // );
//     //    final genreProviders = Provider
//     return Wrap(
//       direction: Axis.horizontal,
//       alignment: WrapAlignment.start,
//       spacing: 2.0,
//       children: List.generate(
//         movieProvider.genreIds.length,
//         (index) => chipWidget(generItem: genres[index].name, context: context),
//       ),
//     );
//   }

//   Widget chipWidget({
//     required String generItem,
//     required BuildContext context,
//   }) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.deepPurple.shade400,
//           borderRadius: BorderRadius.circular(30.0),
//           shape: BoxShape.rectangle,
//           border: Border.all(color: Colors.limeAccent.shade400),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
//           child: Text(
//             generItem,
//             style: TextStyle(fontSize: 14.0, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
