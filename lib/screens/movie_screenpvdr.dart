import 'package:flutter/material.dart' hide ThemeMode;
import 'package:mvvm_moviecatalog_app/viewmodel/moviebag_provider.dart';
import 'package:provider/provider.dart';
import '../constants/my_custom_icons.dart';
import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../viewmodel/theme_provider.dart';
import '../widgets/movies/movie_item_widget_pvdr.dart';
import 'favorite_screen_prvdr.dart';

class MovieScreenpvdr extends StatelessWidget {
  const MovieScreenpvdr({super.key});

  @override
  Widget build(BuildContext context) {
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
                  MyCustomIcons.colorModeDark,
                  color: Colors.blueAccent,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, MoviebagProvider movieProvider, child) {
          if (movieProvider.isFetched && movieProvider.movies.isEmpty) {
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
                  !movieProvider.isFetched) {
                movieProvider.getPopularMovies();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              itemCount: movieProvider.movies.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: movieProvider.movies[index],
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
