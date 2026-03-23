import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/redo_favorite_provider.dart';
import 'package:provider/provider.dart';

class MovieFavoritePprvdrWidget extends StatelessWidget {
  MovieFavoritePprvdrWidget({super.key, required this.model});
  MoviesModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, RedoFavoriteProvider favoriteProviders, _) {
        return IconButton(
          onPressed: () {
            favoriteProviders.addOrRemoveFavoriteMovies(model);
          },
          icon: Icon(
            favoriteProviders.isFavorite(model)
                ? MyCustomIcons.favorite_heart
                : MyCustomIcons.unselectedfavorite,
            color: favoriteProviders.isFavorite(model) ? Colors.red : null,
            size: 20,
          ),
        );
      },
    );
  }
}
