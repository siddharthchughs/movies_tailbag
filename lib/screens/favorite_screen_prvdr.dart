import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/favorites_providers.dart';
import 'package:mvvm_moviecatalog_app/widgets/movies/movie_item_widget_pvdr.dart';
import 'package:provider/provider.dart';

class FavoriteScreenPrvdr extends StatelessWidget {
  const FavoriteScreenPrvdr({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProviders = Provider.of<FavoritesProviders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
        actions: [
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            onPressed: () {
              favoritesProviders.clearFavorites();
            },
            icon: Icon(
              MyCustomIcons.deleteFavorite,
              color: Colors.lightGreenAccent,
            ),
          ),
        ],
      ),
      body: favoritesProviders.favorites.isEmpty
          ? const Center(child: Text('No more favorites!'))
          : ListView.builder(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              itemCount: favoritesProviders.favorites.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: favoritesProviders.favorites[index],
                  child: MovieItemLayoutPvdr(),
                );
              },
            ),
    );
  }
}
