import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
import 'package:mvvm_moviecatalog_app/widgets/genres_item_widget_pvdr.dart';
import 'package:provider/provider.dart';
import '../../constants/my_api_constants.dart';
import '../../models/movies_model.dart';
import '../../screens/movie_detail_pvdr.dart';
import '../../service/navigation_service.dart';
import '../cache_image.dart';
import '../movie_favorite_pprvdr_widget.dart';

class MovieItemLayoutPvdr extends StatelessWidget {
  const MovieItemLayoutPvdr({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        color: Colors.lightGreenAccent.shade100,
        borderRadius: BorderRadius.circular(12),
        elevation: 2.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            //            getIt<NavigationService>().showDialog(Text('Error'));
            getIt<NavigationService>().navigateTo(
              ChangeNotifierProvider.value(
                value: movieProvider,
                child: MovieDetailPvdr(),
              ),
            );
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
                      url:
                          //'${MyDeaultImageConstant.imageUrl}',
                          '${MyApiConstants.imageBaseUrl_300D}${movieProvider.posterPath}',
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          movieProvider.title,
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
                              '${movieProvider.voteAverage.toStringAsFixed(2)} / 10',
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                        const SizedBox(height: 12),
                        GenresItemWidgetPvdr(moviesModel: movieProvider),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.watch_later_outlined,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 8.0),
                            Text(movieProvider.releaseDate),
                            const Spacer(),
                            MovieFavoritePprvdrWidget(model: movieProvider),
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
