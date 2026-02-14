import 'package:flutter/material.dart';

class MyAppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueAccent.shade100,
      foregroundColor: Colors.amberAccent.shade100,
      elevation: 1,
    ),
    colorScheme: ColorScheme.dark(),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueAccent.shade400,
      foregroundColor: Colors.amber.shade400,
      elevation: 1,
    ),
    colorScheme: ColorScheme.dark(),
  );
}
