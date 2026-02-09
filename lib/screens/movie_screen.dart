import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
import 'package:mvvm_moviecatalog_app/repository/movies_repository.dart';
import 'package:mvvm_moviecatalog_app/screens/favorite_movies.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
import 'package:mvvm_moviecatalog_app/service/navigation_service.dart';
import 'package:mvvm_moviecatalog_app/widgets/movies/movie_item_widget.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MoviesState();
}

class _MoviesState extends State<MovieScreen> {
  final List<MoviesModel> _movies = [];
  int currentPage = 1;
  bool _isFetched = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadMoreMovies();
    _scrollController.addListener(_onLoadMoreMovies);
  }

  void _onLoadMoreMovies() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetched) {
      _loadMoreMovies();
    }
  }

  Future<void> _loadMoreMovies() async {
    if (_isFetched) return;
    setState(() {
      _isFetched = true;
    });
    try {
      final List<MoviesModel> newMoviesList = await getIt<MoviesRepository>()
          .getPopularMovies(page: currentPage);
      setState(() {
        _movies.addAll(newMoviesList);
        currentPage++;
      });
    } catch (error) {
      getIt<NavigationService>().showSnakbar('Error Occured');
    } finally {
      _isFetched = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = _movies.isNotEmpty
        ? ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
            itemCount: _movies.length + (_isFetched ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < _movies.length) {
                return MovieItemLayout(moviesModel: _movies[index]);
              }
              return const Center(child: Text('Loading...'));
            },
          )
        : Center(child: CupertinoActivityIndicator());

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigateTo(FavoriteMovies());
            },
            icon: Icon(MyCustomIcons.favorites, color: Colors.blue.shade400),
          ),
          IconButton(
            onPressed: () async {},
            icon: Icon(MyCustomIcons.colorModeChange, color: Colors.blueAccent),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
        itemCount: _movies.length + (_isFetched ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _movies.length) {
            return MovieItemLayout(moviesModel: _movies[index]);
          }
          return const Center(child: Text('Loading...'));
        },
      ),
    );
  }
}
