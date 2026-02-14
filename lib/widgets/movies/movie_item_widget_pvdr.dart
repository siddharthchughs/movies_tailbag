import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_deault_image_constant.dart';
import 'package:mvvm_moviecatalog_app/widgets/cache_image.dart';
import 'package:mvvm_moviecatalog_app/widgets/movie_favorite_pprvdr_widget.dart';

class MovieItemLayoutPvdr extends StatelessWidget {
  const MovieItemLayoutPvdr({
    super.key,
    //required this.moviesModel
  });
  //  final MoviesModel moviesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(12),
        elevation: 2.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            //            getIt<NavigationService>().showDialog(Text('Error'));
            //            getIt<NavigationService>().navigateTo(
            //            MovieDetail(moviesModel: moviesModel),
            //        );
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.0, 4, 4, 0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CacheImage(
                      height: 200,
                      url: MyDeaultImageConstant.imageUrl,
                      //        '${MyApiConstants.imageBaseUrl_300D}${moviesModel.posterPath}',
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'moviesModel.title',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_border_rounded,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 18.0),

                            Text(
                              '0.8/10',
                              //                              '${moviesModel.voteAverage.toStringAsFixed(1)}/10',
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // GenresListWidget(moviesModel: moviesModel),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text('date'),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                MovieFavoritePprvdrWidget(),
                                //                                MovieFavoriteWidget(model: moviesModel),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
