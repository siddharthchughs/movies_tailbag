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
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            MyCustomIcons.error,
            color: Colors.amberAccent.shade400,
            size: 48,
          ),
          const SizedBox(height: 20.0),
          Text(
            'Error: $errorText',
            style: TextStyle(color: Colors.lightGreen.shade400, fontSize: 30.0),
          ),
          const SizedBox(height: 20.0),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amberAccent.shade400,
              textStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            onPressed: () {
              retryConnection();
            },
            child: Text(
              'Retry Again',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
