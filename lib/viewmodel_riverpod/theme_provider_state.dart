// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:mvvm_moviecatalog_app/constants/my_api_constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ThemeProvider extends StateNotifier<ThemeMode> {
//   //  final prefeKey = MyApiConstants.themeModeKey;

//   ThemeProvider() : super(ThemeMode.light) {
//     _loadSavedTheme();
//   }

//   Future<void> _loadSavedTheme() async {
//     final pref = await SharedPreferences.getInstance();
//     final isModeEnabled = pref.getBool(MyApiConstants.themeModeKey) ?? false;
//     state = (state == isModeEnabled) ? ThemeMode.light : ThemeMode.dark;
//   }

//   Future<void> toggleThemeChnage() async {
//     final pref = await SharedPreferences.getInstance();
//     state = (state == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
//     pref.setBool(MyApiConstants.themeModeKey, state == ThemeMode.light);
//   }
// }

// final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>(
//   (ref) => ThemeProvider(),
// );
