import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/widgets/movies/movie_item_widget_pvdr.dart';
import 'package:provider/provider.dart';

import '../viewmodel/redo_favorite_provider.dart';

class FavoriteScreenPrvdr extends StatelessWidget {
  const FavoriteScreenPrvdr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
        actions: [
          Consumer(
            builder: (context, RedoFavoriteProvider favoritesProviders, child) {
              return IconButton(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                onPressed: () {
                  favoritesProviders.clearAllFavorites();
                },
                icon: Icon(
                  MyCustomIcons.deleteFavorite,
                  color: Colors.lightGreenAccent,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, RedoFavoriteProvider favoritesProviders, child) {
          return favoritesProviders.favoriteList.isEmpty
              ? const Center(child: Text('No more favorites!'))
              : ListView.builder(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                  itemCount: favoritesProviders.favoriteList.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: favoritesProviders.favoriteList[index],
                      child: MovieItemLayoutPvdr(),
                    );
                  },
                );
        },
      ),
    );
  }
}
