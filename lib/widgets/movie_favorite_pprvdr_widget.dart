import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';

class MovieFavoritePprvdrWidget extends StatelessWidget {
  const MovieFavoritePprvdrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
      onPressed: () {},
      icon: Icon(MyCustomIcons.favorite_heart, color: Colors.pinkAccent),
    );
  }
}
