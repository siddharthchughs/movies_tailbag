import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic>? navigateTo(Widget navigate) {
    return navigationKey.currentState?.push(
      MaterialPageRoute(builder: (context) => navigate),
    );
  }

  void showDialog(Widget widget) async {
    await showAdaptiveDialog(
      barrierDismissible: true,
      context: navigationKey.currentContext!,
      builder: (context) => widget,
    );
  }
}
