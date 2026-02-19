import 'package:flutter/material.dart' hide ThemeMode;
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/screens/favorite_screen_prvdr.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
import 'package:mvvm_moviecatalog_app/service/navigation_service.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/movie_provider.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/theme_provider.dart';
import 'package:mvvm_moviecatalog_app/widgets/movies/movie_item_widget_pvdr.dart';
import 'package:provider/provider.dart';

class MovieScreenpvdr extends StatelessWidget {
  const MovieScreenpvdr({super.key});

  @override
  Widget build(BuildContext context) {
    //    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigateTo(FavoriteScreenPrvdr());
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
      body: Consumer(
        builder: (context, MovieProvider movieProvider, child) {
          if (movieProvider.isLoading && movieProvider.moviesLoaded.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (movieProvider.fetchErrorMessage.isNotEmpty) {
            return Center(
              child: Text('Movies Loaded: ${movieProvider.fetchErrorMessage}'),
            );
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notifyScroll) {
              if (notifyScroll.metrics.pixels ==
                      notifyScroll.metrics.maxScrollExtent &&
                  !movieProvider.isLoading) {
                movieProvider.getMovies();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              itemCount: movieProvider.moviesLoaded.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: movieProvider.moviesLoaded[index],
                  child: MovieItemLayoutPvdr(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
