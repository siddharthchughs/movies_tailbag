import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_api_constants.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';
import 'package:mvvm_moviecatalog_app/widgets/cache_image.dart';

class MovieDetail extends StatelessWidget {
  MovieDetail({super.key, required this.moviesModel});
  MoviesModel moviesModel;

  @override
  Widget build(BuildContext context) {
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
                    '${MyApiConstants.imageBaseUrl_500D}${moviesModel.backdropPath}',
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
                                Text(moviesModel.title),
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
                                            '${moviesModel.voteAverage.toStringAsFixed(1)}/10',
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
                                          Text(moviesModel.releaseDate),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                  ],
                                ),
                                const SizedBox(height: 15.0),
                                GenresListWidget(moviesModel: moviesModel),
                                const SizedBox(height: 15.0),
                                Text(
                                  moviesModel.overview,
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
                            child: Icon(MyCustomIcons.unselectedfavorite),
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
