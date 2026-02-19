import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_api_constants.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
import 'package:mvvm_moviecatalog_app/widgets/cache_image.dart';
import 'package:mvvm_moviecatalog_app/widgets/genres_item_widget_pvdr.dart';
import 'package:mvvm_moviecatalog_app/widgets/movie_favorite_pprvdr_widget.dart';
import 'package:provider/provider.dart';

class MovieDetailPvdr extends StatelessWidget {
  const MovieDetailPvdr({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.45,
              width: double.infinity,
              child: CacheImage(
                url:
                    //'${MyCustomIcons.arrow_back}',
                    '${MyApiConstants.imageBaseUrl_500D}${movieProvider.backdropPath}',
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.4),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 25.0),
                                Text(movieProvider.title),
                                const SizedBox(height: 8),
                                const SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            MyCustomIcons.ratingStar,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(width: 12.0),
                                          Text(
                                            '${movieProvider.voteAverage.toStringAsFixed(1)}/10',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(movieProvider.releaseDate),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                  ],
                                ),
                                const SizedBox(height: 15.0),
                                GenresItemWidgetPvdr(),
                                const SizedBox(height: 15.0),
                                Text(
                                  movieProvider.overview,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MovieFavoritePprvdrWidget(
                              model: movieProvider,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
