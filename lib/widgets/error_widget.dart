import 'package:flutter/material.dart';
import 'package:mvvm_moviecatalog_app/constants/my_custom_icons.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
    required this.errorText,
    required this.retryConnection,
  });

  final String errorText;
  final Function retryConnection;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(MyCustomIcons.error, color: Colors.red, size: 48),
        const SizedBox(height: 20.0),
        Text(
          'Error: $errorText',
          style: TextStyle(color: Colors.redAccent.shade400, fontSize: 30.0),
        ),
        const SizedBox(height: 20.0),

        ElevatedButton(
          onPressed: retryConnection(),
          child: Text('Retry Again'),
        ),
      ],
    );
  }
}
