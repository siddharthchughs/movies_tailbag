import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider, Consumer;
import 'package:mvvm_moviecatalog_app/screens/splash_screen_pvdr.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/moviebag_provider.dart';
import 'package:mvvm_moviecatalog_app/viewmodel/redo_favorite_provider.dart';
import 'package:provider/provider.dart';

import 'service/init_getit.dart';
import 'service/navigation_service.dart';
import 'viewmodel/theme_provider.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) async {
    await dotenv.load(fileName: 'assets/.env');
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<MoviebagProvider>(
          create: (_) => MoviebagProvider(),
        ),
        ChangeNotifierProvider<RedoFavoriteProvider>(
          create: (_) => RedoFavoriteProvider(),
        ),
      ],
      child: Consumer(
        builder: (context, ThemeProvider themeProvider, child) {
          return MaterialApp(
            navigatorKey: getIt<NavigationService>().navigationKey,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeProvider.themeMode,
            // theme: themState == ThemeMode.dark
            //     ? MyAppTheme.lightTheme
            //     : MyAppTheme.darkTheme,
            home: SplashScreenPvdr(),
          );
        },
      ),
    );
  }
}
