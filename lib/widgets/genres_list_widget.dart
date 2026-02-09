import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_deault_image_constant.dart';
import 'package:mvvm_moviecatalog_app/models/movies_model.dart';

class GenresListWidget extends StatelessWidget {
  GenresListWidget({super.key, required this.moviesModel});
  MoviesModel moviesModel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 2.0,

      children: List.generate(
        moviesModel.genreIds!.length,
        (index) => chipWidget(
          generItem: MyDeaultImageConstant.genres[index],
          context: context,
        ),
      ),
    );
  }

  Widget chipWidget({
    required String generItem,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade200,
          borderRadius: BorderRadius.circular(30.0),
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.lightBlueAccent.shade400),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Text(
            generItem,
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
