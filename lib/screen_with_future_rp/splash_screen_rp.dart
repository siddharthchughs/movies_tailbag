// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mvvm_moviecatalog_app/screens_withrppvrd/movie_screen_rpoptmized.dart';
// import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
// import 'package:mvvm_moviecatalog_app/service/navigation_service.dart';
// import 'package:mvvm_moviecatalog_app/viewmodel_riverpod/movie_provider_state.dart';
// import 'package:mvvm_moviecatalog_app/widgets/error_widget.dart';

// final initializationProvider = FutureProvider.autoDispose((ref) async {
//   ref.keepAlive();
//   await Future.microtask(() async {
//     await ref.read(movieStateProvider.notifier).getPopularMovies();
//   });
// });

// class SplashScreenRp extends ConsumerWidget {
//   const SplashScreenRp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final initWatch = ref.watch(initializationProvider);
//     Widget contemt = initWatch.when(
//       data: (data) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           getIt<NavigationService>().navigationReplace(MovieScreenRpoptmized());
//         });
//         return SizedBox.shrink();
//       },
//       error: (error, StackTrace stackTrace) {
//         return MyErrorWidget(
//           errorText: error.toString(),
//           retryConnection: () => ref.refresh(initializationProvider),
//         );
//       },
//       loading: () {
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//     return Scaffold(backgroundColor: Colors.blueAccent.shade200, body: contemt);
//   }
// }
