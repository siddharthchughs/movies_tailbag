import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/favorites_providers.dart';
import 'package:provider/provider.dart';

class MovieFavoritePprvdrWidget extends StatelessWidget {
  const MovieFavoritePprvdrWidget({super.key, required this.model});
  final MoviesModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, FavoritesProviders favoriteProviders, _) {
        return IconButton(
          onPressed: () {
            print('clicked');
            favoriteProviders.addOrRemoveFromFavorites(model);
          },
          icon: Icon(
            favoriteProviders.isAddToFavorites(model)
                ? MyCustomIcons.favorite_heart
                : MyCustomIcons.unselectedfavorite,
            color: favoriteProviders.isAddToFavorites(model)
                ? Colors.red
                : null,
            size: 20,
          ),
        );
      },
    );
  }
}
