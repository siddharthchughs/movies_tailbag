import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/screens/movie_screenpvdr.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
import 'package:mvvm_moviecatalog_app/service/navigation_service.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/moviebag_provider.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/redo_favorite_provider.dart';
import 'package:mvvm_moviecatalog_app/widgets/error_widget.dart';
import 'package:provider/provider.dart';

class SplashScreenPvdr extends StatelessWidget {
  const SplashScreenPvdr({super.key});

  Future<void> _loadInitialData(BuildContext context) async {
    await Future.microtask(() async {
      if (!context.mounted) return;
      await Provider.of<RedoFavoriteProvider>(
        context,
        listen: false,
      ).loadLocalFavorites();

      if (!context.mounted) return;
      await Provider.of<MoviebagProvider>(
        context,
        listen: false,
      ).getPopularMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviebagProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade200,
      body: FutureBuilder(
        future: _loadInitialData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            if (movieProvider.genre.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                getIt<NavigationService>().navigationReplace(MovieScreenpvdr());
              });
            }
            return Provider.of<MoviebagProvider>(context).isFetched
                ? const Center(child: CircularProgressIndicator.adaptive())
                : MyErrorWidget(
                    errorText: snapshot.error.toString(),
                    retryConnection: () async {
                      await _loadInitialData(context);
                    },
                  );
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              getIt<NavigationService>().navigationReplace(MovieScreenpvdr());
            });

            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
