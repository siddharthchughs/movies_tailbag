import 'package:flutter/material.dart';

class MyAppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueAccent.shade400,
      //      foregroundColor: Colors.amberAccent.shade100,
      elevation: 1,
      titleTextStyle: TextStyle(
        color: Colors.green.shade300,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.green.shade400),
    colorScheme: ColorScheme.light(),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueAccent.shade400,
      foregroundColor: Colors.pink.shade400,
      elevation: 1,
    ),
    colorScheme: ColorScheme.dark(),
  );
}
