import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';

class MovieFavoriteWidget extends StatelessWidget {
  const MovieFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(MyCustomIcons.favorites),
      iconSize: 28,
    );
  }
}
