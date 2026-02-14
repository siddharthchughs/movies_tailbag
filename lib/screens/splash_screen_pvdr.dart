import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/widgets/error_widget.dart';

class SplashScreenPvdr extends StatelessWidget {
  const SplashScreenPvdr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: true
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
          : MyErrorWidget(errorText: 'errorText', retryConnection: () {}),
    );
  }
}
