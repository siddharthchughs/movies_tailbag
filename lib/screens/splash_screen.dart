import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/widgets/error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyErrorWidget(errorText: 'errorText', retryConnection: () {}),
        ],
      ),
    );
  }
}
