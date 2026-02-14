import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_api_constants.dart';
import 'package:mvvm_moviecatalog_app/constants/my_app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeMode { LIGHT_MODE, DARK_MODE }

class ThemeProvider with ChangeNotifier {
  ThemeData themeMode = MyAppTheme.lightTheme;

  ThemeProvider() {
    loadSavedTheme();
  }

  ThemeData get themeColorUpdate {
    return themeMode;
  }

  Future<void> loadSavedTheme() async {
    final pref = await SharedPreferences.getInstance();
    final savedTheme = pref.getBool(MyApiConstants.themeModeKey) ?? true;
    themeMode = savedTheme ? MyAppTheme.darkTheme : MyAppTheme.lightTheme;
    notifyListeners();
  }

  Future<void> toggleChangeTheme() async {
    final pref = await SharedPreferences.getInstance();
    themeMode = (themeMode == MyAppTheme.darkTheme)
        ? MyAppTheme.lightTheme
        : MyAppTheme.darkTheme;

    await pref.setBool(
      MyApiConstants.themeModeKey,
      themeMode == MyAppTheme.darkTheme,
    );
    notifyListeners();
  }
}
