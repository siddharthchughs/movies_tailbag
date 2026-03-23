// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:mvvm_moviecatalog_app/screens/splash_screen_pvdr.dart';
// import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
// import 'package:mvvm_moviecatalog_app/service/navigation_service.dart';
// import 'package:mvvm_moviecatalog_app/viewmodel/favorites_providers.dart';
// import 'package:mvvm_moviecatalog_app/viewmodel/movie_provider.dart';
// import 'package:mvvm_moviecatalog_app/viewmodel/theme_provider.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   setupLocator();
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
//     _,
//   ) async {
//     await dotenv.load(fileName: 'assets/.env');
//     runApp(MyApp());
//   });
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //    final themeProvider = Provider.of<ThemeProvider>(context);

//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ThemeProvider()),
//         ChangeNotifierProvider(create: (_) => MovieProvider()),
//         ChangeNotifierProvider(create: (_) => FavoritesProviders()),
//       ],
//       child: Consumer(
//         builder: (context, ThemeProvider themeProvider, child) {
//           return MaterialApp(
//             navigatorKey: getIt<NavigationService>().navigationKey,
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             theme: themeProvider.themeColorUpdate,
//             home: SplashScreenPvdr(),
//           );
//         },
//       ),
//     );
//   }
// }
