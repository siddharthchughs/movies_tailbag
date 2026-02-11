import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';

class MovieFavoriteWidget extends StatefulWidget {
  const MovieFavoriteWidget({super.key, required this.model});
  final MoviesModel model;

  @override
  State<MovieFavoriteWidget> createState() => _MovieFavoriteWidgetState();
}

class _MovieFavoriteWidgetState extends State<MovieFavoriteWidget> {
  final _favouriteMovies = [];

  @override
  Widget build(BuildContext context) {
    bool isFavorite = _favouriteMovies.contains(widget.model.id);

    return IconButton(
      padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
      onPressed: () {
        if (isFavorite) {
          _favouriteMovies.remove(widget.model.id);
        } else {
          _favouriteMovies.add(widget.model.id);
        }
        setState(() {});
      },
      icon: Icon(
        isFavorite
            ? MyCustomIcons.favorite_heart
            : MyCustomIcons.unselectedfavorite,
        color: Colors.pinkAccent,
      ),
    );
  }
}
