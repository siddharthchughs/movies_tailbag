import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/screens/favorite_movies.dart';
import 'package:mvvm_moviecatalog_app/service/api_services.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
import 'package:mvvm_moviecatalog_app/service/navigation_service.dart';
import 'package:mvvm_moviecatalog_app/widgets/movies/movie_item_widget.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigateTo(FavoriteMovies());
            },
            icon: Icon(
              MyCustomIcons.favorites,
              color: Colors.lightGreenAccent.shade400,
            ),
          ),
          IconButton(
            onPressed: () {
              getIt<ApiServices>().getPopularMovies();
            },
            icon: Icon(MyCustomIcons.colorModeChange, color: Colors.blueAccent),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return MovieItemLayout();
        },
      ),
    );
  }
}
