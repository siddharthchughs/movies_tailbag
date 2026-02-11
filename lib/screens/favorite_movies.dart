import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';

class FavoriteMovies extends StatefulWidget {
  const FavoriteMovies({super.key});

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  final _favouriteMovies = [];

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Text('Data::$index');
        },
      ),
    );
  }
}
