import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/favorites_providers.dart';
import 'package:mvvm_moviecatalog_app/widgets/movies/movie_item_widget_pvdr.dart';
import 'package:provider/provider.dart';

class FavoriteMovies extends StatefulWidget {
  const FavoriteMovies({super.key});

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  final _favouriteMovies = [];

  @override
  Widget build(BuildContext context) {
    final favoritesProviders = Provider.of<FavoritesProviders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
        actions: [
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            onPressed: () {},
            icon: Icon(
              MyCustomIcons.deleteFavorite,
              color: Colors.lightGreenAccent,
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider<FavoritesProviders>(
        create: (context) => FavoritesProviders(),
        builder: (context, child) {
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
            itemCount: 10,
            itemBuilder: (context, index) {
              return MovieItemLayoutPvdr();
            },
          );
        },
      ),
    );
  }
}
