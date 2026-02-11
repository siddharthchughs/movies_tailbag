import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/repository/movies_repository.dart';
import 'package:mvvm_moviecatalog_app/screens/movie_screen.dart';
import 'package:mvvm_moviecatalog_app/service/init_getit.dart';
import 'package:mvvm_moviecatalog_app/service/navigation_service.dart';
import 'package:mvvm_moviecatalog_app/widgets/error_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  String _errorMessage = '';
  final _movieRespository = getIt<MoviesRepository>();

  Future<void> retryConnection() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      await _movieRespository.getGenres();
      await getIt<NavigationService>().clearStackNavigate(MovieScreen());
    } catch (err) {
      _errorMessage = err.toString();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    retryConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Loading...'),
                  SizedBox(height: 20.0),
                  CircularProgressIndicator(),
                ],
              ),
            )
          : MyErrorWidget(
              errorText: '${_errorMessage}',
              retryConnection: retryConnection,
            ),
    );
  }
}
