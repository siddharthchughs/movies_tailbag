import 'package:flutter/material.dart' hide ThemeMode;
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/screens/favorite_movies.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
import 'package:mvvm_moviecatalog_app/service/navigation_service.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/theme_provider.dart';
import 'package:mvvm_moviecatalog_app/widgets/movies/movie_item_widget_pvdr.dart';
import 'package:provider/provider.dart';

class MovieScreenpvdr extends StatelessWidget {
  const MovieScreenpvdr({super.key});

  @override
  Widget build(BuildContext context) {
    //    final themeProvider = Provider.of<ThemeProvider>(context);
    print('Build UI');
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigateTo(FavoriteMovies());
            },
            icon: Icon(
              MyCustomIcons.favorite_heart,
              color: Colors.blue.shade400,
            ),
          ),
          Consumer(
            builder: (context, ThemeProvider themeProvider, child) {
              return IconButton(
                onPressed: () async {
                  themeProvider.toggleChangeTheme();
                },
                icon: Icon(
                  MyCustomIcons.colorModeChange,
                  color: Colors.blueAccent,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return MovieItemLayoutPvdr();
        },
      ),
    );
  }
}
