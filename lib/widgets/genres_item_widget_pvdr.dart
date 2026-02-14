import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/models/genre_model.dart';
import 'package:mvvm_moviecatalog_app/utility/genres_utility.dart';

class GenresItemWidgetPvdr extends StatelessWidget {
  const GenresItemWidgetPvdr({
    super.key,
    //required this.moviesModel
  });
  //  MoviesModel moviesModel;

  @override
  Widget build(BuildContext context) {
    List<GenreModel> genres = GenresUtility.movieGenre(
      [],
      //moviesModel.genreIds
    );
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 2.0,
      children: List.generate(
        genres.length,
        (index) => chipWidget(generItem: genres[index].name, context: context),
      ),
    );
  }

  Widget chipWidget({
    required String generItem,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade400,
          borderRadius: BorderRadius.circular(30.0),
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.limeAccent.shade400),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
          child: Text(
            generItem,
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
